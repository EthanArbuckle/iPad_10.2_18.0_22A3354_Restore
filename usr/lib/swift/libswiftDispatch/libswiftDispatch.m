uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

void protocol witness for Collection.startIndex.getter in conformance DispatchData(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

ValueMetadata *type metadata accessor for DispatchWorkItemFlags()
{
  return &type metadata for DispatchWorkItemFlags;
}

ValueMetadata *type metadata accessor for DispatchQoS()
{
  return &type metadata for DispatchQoS;
}

void destroy for DispatchDataIterator(id *a1)
{

}

uint64_t destructiveInjectEnumTag for DispatchPredicate(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

void static DispatchQoS.unspecified.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 5;
  *(_QWORD *)(a1 + 8) = 0;
}

ValueMetadata *type metadata accessor for DispatchPredicate()
{
  return &type metadata for DispatchPredicate;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance OS_dispatch_queue.Attributes()
{
  return SetAlgebra.init<A>(_:)();
}

_BYTE *destructiveInjectEnumTag for OS_dispatch_queue.GlobalQueuePriority(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void static DispatchWorkItemFlags.barrier.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

ValueMetadata *type metadata accessor for OS_dispatch_queue.Attributes()
{
  return &type metadata for OS_dispatch_queue.Attributes;
}

ValueMetadata *type metadata accessor for DispatchTime()
{
  return &type metadata for DispatchTime;
}

ValueMetadata *type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return &type metadata for OS_dispatch_queue.AutoreleaseFrequency;
}

uint64_t getEnumTagSinglePayload for OS_dispatch_queue.SchedulerOptions(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

ValueMetadata *type metadata accessor for DispatchQoS.QoSClass()
{
  return &type metadata for DispatchQoS.QoSClass;
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  NSObject *v0;

  return dispatch_semaphore_signal(v0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void static DispatchWorkItemFlags.enforceQoS.getter(_QWORD *a1@<X8>)
{
  *a1 = 32;
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
  NSObject *v0;

  dispatch_semaphore_wait(v0, 0xFFFFFFFFFFFFFFFFLL);
}

ValueMetadata *type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return &type metadata for OS_dispatch_queue.SchedulerOptions;
}

ValueMetadata *type metadata accessor for DispatchTimeInterval()
{
  return &type metadata for DispatchTimeInterval;
}

void static DispatchWorkItemFlags.inheritQoS.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

void OS_dispatch_group.notify(queue:work:)(void *a1, uint64_t a2)
{
  void *v2;

  _swift_dispatch_group_notify(v2, a1, *(void **)(a2 + 16));
}

dispatch_time_t static DispatchWallTime.now()@<X0>(dispatch_time_t *a1@<X8>)
{
  dispatch_time_t result;

  result = dispatch_walltime(0, 0);
  *a1 = result;
  return result;
}

void OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)(uint64_t a1, uint64_t a2, char *a3, _BYTE *a4, _BYTE *a5, void *a6)
{
  uint64_t v7;
  uint64_t v8;
  dispatch_autorelease_frequency_t v9;
  NSObject *v10;
  dispatch_autorelease_frequency_t v11;
  NSObject *v12;
  NSObject *v14;
  uint64_t v15;

  v7 = *a3;
  v8 = *((_QWORD *)a3 + 1);
  v9 = (unint64_t)*a5;
  if ((*a4 & 4) != 0)
  {
    v10 = dispatch_queue_attr_make_initially_inactive(0);
    if (!(_DWORD)v9)
      goto LABEL_9;
  }
  else
  {
    v10 = 0;
    if (!*a5)
      goto LABEL_9;
  }
  if ((_DWORD)v9 == DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM)
    v11 = v9;
  else
    v11 = DISPATCH_AUTORELEASE_FREQUENCY_NEVER;
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(v10, v11);

  v10 = v12;
LABEL_9:
  if ((_DWORD)v7 == 5 && v8 == 0)
    goto LABEL_16;
  if (v8 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v8 <= 0x7FFFFFFF)
  {
    v14 = dispatch_queue_attr_make_with_qos_class(v10, (dispatch_qos_class_t)dword_18B5329C8[v7], v8);

    v10 = v14;
LABEL_16:
    v15 = String.utf8CString.getter();
    swift_bridgeObjectRelease();
    dispatch_concurrent_queue_create_with_target_4swift((const char *)(v15 + 32), v10, a6);
    swift_release();

    return;
  }
  __break(1u);
}

dispatch_queue_t dispatch_concurrent_queue_create_with_target_4swift(const char *a1, void *a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;

  v5 = a2;
  v6 = a3;
  v7 = dispatch_queue_create_with_target_V2(a1, v5, v6);

  return v7;
}

void DispatchWorkItem.notify(qos:flags:queue:execute:)(unsigned __int8 *a1, uint64_t *a2, void *a3, void *aBlock)
{
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t inited;
  void *v14;
  uint64_t v15;
  char v16[8];
  uint64_t v17;

  v5 = v4;
  v7 = *a1;
  v8 = *((_QWORD *)a1 + 1);
  v9 = *a2;
  v10 = _Block_copy(aBlock);
  if (v7 == 5 && v8 == 0 && v9 == 0)
  {
    v14 = *(void **)(v5 + 16);
    _Block_copy(v14);
    _swift_dispatch_block_notify(v14, a3, v10);
    _Block_release(v10);
    _Block_release(v14);
  }
  else
  {
    v16[0] = v7;
    v17 = v8;
    v15 = v9;
    type metadata accessor for DispatchWorkItem();
    inited = swift_initStackObject();
    DispatchWorkItem.init(qos:flags:block:)(v16, (dispatch_block_flags_t *)&v15, v10);
    _swift_dispatch_block_notify(*(void **)(v5 + 16), a3, *(void **)(inited + 16));
    swift_release();
  }
}

void _swift_dispatch_block_notify(void *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  dispatch_block_notify(v5, v6, v7);

}

uint64_t type metadata completion function for _DispatchSpecificValue()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for DispatchWorkItemFlags, &type metadata for DispatchWorkItemFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for DispatchWorkItemFlags, &type metadata for DispatchWorkItemFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for DispatchWorkItemFlags, &type metadata for DispatchWorkItemFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for DispatchWorkItemFlags, &type metadata for DispatchWorkItemFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

uint64_t partial apply for closure #2 in OS_dispatch_queue.setSpecific<A>(key:value:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t OS_dispatch_source.setEventHandler(handler:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, _QWORD))
{
  uint64_t v4;

  objc_opt_self();
  v4 = swift_dynamicCastObjCClassUnconditional();
  return a3(v4, *(_QWORD *)(a1 + 16));
}

unint64_t DispatchTime.uptimeNanoseconds.getter()
{
  unint64_t *v0;
  unint64_t v1;
  unint64_t result;

  v1 = *v0;
  if (*v0 == -1)
    return v1;
  if (one-time initialization token for timebaseInfo != -1)
    result = swift_once();
  if ((_DWORD)static DispatchTime.timebaseInfo == HIDWORD(static DispatchTime.timebaseInfo))
    return v1;
  if (!is_mul_ok(v1, static DispatchTime.timebaseInfo))
    return -1;
  if (HIDWORD(static DispatchTime.timebaseInfo))
    return v1 * static DispatchTime.timebaseInfo / HIDWORD(static DispatchTime.timebaseInfo);
  __break(1u);
  return result;
}

uint64_t OS_dispatch_source_timer.scheduleRepeating(deadline:interval:leeway:)(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t result;
  double v6;

  v4 = *(unsigned __int8 *)(a3 + 8);
  objc_opt_self();
  result = swift_dynamicCastObjCClassUnconditional();
  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000)
LABEL_5:
    __asm { BR              X10 }
  v6 = a1 * 1000000000.0;
  if ((~COERCE__INT64(a1 * 1000000000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v6 <= -1.0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v6 < 1.84467441e19)
    goto LABEL_5;
LABEL_8:
  __break(1u);
  return result;
}

BOOL OS_dispatch_semaphore.wait(wallTimeout:)(dispatch_time_t *a1)
{
  NSObject *v1;

  return dispatch_semaphore_wait(v1, *a1) != 0;
}

void OS_dispatch_source_timer.scheduleRepeating(deadline:interval:leeway:)(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  v4 = *((unsigned __int8 *)a2 + 8);
  v5 = *(unsigned __int8 *)(a3 + 8);
  objc_opt_self();
  swift_dynamicCastObjCClassUnconditional();
  if ((_DWORD)v4 != 4 || v3 != 0)
    __asm { BR              X10 }
  __asm { BR              X9 }
}

void sub_18B5242C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  dispatch_time_t v4;
  uint64_t v5;

  if ((unsigned __int128)(v5 * (__int128)1000000000) >> 64 == (1000000000 * v5) >> 63)
    goto LABEL_4;
  if (v5 <= 0)
  {
    do
    {
      __break(1u);
LABEL_4:
      a4 = 1000000000 * v5;
    }
    while (1000000000 * v5 < 0);
  }
  dispatch_source_set_timer(a1, v4, a3, a4);
}

uint64_t partial apply for closure #1 in OS_dispatch_queue.setSpecific<A>(key:value:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return closure #1 in OS_dispatch_queue.setSpecific<A>(key:value:)(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t closure #1 in OS_dispatch_queue.setSpecific<A>(key:value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for _DispatchSpecificValue(0, v9, v10, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  v12 = swift_allocObject();
  result = (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v12 + 80) - 8) + 32))(v12 + *(_QWORD *)(*(_QWORD *)v12 + 88), v8);
  *a3 = v12;
  return result;
}

uint64_t _DispatchSpecificValue.__allocating_init(value:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 80) - 8) + 32))(v2 + *(_QWORD *)(*(_QWORD *)v2 + 88), a1);
  return v2;
}

uint64_t OS_dispatch_queue.setSpecific<A>(key:value:)(const void *a1)
{
  NSObject *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  _BYTE v12[16];
  uint64_t v13;
  void *v14;
  void *context;

  v13 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v3 = v13;
  type metadata accessor for Optional();
  v6 = type metadata accessor for _DispatchSpecificValue(0, v13, v4, v5);
  v7 = MEMORY[0x1E0DEDCE8];
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in OS_dispatch_queue.setSpecific<A>(key:value:), (uint64_t)v12, MEMORY[0x1E0DEDCE8], v6, v8, (uint64_t)&context);
  v14 = context;
  v11[2] = v3;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #2 in OS_dispatch_queue.setSpecific<A>(key:value:), (uint64_t)v11, v7, MEMORY[0x1E0DEBC10], v9, (uint64_t)&context);
  dispatch_queue_set_specific(v1, a1, context, (dispatch_function_t)@objc _destructDispatchSpecificValue(ptr:));
  return swift_release();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x18D77A094](a1, v6, a5);
}

uint64_t type metadata accessor for _DispatchSpecificValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _DispatchSpecificValue);
}

BOOL OS_dispatch_group.wait(wallTimeout:)(dispatch_time_t *a1)
{
  NSObject *v1;

  return dispatch_group_wait(v1, *a1) != 0;
}

void _swift_dispatch_block_cancel(void *a1)
{
  id v1;

  v1 = a1;
  dispatch_block_cancel(v1);

}

uint64_t static OS_dispatch_queue.concurrentPerform(iterations:execute:)(size_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t result;
  _QWORD v9[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  v9[4] = partial apply for thunk for @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32);
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@unowned Int) -> ();
  v9[3] = &block_descriptor_0;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  _swift_dispatch_apply_current(a1, v7);
  _Block_release(v7);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v7 & 1) != 0)
    __break(1u);
  return result;
}

void _swift_dispatch_apply_current(size_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  void *v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___swift_dispatch_apply_current_block_invoke;
  block[3] = &unk_1E2168F38;
  v6 = a2;
  v3 = a2;
  dispatch_apply(a1, 0, block);
  v4 = v6;

}

dispatch_time_t protocol witness for Strideable.advanced(by:) in conformance OS_dispatch_queue.SchedulerTimeType@<X0>(int64_t *a1@<X0>, dispatch_time_t *a2@<X8>)
{
  dispatch_time_t *v2;
  dispatch_time_t result;

  result = dispatch_time(*v2, *a1);
  *a2 = result;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void DispatchTime.advanced(by:)(uint64_t a1)
{
  __asm { BR              X11 }
}

dispatch_time_t sub_18B5247E4@<X0>(dispatch_time_t a1@<X0>, uint64_t a2@<X8>)
{
  dispatch_time_t *v2;
  int64_t v3;
  dispatch_time_t result;

  v3 = 1000000000 * a2;
  if ((unsigned __int128)(a2 * (__int128)1000000000) >> 64 != (1000000000 * a2) >> 63)
  {
    if (a2 > 0)
      v3 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v3 = 0x8000000000000000;
  }
  result = dispatch_time(a1, v3);
  *v2 = result;
  return result;
}

void partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.schedule(after:interval:tolerance:options:_:)()
{
  swift_getObjectType();
  OS_dispatch_source.cancel()();
}

uint64_t OS_dispatch_source.activate()(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;

  objc_opt_self();
  v2 = swift_dynamicCastObjCClassUnconditional();
  return a2(v2);
}

Swift::Void __swiftcall OS_dispatch_source.cancel()()
{
  uint64_t v0;

  OS_dispatch_source.activate()(v0, MEMORY[0x1E0C82F10]);
}

dispatch_time_t + infix(_:_:)@<X0>(dispatch_time_t *a1@<X0>, dispatch_time_t *a2@<X8>, double a3@<D0>)
{
  dispatch_time_t v4;
  int64_t v5;
  dispatch_time_t result;

  v4 = *a1;
  v5 = toInt64Clamped(_:)(a3 * 1000000000.0);
  result = dispatch_time(v4, v5);
  *a2 = result;
  return result;
}

uint64_t toInt64Clamped(_:)(double a1)
{
  uint64_t v1;
  BOOL v3;
  uint64_t result;

  v1 = *(_QWORD *)&a1 & 0x7FF0000000000000;
  v3 = (*(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL) != 0 && v1 == 0x7FF0000000000000;
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a1 < 9.22337204e18 && !v3)
  {
    if (a1 <= -9.22337204e18)
      return 0x8000000000000000;
    if (v1 == 0x7FF0000000000000)
    {
      __break(1u);
    }
    else if (a1 > -9.22337204e18)
    {
      if (a1 < 9.22337204e18)
        return (uint64_t)a1;
LABEL_18:
      __break(1u);
      return result;
    }
    __break(1u);
    goto LABEL_18;
  }
  return result;
}

uint64_t DispatchWorkItem.__deallocating_deinit()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocClassInstance();
}

dispatch_time_t protocol witness for Scheduler.now.getter in conformance OS_dispatch_queue@<X0>(dispatch_time_t *a1@<X8>)
{
  dispatch_time_t result;

  result = dispatch_time(0, 0);
  *a1 = result;
  return result;
}

void + infix(_:_:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

dispatch_time_t sub_18B524A0C@<X0>(dispatch_time_t a1@<X0>, uint64_t a2@<X8>)
{
  dispatch_time_t *v2;
  int64_t v3;
  dispatch_time_t result;

  v3 = 1000000000 * a2;
  if ((unsigned __int128)(a2 * (__int128)1000000000) >> 64 != (1000000000 * a2) >> 63)
  {
    if (a2 > 0)
      v3 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v3 = 0x8000000000000000;
  }
  result = dispatch_time(a1, v3);
  *v2 = result;
  return result;
}

uint64_t DispatchWorkItem.init(flags:block:)(dispatch_block_flags_t *a1, void *aBlock)
{
  uint64_t v2;
  dispatch_block_flags_t v4;
  void *v5;
  id v6;

  v4 = *a1;
  v5 = _Block_copy(aBlock);
  v6 = _swift_dispatch_block_create(v4, v5);
  _Block_release(aBlock);
  _Block_release(v5);
  *(_QWORD *)(v2 + 16) = v6;
  return v2;
}

dispatch_queue_global_t static OS_dispatch_queue.global(qos:)(char *a1)
{
  return dispatch_get_global_queue(qword_18B532998[*a1], 0);
}

dispatch_time_t static DispatchTime.now()@<X0>(dispatch_time_t *a1@<X8>)
{
  dispatch_time_t result;

  result = dispatch_time(0, 0);
  *a1 = result;
  return result;
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t partial apply for closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)()
{
  uint64_t v0;

  return closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)(*(_QWORD *)(v0 + 24), *(void (**)(uint64_t))(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 16));
}

uint64_t closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  v8 = type metadata accessor for Optional();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v14 - v11;
  a2(v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 56))(v12, 0, 1, a5);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 40))(a1, v12, v8);
}

uint64_t partial apply for thunk for @callee_guaranteed () -> (@out A, @error @owned Error)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 24))();
}

void OS_dispatch_group.notify(qos:flags:queue:execute:)(unsigned __int8 *a1, dispatch_block_flags_t *a2, void *a3, void *aBlock)
{
  void *v4;
  void *v5;
  int v7;
  uint64_t v8;
  dispatch_block_flags_t v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  dispatch_block_flags_t v15;
  char v16[8];
  uint64_t v17;

  v5 = v4;
  v7 = *a1;
  v8 = *((_QWORD *)a1 + 1);
  v9 = *a2;
  v10 = _Block_copy(aBlock);
  v11 = v10;
  if (v7 == 5 && v8 == 0)
  {
    if (v9)
    {
      v13 = _Block_copy(v10);
      v14 = _swift_dispatch_block_create(v9, v13);
      _Block_release(v13);
      _Block_release(v11);
      v11 = v14;
    }
  }
  else
  {
    v16[0] = v7;
    v17 = v8;
    v15 = v9;
    type metadata accessor for DispatchWorkItem();
    swift_initStackObject();
    v11 = (void *)*((_QWORD *)DispatchWorkItem.init(qos:flags:block:)(v16, &v15, v11) + 2);
    _Block_copy(v11);
    swift_release();
  }
  _swift_dispatch_group_notify(v5, a3, v11);
  _Block_release(v11);
}

void _swift_dispatch_group_notify(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  id v7;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  dispatch_group_notify(v5, v6, v7);

}

uint64_t protocol witness for Scheduler.schedule(options:_:) in conformance OS_dispatch_queue(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return OS_dispatch_queue.schedule(options:_:)(a1, a2, a3);
}

uint64_t OS_dispatch_queue.schedule(options:_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  unsigned __int8 v14[8];
  uint64_t v15;
  uint64_t aBlock;
  uint64_t v17;
  uint64_t (*v18)();
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v3 = (void *)a1[3];
  if (v3 == (void *)1)
  {
    v4 = 0;
    v5 = 0;
    LOBYTE(v6) = 5;
LABEL_5:
    v20 = a2;
    v21 = a3;
    aBlock = MEMORY[0x1E0C809B0];
    v17 = 1107296256;
    v18 = thunk for @escaping @callee_guaranteed () -> ();
    v19 = &block_descriptor_1;
    v10 = _Block_copy(&aBlock);
    v11 = _Block_copy(v10);
    v14[0] = v6;
    v15 = v5;
    v13 = v4;
    swift_retain();
    OS_dispatch_queue._asyncHelper(group:qos:flags:execute:)(0, v14, (dispatch_block_flags_t *)&v13, v11);
    _Block_release(v11);
    v9 = v10;
    goto LABEL_6;
  }
  v6 = *a1;
  v5 = a1[1];
  v4 = a1[2];
  if (!v3)
    goto LABEL_5;
  v20 = a2;
  v21 = a3;
  aBlock = MEMORY[0x1E0C809B0];
  v17 = 1107296256;
  v18 = thunk for @escaping @callee_guaranteed () -> ();
  v19 = &block_descriptor_3;
  v7 = _Block_copy(&aBlock);
  v8 = _Block_copy(v7);
  v14[0] = v6;
  v15 = v5;
  v13 = v4;
  outlined copy of OS_dispatch_queue.SchedulerOptions?(v6, v5, v4, v3);
  outlined copy of OS_dispatch_queue.SchedulerOptions?(v6, v5, v4, v3);
  swift_retain();
  OS_dispatch_queue._asyncHelper(group:qos:flags:execute:)(v3, v14, (dispatch_block_flags_t *)&v13, v8);
  _Block_release(v8);
  outlined consume of OS_dispatch_queue.SchedulerOptions?(v6, v5, v4, v3);
  outlined consume of OS_dispatch_queue.SchedulerOptions?(v6, v5, v4, v3);
  v9 = v7;
LABEL_6:
  _Block_release(v9);
  return swift_release();
}

void *static OS_dispatch_queue.main.getter()
{
  return _swift_dispatch_get_main_queue();
}

void *_swift_dispatch_get_main_queue()
{
  void *v0;
  id v1;
  id v2;

  v0 = (void *)MEMORY[0x1E0C80D38];
  v1 = MEMORY[0x1E0C80D38];
  v2 = v0;
  return v0;
}

uint64_t OS_dispatch_queue.label.getter()
{
  NSObject *v0;
  const char *label;
  uint64_t result;
  uint64_t v3;

  label = dispatch_queue_get_label(v0);
  result = MEMORY[0x18D7799B0](label);
  if (!v3)
    __break(1u);
  return result;
}

void OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(uint64_t a1, uint64_t a2, char *a3, uint64_t *a4, unsigned __int8 *a5, NSObject *a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_autorelease_frequency_t v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_autorelease_frequency_t v13;
  NSObject *v14;
  NSObject *v16;
  uint64_t v17;

  v7 = *a3;
  v8 = *((_QWORD *)a3 + 1);
  v9 = *a4;
  v10 = (unint64_t)*a5;
  if ((*a4 & 2) != 0)
  {
    v11 = (id)_swift_dispatch_queue_concurrent();
    if ((v9 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v11 = 0;
  if ((v9 & 4) != 0)
  {
LABEL_5:
    v12 = dispatch_queue_attr_make_initially_inactive(v11);

    v11 = v12;
  }
LABEL_6:
  if ((_DWORD)v10)
  {
    if ((_DWORD)v10 == DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM)
      v13 = v10;
    else
      v13 = DISPATCH_AUTORELEASE_FREQUENCY_NEVER;
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(v11, v13);

    v11 = v14;
  }
  if ((_DWORD)v7 == 5 && v8 == 0)
    goto LABEL_18;
  if (v8 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v8 <= 0x7FFFFFFF)
  {
    v16 = dispatch_queue_attr_make_with_qos_class(v11, (dispatch_qos_class_t)dword_18B5329C8[v7], v8);

    v11 = v16;
LABEL_18:
    v17 = String.utf8CString.getter();
    swift_bridgeObjectRelease();
    dispatch_queue_create_with_target_V2((const char *)(v17 + 32), v11, a6);
    swift_release();

    return;
  }
  __break(1u);
}

uint64_t _swift_dispatch_queue_concurrent()
{
  uint64_t v0;
  id v1;

  v0 = MEMORY[0x1E0C80D50];
  v1 = MEMORY[0x1E0C80D50];
  return v0;
}

void protocol witness for Scheduler.schedule(after:interval:tolerance:options:_:) in conformance OS_dispatch_queue(dispatch_time_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t *a6@<X8>)
{
  OS_dispatch_queue.schedule(after:interval:tolerance:options:_:)(a1, a2, a3, a4, a5, a6);
}

void OS_dispatch_queue.schedule(after:interval:tolerance:options:_:)(dispatch_time_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t *a6@<X8>)
{
  void *v6;
  dispatch_time_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[6];

  v10 = *a1;
  v11 = *a2;
  v12 = *a3;
  v13 = _swift_dispatch_source_create_0(v6);
  if (((v12 | v11) & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v14 = v13;
    dispatch_source_set_timer(v13, v10, v11, v12);
    v20[4] = a4;
    v20[5] = a5;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 1107296256;
    v20[2] = thunk for @escaping @callee_guaranteed () -> ();
    v20[3] = &block_descriptor_9;
    v15 = _Block_copy(v20);
    swift_retain();
    specialized OS_dispatch_source.setEventHandler(qos:flags:handler:)(5, 0, 0, v15);
    _Block_release(v15);
    swift_release();
    dispatch_resume(v14);
    *(_QWORD *)(swift_allocObject() + 16) = v14;
    v16 = type metadata accessor for AnyCancellable();
    swift_allocObject();
    v17 = v14;
    v18 = AnyCancellable.init(_:)();
    v19 = MEMORY[0x1E0C95DF0];
    a6[3] = v16;
    a6[4] = v19;

    *a6 = v18;
  }
}

dispatch_source_t _swift_dispatch_source_create(const dispatch_source_type_s *a1, uintptr_t a2, uintptr_t a3, void *a4)
{
  NSObject *v7;
  dispatch_source_t v8;

  v7 = a4;
  v8 = dispatch_source_create(a1, a2, a3, v7);
  if (!v8)
    _swift_dispatch_source_create_abort();

  return v8;
}

dispatch_source_t _swift_dispatch_source_create_0(void *a1)
{
  NSObject *v1;
  dispatch_source_t v2;

  v1 = a1;
  v2 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v1);
  if (!v2)
    _swift_dispatch_source_create_abort();

  return v2;
}

void specialized OS_dispatch_source.setEventHandler(qos:flags:handler:)(char a1, uint64_t a2, uint64_t a3, void *aBlock)
{
  void *v4;
  void *v5;
  void *v9;
  void **v10;
  uint64_t v11;
  char v12[8];
  uint64_t v13;

  v5 = v4;
  v9 = _Block_copy(aBlock);
  if (v9 && (a1 != 5 || a2 || a3))
  {
    v12[0] = a1;
    v13 = a2;
    v11 = a3;
    type metadata accessor for DispatchWorkItem();
    swift_initStackObject();
    _Block_copy(v9);
    v10 = (void **)DispatchWorkItem.init(qos:flags:block:)(v12, (dispatch_block_flags_t *)&v11, v9);
    _swift_dispatch_source_set_event_handler_0(v5, v10[2]);
    swift_release();
    _Block_release(v9);
  }
  else
  {
    _swift_dispatch_source_set_event_handler_0(v5, v9);
    _Block_release(v9);
  }
}

void OS_dispatch_source.setEventHandler(qos:flags:handler:)(unsigned __int8 *a1, uint64_t *a2, void *aBlock, uint64_t a4, void (*a5)(uint64_t, void *))
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16[8];
  uint64_t v17;

  v6 = *a1;
  v7 = *((_QWORD *)a1 + 1);
  v8 = *a2;
  v9 = _Block_copy(aBlock);
  if (!v9 || (v6 == 5 ? (v10 = v7 == 0) : (v10 = 0), v10 ? (v11 = v8 == 0) : (v11 = 0), v11))
  {
    objc_opt_self();
    v14 = swift_dynamicCastObjCClassUnconditional();
    a5(v14, v9);
    _Block_release(v9);
  }
  else
  {
    v16[0] = v6;
    v17 = v7;
    v15 = v8;
    type metadata accessor for DispatchWorkItem();
    swift_initStackObject();
    _Block_copy(v9);
    v12 = DispatchWorkItem.init(qos:flags:block:)(v16, (dispatch_block_flags_t *)&v15, v9);
    objc_opt_self();
    v13 = swift_dynamicCastObjCClassUnconditional();
    a5(v13, (void *)v12[2]);
    swift_release();
    _Block_release(v9);
  }
}

void _swift_dispatch_source_set_event_handler(void *a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = a1;
  v4 = a2;
  dispatch_source_set_event_handler(v3, v4);

}

void _swift_dispatch_source_set_event_handler_0(void *a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = a1;
  v4 = a2;
  dispatch_source_set_event_handler(v3, v4);

}

uint64_t protocol witness for Scheduler.schedule(after:tolerance:options:_:) in conformance OS_dispatch_queue(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OS_dispatch_queue.schedule(after:tolerance:options:_:)(a1, a2, a3, a4, a5);
}

uint64_t OS_dispatch_queue.schedule(after:tolerance:options:_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v12;
  char v13[8];
  uint64_t v14;
  uint64_t v15;
  _QWORD aBlock[6];

  v5 = *a1;
  if (*(_QWORD *)(a3 + 24) == 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 5;
  }
  else
  {
    v7 = *(_QWORD *)(a3 + 8);
    v6 = *(_QWORD *)(a3 + 16);
    v8 = *(_BYTE *)a3;
  }
  aBlock[4] = a4;
  aBlock[5] = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_6;
  v9 = _Block_copy(aBlock);
  v10 = _Block_copy(v9);
  v14 = v7;
  v15 = v5;
  v13[0] = v8;
  v12 = v6;
  swift_retain();
  OS_dispatch_queue._asyncAfterUnsafeHelper(deadline:qos:flags:execute:)(&v15, v13, &v12, v10);
  _Block_release(v10);
  _Block_release(v9);
  return swift_release();
}

void OS_dispatch_queue.asyncAfterUnsafe(deadline:qos:flags:execute:)(dispatch_time_t *a1, uint64_t a2, uint64_t *a3, void *aBlock)
{
  dispatch_time_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 v10[8];
  uint64_t v11;
  dispatch_time_t v12;

  v4 = *a1;
  v5 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *a3;
  v8 = _Block_copy(aBlock);
  v11 = v6;
  v12 = v4;
  v10[0] = v5;
  v9 = v7;
  OS_dispatch_queue._asyncAfterUnsafeHelper(deadline:qos:flags:execute:)(&v12, v10, (dispatch_block_flags_t *)&v9, v8);
  _Block_release(v8);
}

void OS_dispatch_queue._asyncAfterUnsafeHelper(deadline:qos:flags:execute:)(dispatch_time_t *a1, unsigned __int8 *a2, dispatch_block_flags_t *a3, void *aBlock)
{
  void *v4;
  void *v5;
  dispatch_time_t v6;
  int v7;
  uint64_t v8;
  dispatch_block_flags_t v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  dispatch_block_flags_t v15;
  char v16[8];
  uint64_t v17;

  v5 = v4;
  v6 = *a1;
  v7 = *a2;
  v8 = *((_QWORD *)a2 + 1);
  v9 = *a3;
  v10 = _Block_copy(aBlock);
  v11 = v10;
  if (v7 == 5 && v8 == 0)
  {
    if (v9)
    {
      v13 = _Block_copy(v10);
      v14 = _swift_dispatch_block_create(v9, v13);
      _Block_release(v13);
      _Block_release(v11);
      v11 = v14;
    }
  }
  else
  {
    v16[0] = v7;
    v17 = v8;
    v15 = v9;
    type metadata accessor for DispatchWorkItem();
    swift_initStackObject();
    v11 = (void *)*((_QWORD *)DispatchWorkItem.init(qos:flags:block:)(v16, &v15, v11) + 2);
    _Block_copy(v11);
    swift_release();
  }
  _swift_dispatch_after(v6, v5, v11);
  _Block_release(v11);
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return objc_opt_self();
}

void *DispatchWorkItem.init(qos:flags:block:)(char *a1, dispatch_block_flags_t *a2, void *aBlock)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  dispatch_block_flags_t v7;
  void *result;
  const void *v9;
  dispatch_block_t v11;
  dispatch_block_t v12;

  v5 = *a1;
  v6 = *((_QWORD *)a1 + 1);
  v7 = *a2;
  result = _Block_copy(aBlock);
  v9 = result;
  if (v5 == 5 && v6 == 0)
  {
    v11 = _swift_dispatch_block_create(v7, result);
    goto LABEL_9;
  }
  if (v6 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v6 <= 0x7FFFFFFF)
  {
    v11 = _swift_dispatch_block_create_with_qos_class(v7, (dispatch_qos_class_t)dword_18B533C1C[v5], v6, result);
LABEL_9:
    v12 = v11;
    _Block_release(aBlock);
    _Block_release(v9);
    *(_QWORD *)(v3 + 16) = v12;
    return (void *)v3;
  }
  __break(1u);
  return result;
}

dispatch_block_t _swift_dispatch_block_create_with_qos_class(dispatch_block_flags_t a1, dispatch_qos_class_t a2, int a3, void *a4)
{
  id v7;
  dispatch_block_t v8;

  v7 = a4;
  v8 = dispatch_block_create_with_qos_class(a1, a2, a3, v7);

  return v8;
}

void _swift_dispatch_after(dispatch_time_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;

  v5 = a2;
  v6 = a3;
  dispatch_after(a1, v5, v6);

}

void _swift_dispatch_source_set_cancel_handler(void *a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = a1;
  v4 = a2;
  dispatch_source_set_cancel_handler(v3, v4);

}

uint64_t _dispatchPreconditionTest(_:)(uint64_t a1)
{
  NSObject *v2;
  int v3;

  v2 = *(NSObject **)a1;
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3)
  {
    if (v3 == 1)
      dispatch_assert_queue_barrier(v2);
    else
      dispatch_assert_queue_not_V2(v2);
  }
  else
  {
    dispatch_assert_queue_V2(v2);
  }
  return 1;
}

uint64_t OS_dispatch_queue.sync<A>(flags:execute:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  void *v5;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void (*v13)(uint64_t (*)(), char *);
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  _BYTE v19[16];
  uint64_t v20;
  uint64_t v21;

  v10 = *a1;
  if (*a1)
  {
    if (v10 != 1)
    {
      v16 = swift_allocObject();
      *(_QWORD *)(v16 + 16) = v5;
      v21 = v10;
      MEMORY[0x1E0C80A78](v16);
      v20 = a4;
      v17 = v5;
      OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)((void (*)(uint64_t))partial apply for implicit closure #4 in implicit closure #3 in OS_dispatch_queue.sync<A>(flags:execute:), v16, (dispatch_block_flags_t *)&v21, a2, a3, (void (*)(void *))partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), (uint64_t)v19, a4, a5);
      return swift_release();
    }
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v5;
    MEMORY[0x1E0C80A78](v11);
    v20 = a4;
    v12 = v5;
    v13 = (void (*)(uint64_t (*)(), char *))partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.sync<A>(flags:execute:);
  }
  else
  {
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v5;
    MEMORY[0x1E0C80A78](v14);
    v20 = a4;
    v15 = v5;
    v13 = (void (*)(uint64_t (*)(), char *))partial apply for implicit closure #6 in implicit closure #5 in OS_dispatch_queue.sync<A>(flags:execute:);
  }
  OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)(v13, a2, a3, (void (*)(id))partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), (uint64_t)v19, a4, a5);
  return swift_release();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return OS_dispatch_queue.asyncAndWait<A>(execute:)(a1, a2, a3, (void (*)(uint64_t (*)(), char *))partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.sync<A>(execute:), (void (*)(id))partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), a4);
}

uint64_t OS_dispatch_queue.asyncAndWait<A>(execute:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t (*)(), char *)@<X4>, void (*a5)(id)@<X5>, uint64_t a6@<X8>)
{
  void *v6;
  id v13;
  _QWORD v15[4];

  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v15[2] = a3;
  v13 = v6;
  OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)(a4, a1, a2, a5, (uint64_t)v15, a3, a6);
  return swift_release();
}

uint64_t OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)@<X0>(void (*a1)(uint64_t (*)(), char *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, void (*a4)(id)@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(id);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30[16];
  uint64_t v31;
  char *v32;
  uint64_t (*v33)();
  _QWORD *v34;
  id *v35;
  id v36;

  v27 = a7;
  v25 = a5;
  v26 = a4;
  v11 = type metadata accessor for Optional();
  v28 = *(_QWORD *)(v11 - 8);
  v29 = v11;
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v25 - v15;
  v17 = *(_QWORD *)(a6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))((char *)&v25 - v15, 1, 1, a6);
  v36 = 0;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a6;
  v18[3] = a2;
  v18[4] = a3;
  v31 = a6;
  v32 = v16;
  v33 = thunk for @callee_guaranteed () -> (@out A, @error @owned Error)partial apply;
  v34 = v18;
  v35 = &v36;
  a1(partial apply for closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:), v30);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  v21 = v36;
  if (v36)
  {
    v22 = v36;
    v26(v21);

    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v16, v29);
  }
  v24 = v28;
  v23 = v29;
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v14, v16, v29);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, a6);
  if ((_DWORD)result == 1)
    goto LABEL_8;
  (*(void (**)(char *, uint64_t))(v24 + 8))(v16, v23);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v27, v14, a6);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.sync<A>(execute:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)&unk_1E2168DD8, (uint64_t)thunk for @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32)partial apply, (uint64_t)&block_descriptor_41, (void (*)(uint64_t, void *))MEMORY[0x1E0C82F90]);
}

uint64_t implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, void *))
{
  uint64_t v13;
  void *v14;
  uint64_t result;
  _QWORD v16[6];

  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  v16[4] = a5;
  v16[5] = v13;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = thunk for @escaping @callee_guaranteed () -> ();
  v16[3] = a6;
  v14 = _Block_copy(v16);
  swift_retain();
  swift_release();
  a7(a3, v14);
  _Block_release(v14);
  LOBYTE(a7) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((a7 & 1) != 0)
    __break(1u);
  return result;
}

void OS_dispatch_queue.asyncUnsafe(group:qos:flags:execute:)(void *a1, uint64_t a2, uint64_t *a3, void *aBlock)
{
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 v10[8];
  uint64_t v11;

  v5 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *a3;
  v8 = _Block_copy(aBlock);
  v10[0] = v5;
  v11 = v6;
  v9 = v7;
  OS_dispatch_queue._asyncHelper(group:qos:flags:execute:)(a1, v10, (dispatch_block_flags_t *)&v9, v8);
  _Block_release(v8);
}

void OS_dispatch_queue._asyncHelper(group:qos:flags:execute:)(void *a1, unsigned __int8 *a2, dispatch_block_flags_t *a3, void *aBlock)
{
  void *v4;
  void *v5;
  int v7;
  uint64_t v8;
  dispatch_block_flags_t v9;
  void *v10;
  void *v11;
  void *v14;
  id v15;
  id v16;
  dispatch_block_flags_t v17;
  char v18[8];
  uint64_t v19;

  v5 = v4;
  v7 = *a2;
  v8 = *((_QWORD *)a2 + 1);
  v9 = *a3;
  v10 = _Block_copy(aBlock);
  v11 = v10;
  if (a1)
    goto LABEL_10;
  if (v7 != 5 || v8 != 0)
    goto LABEL_10;
  if (v9 == DISPATCH_BLOCK_BARRIER)
  {
    _swift_dispatch_barrier_async(v5, v10);
    goto LABEL_22;
  }
  if (!v9)
  {
    _swift_dispatch_async(v5, v10);
LABEL_22:
    _Block_release(v11);
    return;
  }
LABEL_10:
  if (v7 == 5 && v8 == 0)
  {
    if (v9)
    {
      v14 = _Block_copy(v10);
      v15 = _swift_dispatch_block_create(v9, v14);
      _Block_release(v14);
      _Block_release(v11);
      v11 = v15;
    }
  }
  else
  {
    v18[0] = v7;
    v19 = v8;
    v17 = v9;
    type metadata accessor for DispatchWorkItem();
    swift_initStackObject();
    v11 = (void *)*((_QWORD *)DispatchWorkItem.init(qos:flags:block:)(v18, &v17, v11) + 2);
    _Block_copy(v11);
    swift_release();
  }
  if (a1)
  {
    v16 = a1;
    _swift_dispatch_group_async(v16, v5, v11);
    _Block_release(v11);

  }
  else
  {
    _swift_dispatch_async(v5, v11);
    _Block_release(v11);
  }
}

void _swift_dispatch_async(void *a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = a1;
  v4 = a2;
  dispatch_async(v3, v4);

}

uint64_t static OS_dispatch_queue.getSpecific<A>(key:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *specific;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, char *, uint64_t);
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *a1;
  specific = (char *)dispatch_get_specific(a1);
  if (specific)
  {
    v5 = &specific[*(_QWORD *)(*(_QWORD *)specific + 88)];
    v6 = *(_QWORD *)(v3 + 80);
    v7 = *(_QWORD *)(v6 - 8);
    v8 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 16);
    swift_retain();
    v8(a2, v5, v6);
    swift_release();
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v10 = a2;
    v11 = 0;
    v12 = v6;
  }
  else
  {
    v12 = *(_QWORD *)(v3 + 80);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
    v10 = a2;
    v11 = 1;
  }
  return v9(v10, v11, 1, v12);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.sync<A>(flags:execute:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return implicit closure #2 in implicit closure #1 in OS_dispatch_queue.sync<A>(flags:execute:)(a1, a2, *(NSObject **)(v2 + 16));
}

uint64_t implicit closure #2 in implicit closure #1 in OS_dispatch_queue.sync<A>(flags:execute:)(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t result;
  _QWORD v9[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v9[4] = partial apply for thunk for @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32);
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed () -> ();
  v9[3] = &block_descriptor_27;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  dispatch_barrier_sync(a3, v7);
  _Block_release(v7);
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((a3 & 1) != 0)
    __break(1u);
  return result;
}

id _swift_dispatch_block_create(dispatch_block_flags_t a1, void *a2)
{
  id v3;
  dispatch_block_t v4;

  v3 = a2;
  v4 = dispatch_block_create(a1, v3);

  return v4;
}

void _swift_dispatch_barrier_async(void *a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = a1;
  v4 = a2;
  dispatch_barrier_async(v3, v4);

}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance OS_dispatch_queue.Attributes(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

uint64_t ___swift_dispatch_apply_current_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void static OS_dispatch_queue.Attributes.concurrent.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

uint64_t destructiveInjectEnumTag for DispatchTimeInterval(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int) -> ()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 32))(a2);
}

dispatch_source_t static OS_dispatch_source.makeSignalSource(signal:queue:)(NSObject *a1, void *a2)
{
  return static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)(a1, a2, MEMORY[0x1E0C80DC0]);
}

uint64_t storeEnumTagSinglePayload for OS_dispatch_queue.SchedulerOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

void static DispatchQoS.utility.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 1;
  *(_QWORD *)(a1 + 8) = 0;
}

BOOL static DispatchTime.< infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

Swift::Void __swiftcall DispatchWorkItem.cancel()()
{
  uint64_t v0;

  _swift_dispatch_block_cancel(*(void **)(v0 + 16));
}

void static DispatchQoS.userInitiated.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 3;
  *(_QWORD *)(a1 + 8) = 0;
}

void static DispatchQoS.background.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

void OS_dispatch_source.setEventHandler(qos:flags:handler:)(unsigned __int8 *a1, uint64_t *a2, void *a3, uint64_t a4)
{
  OS_dispatch_source.setEventHandler(qos:flags:handler:)(a1, a2, a3, a4, (void (*)(uint64_t, void *))_swift_dispatch_source_set_event_handler);
}

void OS_dispatch_queue.asyncAfter(wallDeadline:execute:)(dispatch_time_t *a1, uint64_t a2)
{
  void *v2;

  _swift_dispatch_after(*a1, v2, *(void **)(a2 + 16));
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
  uint64_t v0;

  OS_dispatch_source.activate()(v0, MEMORY[0x1E0C82BC0]);
}

Swift::Void __swiftcall OS_dispatch_group.wait()()
{
  NSObject *v0;

  dispatch_group_wait(v0, 0xFFFFFFFFFFFFFFFFLL);
}

dispatch_source_t static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)(dispatch_source_t result, void *a2, const dispatch_source_type_s *a3)
{
  if ((result & 0x80000000) == 0)
    return _swift_dispatch_source_create(a3, result, 0, a2);
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride()
{
  return &type metadata for OS_dispatch_queue.SchedulerTimeType.Stride;
}

void OS_dispatch_queue.async(execute:)(uint64_t a1)
{
  void *v1;

  _swift_dispatch_async(v1, *(void **)(a1 + 16));
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance DispatchTime(_QWORD *a1, _QWORD *a2)
{
  return *a1 >= *a2;
}

ValueMetadata *type metadata accessor for OS_dispatch_source.TimerFlags()
{
  return &type metadata for OS_dispatch_source.TimerFlags;
}

void static DispatchTime.distantFuture.getter(_QWORD *a1@<X8>)
{
  *a1 = -1;
}

void static DispatchQoS.userInteractive.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 4;
  *(_QWORD *)(a1 + 8) = 0;
}

void static DispatchQoS.default.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 2;
  *(_QWORD *)(a1 + 8) = 0;
}

uint64_t getEnumTagSinglePayload for DispatchQoS(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && a1[16])
    return (*(_DWORD *)a1 + 251);
  v3 = *a1;
  v4 = v3 >= 6;
  v5 = v3 - 6;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t dispatch thunk of DispatchWorkItem.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

BOOL static DispatchTimeoutResult.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

Dispatch::DispatchQoS __swiftcall DispatchQoS.init(qosClass:relativePriority:)(Dispatch::DispatchQoS::QoSClass qosClass, Swift::Int relativePriority)
{
  uint64_t v2;
  Dispatch::DispatchQoS result;

  *(_BYTE *)v2 = *(_BYTE *)qosClass;
  *(_QWORD *)(v2 + 8) = relativePriority;
  result.relativePriority = relativePriority;
  result.qosClass = qosClass;
  return result;
}

dispatch_source_t static OS_dispatch_source.makeTimerSource(flags:queue:)(uintptr_t *a1, void *a2)
{
  return _swift_dispatch_source_create(MEMORY[0x1E0C80DD0], 0, *a1, a2);
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
  uint64_t v0;

  OS_dispatch_source.activate()(v0, MEMORY[0x1E0C82EA0]);
}

void static OS_dispatch_source.FileSystemEvent.write.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

uint64_t storeEnumTagSinglePayload for DispatchQoS(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_QWORD *)result = a2 - 251;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 5;
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

ValueMetadata *type metadata accessor for OS_dispatch_source.MemoryPressureEvent()
{
  return &type metadata for OS_dispatch_source.MemoryPressureEvent;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

dispatch_source_t static OS_dispatch_source.makeMemoryPressureSource(eventMask:queue:)(uintptr_t *a1, void *a2)
{
  return _swift_dispatch_source_create(MEMORY[0x1E0C80DA8], 0, *a1, a2);
}

void static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)(uint64_t *a1@<X8>, double a2@<D0>)
{
  double v2;
  uint64_t v3;

  v2 = trunc(a2 * 1000000000.0);
  v3 = 0x8000000000000000;
  if (a2 > 0.0)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (v2 < 9.22337204e18 && v2 > -9.22337204e18)
    v3 = (uint64_t)(a2 * 1000000000.0);
  *a1 = v3;
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance OS_dispatch_queue.Attributes@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

Swift::Void __swiftcall OS_dispatch_source.suspend()()
{
  uint64_t v0;

  OS_dispatch_source.activate()(v0, MEMORY[0x1E0C82F88]);
}

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2;
  uint64_t v3;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0)
    v2 = 0x8000000000000000;
  if ((unsigned __int128)(result * (__int128)1000000000) >> 64 == (1000000000 * result) >> 63)
    v3 = 1000000000 * result;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

uint64_t OS_dispatch_source.setEventHandler(handler:)(uint64_t a1, uint64_t a2)
{
  return OS_dispatch_source.setEventHandler(handler:)(a1, a2, (uint64_t (*)(uint64_t, _QWORD))_swift_dispatch_source_set_event_handler);
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.Attributes, &type metadata for OS_dispatch_queue.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.Attributes, &type metadata for OS_dispatch_queue.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.Attributes, &type metadata for OS_dispatch_queue.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.Attributes, &type metadata for OS_dispatch_queue.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
  }
  return result;
}

uint64_t @objc _destructDispatchSpecificValue(ptr:)(uint64_t result)
{
  if (result)
    return swift_unknownObjectRelease();
  return result;
}

ValueMetadata *type metadata accessor for OS_dispatch_queue.SchedulerTimeType()
{
  return &type metadata for OS_dispatch_queue.SchedulerTimeType;
}

uint64_t getEnumTagSinglePayload for DispatchQoS.QoSClass(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance DispatchQoS(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1);
}

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.milliseconds(_:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2;
  uint64_t v3;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0)
    v2 = 0x8000000000000000;
  if ((unsigned __int128)(result * (__int128)1000000) >> 64 == (1000000 * result) >> 63)
    v3 = 1000000 * result;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

uint64_t DispatchSpecificKey.init()()
{
  uint64_t v0;

  return v0;
}

Dispatch::DispatchQoS::QoSClass_optional __swiftcall DispatchQoS.QoSClass.init(rawValue:)(qos_class_t rawValue)
{
  char *v1;
  char v2;

  v2 = 1;
  switch(rawValue)
  {
    case QOS_CLASS_UNSPECIFIED:
      *v1 = 5;
      break;
    case QOS_CLASS_BACKGROUND:
      v2 = 0;
      goto LABEL_5;
    case QOS_CLASS_UTILITY:
LABEL_5:
      *v1 = v2;
      break;
    case QOS_CLASS_DEFAULT:
      *v1 = 2;
      break;
    case QOS_CLASS_USER_INITIATED:
      *v1 = 3;
      break;
    case QOS_CLASS_USER_INTERACTIVE:
      *v1 = 4;
      break;
    default:
      *v1 = 6;
      break;
  }
  return (Dispatch::DispatchQoS::QoSClass_optional)rawValue;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.TimerFlags, &type metadata for OS_dispatch_source.TimerFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.TimerFlags, &type metadata for OS_dispatch_source.TimerFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.TimerFlags, &type metadata for OS_dispatch_source.TimerFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.TimerFlags, &type metadata for OS_dispatch_source.TimerFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags);
  }
  return result;
}

void static OS_dispatch_queue.Attributes.initiallyInactive.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

ValueMetadata *type metadata accessor for OS_dispatch_queue_serial.Attributes()
{
  return &type metadata for OS_dispatch_queue_serial.Attributes;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType, &type metadata for OS_dispatch_queue.SchedulerTimeType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType, &type metadata for OS_dispatch_queue.SchedulerTimeType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType, &type metadata for OS_dispatch_queue.SchedulerTimeType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType);
  }
  return result;
}

uint64_t protocol witness for SerialExecutor.enqueue(_:) in conformance OS_dispatch_queue_serial_executor()
{
  uint64_t v0;
  uint64_t v1;

  v1 = UnownedJob.init(_:)();
  _swift_job_set_executor_queue(v1, v0);
  _swift_job_priority(v1);
  return dispatch_async_swift_job();
}

{
  MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue_serial_executor);
  return Executor.enqueue(_:)();
}

{
  MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue_serial_executor);
  return Executor.enqueue(_:)();
}

uint64_t _swift_job_set_executor_queue(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t _swift_job_priority(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 33);
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.init(_:)(uint64_t a1)
{
  return ((uint64_t (*)(void))((char *)sub_18B526CF0 + 4 * byte_18B53340A[*(unsigned __int8 *)(a1 + 8)]))();
}

void sub_18B526CF0(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = 1000000000 * v1;
  if ((unsigned __int128)(v1 * (__int128)1000000000) >> 64 != (1000000000 * v1) >> 63)
  {
    v2 = 0x7FFFFFFFFFFFFFFFLL;
    if (v1 <= 0)
      v2 = 0x8000000000000000;
  }
  *a1 = v2;
}

void sub_18B526D30(_QWORD *a1@<X8>)
{
  *a1 = 0x7FFFFFFFFFFFFFFFLL;
}

void OS_dispatch_source.setCancelHandler(qos:flags:handler:)(unsigned __int8 *a1, uint64_t *a2, void *a3, uint64_t a4)
{
  OS_dispatch_source.setEventHandler(qos:flags:handler:)(a1, a2, a3, a4, (void (*)(uint64_t, void *))_swift_dispatch_source_set_cancel_handler);
}

uint64_t getEnumTag for DispatchTimeInterval(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 3u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t type metadata accessor for DispatchSpecificKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DispatchSpecificKey);
}

double one-time initialization function for timebaseInfo()
{
  double result;
  mach_timebase_info v1[2];

  v1[1] = *(mach_timebase_info *)MEMORY[0x1E0C80C00];
  v1[0] = (mach_timebase_info)0x100000001;
  mach_timebase_info(v1);
  result = *(double *)v1;
  static DispatchTime.timebaseInfo = (uint64_t)v1[0];
  return result;
}

ValueMetadata *type metadata accessor for DispatchWallTime()
{
  return &type metadata for DispatchWallTime;
}

uint64_t dispatch thunk of DispatchWorkItem.notify(qos:flags:queue:execute:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

void OS_dispatch_queue.SchedulerTimeType.Stride.init(floatLiteral:)(uint64_t *a1@<X8>, double a2@<D0>)
{
  double v2;
  uint64_t v3;

  v2 = trunc(a2 * 1000000000.0);
  v3 = 0x8000000000000000;
  if (a2 > 0.0)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (v2 < 9.22337204e18 && v2 > -9.22337204e18)
    v3 = (uint64_t)(a2 * 1000000000.0);
  *a1 = v3;
}

uint64_t _DispatchSpecificValue.__deallocating_deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  return swift_deallocClassInstance();
}

uint64_t type metadata completion function for DispatchSpecificKey()
{
  return swift_initClassMetadata2();
}

uint64_t base witness table accessor for Executor in OS_dispatch_queue_serial_executor()
{
  return lazy protocol witness table accessor for type OS_dispatch_queue_serial_executor and conformance OS_dispatch_queue_serial_executor(&lazy protocol witness table cache variable for type OS_dispatch_queue_serial_executor and conformance OS_dispatch_queue_serial_executor, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue_serial_executor);
}

uint64_t OS_dispatch_queue_serial_executor.asUnownedSerialExecutor()()
{
  uint64_t v0;

  lazy protocol witness table accessor for type OS_dispatch_queue_serial_executor and conformance OS_dispatch_queue_serial_executor(&lazy protocol witness table cache variable for type OS_dispatch_queue_serial_executor and conformance OS_dispatch_queue_serial_executor, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue_serial_executor);
  return v0;
}

uint64_t lazy protocol witness table accessor for type OS_dispatch_queue_serial_executor and conformance OS_dispatch_queue_serial_executor(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for OS_dispatch_queue_serial_executor();
    result = MEMORY[0x18D77A0D0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t type metadata accessor for OS_dispatch_queue_serial_executor()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_dispatch_queue_serial_executor;
  if (!lazy cache variable for type metadata for OS_dispatch_queue_serial_executor)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue_serial_executor);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DispatchQoS.QoSClass(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_18B527058 + 4 * byte_18B534077[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_18B52708C + 4 * byte_18B534072[v4]))();
}

uint64_t sub_18B52708C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B527094(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18B52709CLL);
  return result;
}

uint64_t sub_18B5270A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18B5270B0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_18B5270B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B5270BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t DispatchTime.init(uptimeNanoseconds:)@<X0>(uint64_t result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v2;
  unsigned int v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;

  v2 = result;
  if (result == -1)
    goto LABEL_10;
  if (one-time initialization token for timebaseInfo != -1)
    result = swift_once();
  if ((_DWORD)static DispatchTime.timebaseInfo == HIDWORD(static DispatchTime.timebaseInfo))
    goto LABEL_10;
  if (!is_mul_ok(v2, HIDWORD(static DispatchTime.timebaseInfo)))
    goto LABEL_9;
  v4 = static DispatchTime.timebaseInfo - 1;
  if ((_DWORD)static DispatchTime.timebaseInfo)
  {
    v5 = v2 * HIDWORD(static DispatchTime.timebaseInfo);
    v6 = __CFADD__(v5, v4);
    v7 = v5 + v4;
    if (!v6)
    {
      v2 = v7 / static DispatchTime.timebaseInfo;
LABEL_10:
      *a2 = v2;
      return result;
    }
LABEL_9:
    v2 = -1;
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue_serial.Attributes, &type metadata for OS_dispatch_queue_serial.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue_serial.Attributes, &type metadata for OS_dispatch_queue_serial.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue_serial.Attributes, &type metadata for OS_dispatch_queue_serial.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue_serial.Attributes, &type metadata for OS_dispatch_queue_serial.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes);
  }
  return result;
}

intptr_t _swift_dispatch_block_testcancel(void *a1)
{
  id v1;
  intptr_t v2;

  v1 = a1;
  v2 = dispatch_block_testcancel(v1);

  return v2;
}

id partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(void *a1)
{
  return partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(a1);
}

{
  swift_willThrow();
  return a1;
}

uint64_t OS_dispatch_queue.getSpecific<A>(key:)@<X0>(uint64_t *key@<X0>, uint64_t a2@<X8>)
{
  NSObject *v2;
  uint64_t v4;
  char *specific;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, char *, uint64_t);
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *key;
  specific = (char *)dispatch_queue_get_specific(v2, key);
  if (specific)
  {
    v6 = &specific[*(_QWORD *)(*(_QWORD *)specific + 88)];
    v7 = *(_QWORD *)(v4 + 80);
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 16);
    swift_retain();
    v9(a2, v6, v7);
    swift_release();
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
    v11 = a2;
    v12 = 0;
    v13 = v7;
  }
  else
  {
    v13 = *(_QWORD *)(v4 + 80);
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
    v11 = a2;
    v12 = 1;
  }
  return v10(v11, v12, 1, v13);
}

uint64_t dispatch thunk of DispatchWorkItem.isCancelled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

BOOL DispatchWorkItem.isCancelled.getter()
{
  uint64_t v0;

  return _swift_dispatch_block_testcancel(*(void **)(v0 + 16)) != 0;
}

void _swift_dispatch_source_create_abort()
{
  swift_reportError();
  abort();
}

id one-time initialization function for empty()
{
  id result;

  result = (id)_swift_dispatch_data_empty();
  static DispatchData.empty = (uint64_t)result;
  return result;
}

id static DispatchData.empty.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  if (one-time initialization token for empty != -1)
    swift_once();
  v2 = (void *)static DispatchData.empty;
  *a1 = static DispatchData.empty;
  return v2;
}

id DispatchData.init(bytes:)@<X0>(const void *a1@<X0>, size_t a2@<X1>, _QWORD *a3@<X8>)
{
  id v6;
  id result;
  void *v8;

  if (a1)
  {
    v6 = 0;
    _swift_dispatch_data_create(a1, a2, 0, v6);
    _Block_release(v6);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    type metadata accessor for OS_dispatch_data();
    swift_dynamicCast();
    result = v8;
  }
  else
  {
    result = (id)_swift_dispatch_data_empty();
  }
  *a3 = result;
  return result;
}

uint64_t _swift_dispatch_data_empty()
{
  uint64_t v0;
  id v1;

  v0 = MEMORY[0x1E0C80D00];
  v1 = MEMORY[0x1E0C80D00];
  return v0;
}

dispatch_data_t _swift_dispatch_data_create(const void *a1, size_t a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  dispatch_data_t v9;

  v7 = a3;
  v8 = a4;
  v9 = dispatch_data_create(a1, a2, v7, v8);

  return v9;
}

unint64_t type metadata accessor for OS_dispatch_data()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_dispatch_data;
  if (!lazy cache variable for type metadata for OS_dispatch_data)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_data);
  }
  return result;
}

id DispatchData.init(bytes:)@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  size_t v5;
  id v6;
  id result;
  void *v8;

  if (a1)
  {
    v5 = a2 - (_QWORD)a1;
    v6 = 0;
    _swift_dispatch_data_create(a1, v5, 0, v6);
    _Block_release(v6);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    type metadata accessor for OS_dispatch_data();
    swift_dynamicCast();
    result = v8;
  }
  else
  {
    result = (id)_swift_dispatch_data_empty();
  }
  *a3 = result;
  return result;
}

void DispatchData.init(bytesNoCopy:deallocator:)(const void *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v7 = *(id *)(a3 + 8);
  if (v7)
  {
    if (v7 != (id)1)
    {
      v11 = *(id *)a3;
      v9 = *(id *)a3;
      _Block_copy(v7);
      outlined consume of DispatchData.Deallocator(v11, v7);
      if (a1)
        goto LABEL_6;
LABEL_8:
      v10 = (id)_swift_dispatch_data_empty();
      _Block_release(v7);

      goto LABEL_9;
    }
    v8 = _swift_dispatch_data_destructor_munmap();
  }
  else
  {
    v8 = _swift_dispatch_data_destructor_free();
  }
  v7 = v8;
  v9 = 0;
  if (!a1)
    goto LABEL_8;
LABEL_6:
  _swift_dispatch_data_create(a1, a2, v9, v7);
  _bridgeAnyObjectToAny(_:)();
  _Block_release(v7);

  swift_unknownObjectRelease();
  type metadata accessor for OS_dispatch_data();
  swift_dynamicCast();
  v10 = v12;
LABEL_9:
  *a4 = v10;
}

void outlined consume of DispatchData.Deallocator(void *a1, const void *a2)
{
  if ((unint64_t)a2 >= 2)
  {

    _Block_release(a2);
  }
}

void *_swift_dispatch_data_destructor_munmap()
{
  return _Block_copy((const void *)*MEMORY[0x1E0C80CE8]);
}

void *_swift_dispatch_data_destructor_free()
{
  return _Block_copy((const void *)*MEMORY[0x1E0C80CE0]);
}

void DispatchData.init(bytesNoCopy:deallocator:)(const void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v7 = *(id *)(a3 + 8);
  if (v7)
  {
    if (v7 != (id)1)
    {
      v11 = *(id *)a3;
      v9 = *(id *)a3;
      _Block_copy(v7);
      outlined consume of DispatchData.Deallocator(v11, v7);
      if (a1)
        goto LABEL_6;
LABEL_8:
      v10 = (id)_swift_dispatch_data_empty();
      _Block_release(v7);

      goto LABEL_9;
    }
    v8 = _swift_dispatch_data_destructor_munmap();
  }
  else
  {
    v8 = _swift_dispatch_data_destructor_free();
  }
  v7 = v8;
  v9 = 0;
  if (!a1)
    goto LABEL_8;
LABEL_6:
  _swift_dispatch_data_create(a1, a2 - (_QWORD)a1, v9, v7);
  _bridgeAnyObjectToAny(_:)();
  _Block_release(v7);

  swift_unknownObjectRelease();
  type metadata accessor for OS_dispatch_data();
  swift_dynamicCast();
  v10 = v12;
LABEL_9:
  *a4 = v10;
}

size_t DispatchData.count.getter()
{
  dispatch_data_t *v0;

  return dispatch_data_get_size(*v0);
}

void DispatchData.withUnsafeBytes<A, B>(body:)(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject **v4;
  NSObject *v7;
  dispatch_data_t v8;
  uint64_t v9;
  size_t size_ptr;
  void *buffer_ptr[2];

  buffer_ptr[1] = *(void **)MEMORY[0x1E0C80C00];
  v7 = *v4;
  size_ptr = 0;
  buffer_ptr[0] = 0;
  v8 = dispatch_data_create_map(v7, (const void **)buffer_ptr, &size_ptr);
  if (!buffer_ptr[0])
LABEL_10:
    __break(1u);
  v9 = *(_QWORD *)(*(_QWORD *)(a4 - 8) + 72);
  if (!v9)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v9 == -1 && size_ptr == 0x8000000000000000)
    goto LABEL_9;
  a1();

}

uint64_t DispatchData.enumerateBytes(_:)(uint64_t a1, uint64_t a2)
{
  void **v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  _QWORD v10[6];

  v5 = *v2;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = partial apply for closure #1 in DispatchData.enumerateBytesCommon(_:);
  *(_QWORD *)(v7 + 24) = v6;
  v10[4] = partial apply for thunk for @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32);
  v10[5] = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32);
  v10[3] = &block_descriptor;
  v8 = _Block_copy(v10);
  swift_retain();
  swift_release();
  _swift_dispatch_data_apply(v5, v8);
  _Block_release(v8);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v8 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t DispatchData.enumerateBytes(block:)(uint64_t a1, uint64_t a2)
{
  void **v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  _QWORD v10[6];

  v5 = *v2;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = partial apply for closure #1 in DispatchData.enumerateBytesCommon(_:);
  *(_QWORD *)(v7 + 24) = v6;
  v10[4] = thunk for @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32)partial apply;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32);
  v10[3] = &block_descriptor_14;
  v8 = _Block_copy(v10);
  swift_retain();
  swift_release();
  _swift_dispatch_data_apply(v5, v8);
  _Block_release(v8);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v8 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_18B527BC8()
{
  return swift_deallocObject();
}

uint64_t sub_18B527BDC()
{
  return swift_deallocObject();
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*v9)(_QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  _QWORD v12[4];

  v9 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  v12[3] = swift_getObjectType();
  v12[0] = a2;
  swift_unknownObjectRetain();
  v10 = v9(v12, a3, a4, a5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v10;
}

void _swift_dispatch_data_apply(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  id v5;
  _QWORD applier[4];
  void *v7;

  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = ___swift_dispatch_data_apply_block_invoke;
  applier[3] = &unk_1E21689C0;
  v7 = a2;
  v3 = a1;
  v4 = a2;
  dispatch_data_apply(v3, applier);
  v5 = v7;

}

uint64_t sub_18B527CF4()
{
  return swift_deallocObject();
}

BOOL partial apply for closure #1 in DispatchData.enumerateBytesCommon(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, char *);
  char v7;

  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, char *))(v4 + 16);
  v7 = 0;
  v5(a3, a4, a2, &v7);
  return (v7 & 1) == 0;
}

uint64_t sub_18B527D50()
{
  return swift_deallocObject();
}

void DispatchData.append(_:count:)(const void *a1, size_t a2)
{
  NSObject **v2;
  id v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_data_t concat;
  void *v9;

  v5 = 0;
  _swift_dispatch_data_create(a1, a2, 0, v5);
  _Block_release(v5);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  type metadata accessor for OS_dispatch_data();
  swift_dynamicCast();
  v6 = *v2;
  v7 = v9;
  concat = dispatch_data_create_concat(v6, v7);

  *v2 = concat;
}

void DispatchData.append(_:)(dispatch_data_t *a1)
{
  dispatch_data_t *v1;
  dispatch_data_t v2;
  dispatch_data_t concat;

  v2 = *v1;
  concat = dispatch_data_create_concat(*v1, *a1);

  *v1 = concat;
}

void DispatchData.append(_:)(const void *a1, uint64_t a2)
{
  NSObject **v2;
  size_t v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_data_t concat;
  void *v9;

  if (a1)
  {
    v4 = a2 - (_QWORD)a1;
    v5 = 0;
    _swift_dispatch_data_create(a1, v4, 0, v5);
    _Block_release(v5);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    type metadata accessor for OS_dispatch_data();
    swift_dynamicCast();
    v6 = *v2;
    v7 = v9;
    concat = dispatch_data_create_concat(v6, v7);

    *v2 = concat;
  }
}

void DispatchData.append<A>(_:)()
{
  NSObject **v0;
  uint64_t v1;
  uint64_t v2;
  const void *v3;
  size_t v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_data_t concat;
  void *v9;

  v1 = MEMORY[0x18D7799C8]();
  if (v1)
  {
    v3 = (const void *)v1;
    v4 = v2 - v1;
    v5 = 0;
    _swift_dispatch_data_create(v3, v4, 0, v5);
    _Block_release(v5);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    type metadata accessor for OS_dispatch_data();
    swift_dynamicCast();
    v6 = *v0;
    v7 = v9;
    concat = dispatch_data_create_concat(v6, v7);

    *v0 = concat;
  }
}

uint64_t DispatchData._copyBytesHelper(to:from:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  NSObject **v3;
  NSObject *v4;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  char isEscapingClosureAtFileLocation;
  _QWORD aBlock[6];
  uint64_t v14;

  v4 = *v3;
  v14 = 0;
  if (a2 != a3)
  {
    v7 = a3 - a2;
    if (__OFSUB__(a3, a2))
    {
      __break(1u);
    }
    else
    {
      v8 = result;
      v9 = (_QWORD *)swift_allocObject();
      v9[2] = a2;
      v9[3] = a3;
      v9[4] = v7;
      v9[5] = &v14;
      v9[6] = v8;
      v10 = swift_allocObject();
      *(_QWORD *)(v10 + 16) = partial apply for closure #1 in DispatchData._copyBytesHelper(to:from:);
      *(_QWORD *)(v10 + 24) = v9;
      aBlock[4] = thunk for @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool)partial apply;
      aBlock[5] = v10;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool);
      aBlock[3] = &block_descriptor_67;
      v11 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      dispatch_data_apply(v4, v11);
      _Block_release(v11);
      isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      result = swift_release();
      if ((isEscapingClosureAtFileLocation & 1) == 0)
        return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t closure #1 in DispatchData._copyBytesHelper(to:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int64_t a7, int64_t *a8, uint64_t a9)
{
  uint64_t v11;
  uint64_t result;
  size_t v13;
  int64_t v14;

  if (a2 >= a6)
    return 0;
  if (a2 >= a5)
  {
    if (a4 < 1)
      return 1;
    v11 = 0;
  }
  else
  {
    v11 = a5 - a2;
    if (__OFSUB__(a5, a2))
    {
      __break(1u);
      goto LABEL_18;
    }
    if (v11 >= a4)
      return 1;
  }
  if (__OFSUB__(a7, *a8))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (!__OFSUB__(a4, v11))
  {
    if (a4 - v11 >= a7 - *a8)
      v13 = a7 - *a8;
    else
      v13 = a4 - v11;
    result = (uint64_t)memcpy((void *)(a9 + *a8), (const void *)(a3 + v11), v13);
    v14 = *a8 + v13;
    if (!__OFADD__(*a8, v13))
    {
      *a8 = v14;
      return v14 < a7;
    }
    goto LABEL_20;
  }
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool)(uint64_t a1, void *a2)
{
  uint64_t (*v2)(void);
  id v3;
  char v4;

  v2 = *(uint64_t (**)(void))(a1 + 32);
  v3 = a2;
  v4 = v2();

  return v4 & 1;
}

uint64_t DispatchData.copyBytes(to:count:)(uint64_t result, uint64_t a2)
{
  NSObject **v2;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  char isEscapingClosureAtFileLocation;
  _QWORD aBlock[6];
  uint64_t v11;

  if (a2 < 0)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    return result;
  }
  v4 = *v2;
  v11 = 0;
  if (a2)
  {
    v5 = result;
    v6 = (_QWORD *)swift_allocObject();
    v6[2] = 0;
    v6[3] = a2;
    v6[4] = a2;
    v6[5] = &v11;
    v6[6] = v5;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = partial apply for closure #1 in DispatchData._copyBytesHelper(to:from:);
    *(_QWORD *)(v7 + 24) = v6;
    aBlock[4] = partial apply for thunk for @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool);
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool);
    aBlock[3] = &block_descriptor_23;
    v8 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    dispatch_data_apply(v4, v8);
    _Block_release(v8);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      goto LABEL_6;
  }
  return result;
}

uint64_t sub_18B5283A8()
{
  return swift_deallocObject();
}

uint64_t sub_18B5283BC()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t DispatchData.copyBytes(to:count:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  NSObject **v3;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  char isEscapingClosureAtFileLocation;
  _QWORD aBlock[6];
  uint64_t v12;

  if (result)
  {
    if (a3 < 0)
    {
      __break(1u);
    }
    else
    {
      v5 = *v3;
      v12 = 0;
      if (!a3)
        return result;
      v6 = result;
      v7 = (_QWORD *)swift_allocObject();
      v7[2] = 0;
      v7[3] = a3;
      v7[4] = a3;
      v7[5] = &v12;
      v7[6] = v6;
      v8 = swift_allocObject();
      *(_QWORD *)(v8 + 16) = partial apply for closure #1 in DispatchData._copyBytesHelper(to:from:);
      *(_QWORD *)(v8 + 24) = v7;
      aBlock[4] = thunk for @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool)partial apply;
      aBlock[5] = v8;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool);
      aBlock[3] = &block_descriptor_34;
      v9 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      dispatch_data_apply(v5, v9);
      _Block_release(v9);
      isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      result = swift_release();
      if ((isEscapingClosureAtFileLocation & 1) == 0)
        return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_18B528534()
{
  return swift_deallocObject();
}

uint64_t sub_18B528544()
{
  return swift_deallocObject();
}

uint64_t DispatchData.copyBytes(to:from:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  NSObject **v3;
  NSObject *v4;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  char isEscapingClosureAtFileLocation;
  _QWORD aBlock[6];
  uint64_t v14;

  v4 = *v3;
  v14 = 0;
  if (a2 != a3)
  {
    v7 = a3 - a2;
    if (__OFSUB__(a3, a2))
    {
      __break(1u);
    }
    else
    {
      v8 = result;
      v9 = (_QWORD *)swift_allocObject();
      v9[2] = a2;
      v9[3] = a3;
      v9[4] = v7;
      v9[5] = &v14;
      v9[6] = v8;
      v10 = swift_allocObject();
      *(_QWORD *)(v10 + 16) = partial apply for closure #1 in DispatchData._copyBytesHelper(to:from:);
      *(_QWORD *)(v10 + 24) = v9;
      aBlock[4] = thunk for @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool)partial apply;
      aBlock[5] = v10;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool);
      aBlock[3] = &block_descriptor_45;
      v11 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      dispatch_data_apply(v4, v11);
      _Block_release(v11);
      isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      result = swift_release();
      if ((isEscapingClosureAtFileLocation & 1) == 0)
        return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_18B5286A0()
{
  return swift_deallocObject();
}

uint64_t sub_18B5286B0()
{
  return swift_deallocObject();
}

uint64_t DispatchData.copyBytes(to:from:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject **v4;
  NSObject *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  char isEscapingClosureAtFileLocation;
  _QWORD aBlock[6];
  uint64_t v14;

  if (result)
  {
    v7 = *v4;
    v14 = 0;
    if (a3 != a4)
    {
      if (__OFSUB__(a4, a3))
      {
        __break(1u);
      }
      else
      {
        v8 = result;
        v9 = (_QWORD *)swift_allocObject();
        v9[2] = a3;
        v9[3] = a4;
        v9[4] = a4 - a3;
        v9[5] = &v14;
        v9[6] = v8;
        v10 = swift_allocObject();
        *(_QWORD *)(v10 + 16) = partial apply for closure #1 in DispatchData._copyBytesHelper(to:from:);
        *(_QWORD *)(v10 + 24) = v9;
        aBlock[4] = thunk for @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool)partial apply;
        aBlock[5] = v10;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 1107296256;
        aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool);
        aBlock[3] = &block_descriptor_56;
        v11 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
        dispatch_data_apply(v7, v11);
        _Block_release(v11);
        isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
        swift_release();
        result = swift_release();
        if ((isEscapingClosureAtFileLocation & 1) == 0)
          return result;
      }
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_18B528810()
{
  return swift_deallocObject();
}

uint64_t sub_18B528820()
{
  return swift_deallocObject();
}

int64_t DispatchData.copyBytes<A>(to:from:)(uint64_t a1, uint64_t a2, uint64_t a3, int64_t a4, char a5, uint64_t a6)
{
  dispatch_data_t *v6;
  int64_t result;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  result = dispatch_data_get_size(*v6);
  if (result < 1)
    return 0;
  if ((a5 & 1) == 0)
  {
    v14 = a4 - a3;
    if (a4 == a3)
      return 0;
    if (result >= a4 && ((a4 | a3) & 0x8000000000000000) == 0 && result > a3)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a6 - 8) + 72);
      if ((unsigned __int128)(a2 * (__int128)v18) >> 64 == (a2 * v18) >> 63)
      {
        if (v14 >= a2 * v18)
          v14 = a2 * v18;
        v17 = a3 + v14;
        if (!__OFADD__(a3, v14))
        {
          if (v17 >= a3)
            goto LABEL_19;
LABEL_28:
          __break(1u);
          goto LABEL_29;
        }
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v16 = *(_QWORD *)(*(_QWORD *)(a6 - 8) + 72);
  if ((unsigned __int128)(a2 * (__int128)v16) >> 64 != (a2 * v16) >> 63)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result >= a2 * v16)
    v17 = a2 * v16;
  else
    v17 = result;
  if (v17 < 0)
    goto LABEL_24;
  a3 = 0;
LABEL_19:
  v15 = v17 - a3;
  if (v17 == a3)
    return v15;
  result = MEMORY[0x18D779A10](a1, a2, a6);
  if (result)
  {
    DispatchData._copyBytesHelper(to:from:)(result, a3, v17);
    return v15;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t DispatchData.subscript.getter(size_t location)
{
  NSObject **v1;
  NSObject *v3;
  NSObject *v4;
  dispatch_data_t v5;
  uint64_t v6;
  size_t v8;
  size_t offset_ptr;
  void *buffer_ptr[2];

  buffer_ptr[1] = *(void **)MEMORY[0x1E0C80C00];
  v3 = *v1;
  offset_ptr = 0;
  v4 = dispatch_data_copy_region(v3, location, &offset_ptr);
  buffer_ptr[0] = 0;
  v8 = 0;
  v5 = dispatch_data_create_map(v4, (const void **)buffer_ptr, &v8);
  if (!buffer_ptr[0])
LABEL_5:
    __break(1u);
  if (__OFSUB__(location, offset_ptr))
  {
    __break(1u);
    goto LABEL_5;
  }
  v6 = *((unsigned __int8 *)buffer_ptr[0] + location - offset_ptr);

  return v6;
}

id DispatchData.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void **v3;
  void *v4;

  v4 = *v3;
  a3[1] = a2;
  a3[2] = v4;
  *a3 = a1;
  return v4;
}

dispatch_data_t DispatchData.subdata(in:)@<X0>(dispatch_data_t offset@<X0>, uint64_t a2@<X1>, dispatch_data_t *a3@<X8>)
{
  dispatch_data_t *v3;

  if (__OFSUB__(a2, offset))
  {
    __break(1u);
  }
  else
  {
    offset = dispatch_data_create_subrange(*v3, (size_t)offset, a2 - (_QWORD)offset);
    *a3 = offset;
  }
  return offset;
}

size_t DispatchData.region(location:)(dispatch_data_t *a1, size_t a2)
{
  NSObject **v2;
  NSObject *v4;
  size_t v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = *v2;
  v6[0] = 0;
  *a1 = dispatch_data_copy_region(v4, a2, v6);
  return v6[0];
}

uint64_t DispatchData.startIndex.getter()
{
  return 0;
}

Swift::Int __swiftcall DispatchData.index(before:)(Swift::Int before)
{
  BOOL v1;
  Swift::Int result;

  v1 = __OFSUB__(before, 1);
  result = before - 1;
  if (v1)
    __break(1u);
  return result;
}

Swift::Int __swiftcall DispatchData.index(after:)(Swift::Int after)
{
  BOOL v1;
  Swift::Int result;

  v1 = __OFADD__(after, 1);
  result = after + 1;
  if (v1)
    __break(1u);
  return result;
}

dispatch_data_t DispatchData.makeIterator()@<X0>(dispatch_data_t *a1@<X8>)
{
  NSObject **v1;
  NSObject *v3;
  dispatch_data_t result;
  NSObject *v5;
  size_t v6;
  NSObject *v7;
  size_t v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = *v1;
  v7 = 0;
  v8[0] = 0;
  result = dispatch_data_create_map(v3, (const void **)&v7, v8);
  v5 = v7;
  v6 = v8[0];
  *a1 = result;
  a1[1] = v5;
  a1[2] = (dispatch_data_t)v6;
  a1[3] = 0;
  return result;
}

void DispatchDataIterator.init(_data:)(NSObject **a1@<X0>, dispatch_data_t *a2@<X8>)
{
  NSObject *v3;
  dispatch_data_t map;
  NSObject *v5;
  size_t v6;
  NSObject *v7;
  size_t v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v7 = 0;
  v8[0] = 0;
  map = dispatch_data_create_map(v3, (const void **)&v7, v8);

  v5 = v7;
  v6 = v8[0];
  *a2 = map;
  a2[1] = v5;
  a2[2] = (dispatch_data_t)v6;
  a2[3] = 0;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance DispatchData()
{
  id *v0;

  return *v0;
}

id DispatchData._bridgeToObjectiveC()()
{
  id *v0;

  return *v0;
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance DispatchData(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

id static DispatchData._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance DispatchData(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

uint64_t static DispatchData._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance DispatchData@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id static DispatchData._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance DispatchData@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFSUB__(*result, 1))
    __break(1u);
  else
    *a2 = *result - 1;
  return result;
}

_QWORD *protocol witness for BidirectionalCollection.formIndex(before:) in conformance DispatchData(_QWORD *result)
{
  if (__OFSUB__(*result, 1))
    __break(1u);
  else
    --*result;
  return result;
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:) in conformance DispatchData@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = specialized BidirectionalCollection.index(_:offsetBy:)(*a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for BidirectionalCollection.distance(from:to:) in conformance DispatchData(uint64_t *a1, uint64_t *a2)
{
  return specialized BidirectionalCollection.distance(from:to:)(*a1, *a2);
}

size_t protocol witness for Collection.endIndex.getter in conformance DispatchData@<X0>(size_t *a1@<X8>)
{
  dispatch_data_t *v1;
  size_t result;

  result = dispatch_data_get_size(*v1);
  *a1 = result;
  return result;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance DispatchData(_BYTE *a1, size_t *a2))()
{
  *a1 = DispatchData.subscript.getter(*a2);
  return protocol witness for Collection.subscript.read in conformance DispatchData;
}

id protocol witness for Collection.subscript.getter in conformance DispatchData@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  void **v2;
  void *v3;

  v3 = *v2;
  *(_QWORD *)(a2 + 16) = *v2;
  *(_OWORD *)a2 = *a1;
  return v3;
}

NSObject *protocol witness for Collection.indices.getter in conformance DispatchData@<X0>(NSObject **a1@<X8>)
{
  NSObject **v1;
  NSObject *v3;

  v3 = *v1;
  *a1 = *v1;
  a1[1] = 0;
  a1[2] = dispatch_data_get_size(v3);
  return v3;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance DispatchData()
{
  dispatch_data_t *v0;

  return dispatch_data_get_size(*v0) == 0;
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance DispatchData(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance DispatchData@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance DispatchData(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;

  v2 = *result;
  v3 = a2[1];
  if (*result >= *a2)
  {
    v5 = __OFSUB__(v2, v3);
    v4 = v2 - v3 < 0;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  if (v4 == v5)
    __break(1u);
  return result;
}

_QWORD *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance DispatchData(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < *result)
    __break(1u);
  return result;
}

{
  if (*result < *a2 || a2[1] < result[1])
    __break(1u);
  return result;
}

_QWORD *protocol witness for Collection.index(after:) in conformance DispatchData@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    *a2 = *result + 1;
  return result;
}

_QWORD *protocol witness for Collection.formIndex(after:) in conformance DispatchData(_QWORD *result)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    ++*result;
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance DispatchData(dispatch_data_t *a1@<X8>)
{
  NSObject **v1;
  NSObject *v3;
  dispatch_data_t map;
  NSObject *v5;
  size_t v6;
  NSObject *v7;
  size_t v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = *v1;
  v7 = 0;
  v8[0] = 0;
  map = dispatch_data_create_map(v3, (const void **)&v7, v8);

  v5 = v7;
  v6 = v8[0];
  *a1 = map;
  a1[1] = v5;
  a1[2] = (dispatch_data_t)v6;
  a1[3] = 0;
}

size_t protocol witness for Sequence.underestimatedCount.getter in conformance DispatchData()
{
  dispatch_data_t *v0;

  return dispatch_data_get_size(*v0);
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance DispatchData()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance DispatchData()
{
  NSObject **v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  v3 = v2;

  return v3;
}

size_t protocol witness for Sequence._copyContents(initializing:) in conformance DispatchData(dispatch_data_t *a1, _BYTE *a2, size_t a3)
{
  dispatch_data_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance DispatchData()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

Swift::UInt8_optional __swiftcall DispatchDataIterator.next()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  __int16 v3;
  uint64_t v4;
  Swift::UInt8_optional v5;

  v2 = v0[2];
  v1 = v0[3];
  if (v1 != v2)
  {
    v4 = v0[1];
    if (v4)
    {
      if (!__OFADD__(v1, 1))
      {
        v3 = *(unsigned __int8 *)(v4 + v1);
        v0[3] = v1 + 1;
        return (Swift::UInt8_optional)(v3 | ((v1 == v2) << 8));
      }
      __break(1u);
    }
    __break(1u);
    return v5;
  }
  v3 = 0;
  return (Swift::UInt8_optional)(v3 | ((v1 == v2) << 8));
}

unint64_t lazy protocol witness table accessor for type DispatchData and conformance DispatchData()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DispatchData and conformance DispatchData;
  if (!lazy protocol witness table cache variable for type DispatchData and conformance DispatchData)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for DispatchData, &type metadata for DispatchData);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchData and conformance DispatchData);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DispatchData and conformance DispatchData;
  if (!lazy protocol witness table cache variable for type DispatchData and conformance DispatchData)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for DispatchData, &type metadata for DispatchData);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchData and conformance DispatchData);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DispatchData and conformance DispatchData;
  if (!lazy protocol witness table cache variable for type DispatchData and conformance DispatchData)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for DispatchData, &type metadata for DispatchData);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchData and conformance DispatchData);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DispatchData and conformance DispatchData;
  if (!lazy protocol witness table cache variable for type DispatchData and conformance DispatchData)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for DispatchData, &type metadata for DispatchData);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchData and conformance DispatchData);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in DispatchData()
{
  return lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<DispatchData>, (uint64_t (*)(void))lazy protocol witness table accessor for type DispatchData and conformance DispatchData, MEMORY[0x1E0DEA220]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x18D77A0C4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in DispatchData()
{
  return lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<DispatchData> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<DispatchData>, (uint64_t (*)(void))lazy protocol witness table accessor for type DispatchData and conformance DispatchData, MEMORY[0x1E0DEDE40]);
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in DispatchData()
{
  return lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<DispatchData>, (uint64_t (*)(void))lazy protocol witness table accessor for type DispatchData and conformance DispatchData, MEMORY[0x1E0DEA210]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in DispatchData()
{
  return lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<DispatchData> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<DispatchData>, (uint64_t (*)(void))lazy protocol witness table accessor for type DispatchData and conformance DispatchData, MEMORY[0x1E0DEDE28]);
}

uint64_t lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x18D77A0D0](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in DispatchData()
{
  return MEMORY[0x1E0DEB430];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in DispatchData()
{
  return lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<DispatchData> and conformance DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<DispatchData>, MEMORY[0x1E0DEA228]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in DispatchData()
{
  return lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<DispatchData> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<DispatchData>, MEMORY[0x1E0DEDE48]);
}

uint64_t lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance DefaultIndices<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x18D77A0D0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DispatchDataIterator and conformance DispatchDataIterator()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DispatchDataIterator and conformance DispatchDataIterator;
  if (!lazy protocol witness table cache variable for type DispatchDataIterator and conformance DispatchDataIterator)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for DispatchDataIterator, &type metadata for DispatchDataIterator);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchDataIterator and conformance DispatchDataIterator);
  }
  return result;
}

void protocol witness for IteratorProtocol.next() in conformance DispatchDataIterator(_BYTE *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v3 = v1[2];
  v2 = v1[3];
  if (v2 == v3)
  {
    v4 = 0;
LABEL_6:
    *a1 = v4;
    a1[1] = v2 == v3;
    return;
  }
  v5 = v1[1];
  if (v5)
  {
    if (!__OFADD__(v2, 1))
    {
      v4 = *(_BYTE *)(v5 + v2);
      v1[3] = v2 + 1;
      goto LABEL_6;
    }
    __break(1u);
  }
  __break(1u);
}

__n128 protocol witness for Sequence.makeIterator() in conformance DispatchDataIterator@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;

  v2 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  result = *(__n128 *)(v1 + 8);
  *(__n128 *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 24) = v2;
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance DispatchDataIterator()
{
  return 0;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance DispatchDataIterator()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)v0;
  specialized _copySequenceToContiguousArray<A>(_:)(*(void **)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  v3 = v2;

  return v3;
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance DispatchDataIterator(_QWORD *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3, v3[1], v3[2], v3[3]);
}

ValueMetadata *type metadata accessor for DispatchData()
{
  return &type metadata for DispatchData;
}

void destroy for DispatchData.Deallocator(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 8);
  if ((unint64_t)v1 >= 0xFFFFFFFF)
  {

    _Block_release(v1);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for DispatchData.Deallocator(uint64_t a1, uint64_t a2)
{
  const void *v3;
  void *v4;
  id v5;

  v3 = *(const void **)(a2 + 8);
  if ((unint64_t)v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v4 = *(void **)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    v5 = v4;
    _Block_copy(v3);
    *(_QWORD *)(a1 + 8) = v3;
  }
  return a1;
}

uint64_t assignWithCopy for DispatchData.Deallocator(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  const void *v8;
  const void *v9;
  void *v10;
  const void *v11;
  id v12;

  v4 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      v10 = *(void **)a2;
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v11 = *(const void **)(a2 + 8);
      v12 = v10;
      _Block_copy(v11);
      *(_QWORD *)(a1 + 8) = v11;
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  v5 = *(void **)a1;
  if (v4 < 0xFFFFFFFF)
  {

    _Block_release(*(const void **)(a1 + 8));
    goto LABEL_7;
  }
  v6 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v7 = v6;

  v8 = *(const void **)(a2 + 8);
  _Block_copy(v8);
  v9 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  _Block_release(v9);
  return a1;
}

uint64_t assignWithTake for DispatchData.Deallocator(uint64_t a1, uint64_t a2)
{
  const void *v4;
  unint64_t v5;
  id v6;

  v4 = *(const void **)(a1 + 8);
  if ((unint64_t)v4 < 0xFFFFFFFF)
    goto LABEL_5;
  v5 = *(_QWORD *)(a2 + 8);
  if (v5 < 0xFFFFFFFF)
  {

    _Block_release(v4);
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  v6 = *(id *)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = v5;
  _Block_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DispatchData.Deallocator(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DispatchData.Deallocator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t getEnumTag for DispatchData.Deallocator(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *destructiveInjectEnumTag for DispatchData.Deallocator(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for DispatchData.Deallocator()
{
  return &type metadata for DispatchData.Deallocator;
}

uint64_t initializeBufferWithCopyOfBuffer for DispatchDataIterator(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for DispatchDataIterator(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for DispatchDataIterator(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for DispatchDataIterator(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for DispatchDataIterator(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DispatchDataIterator(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DispatchDataIterator()
{
  return &type metadata for DispatchDataIterator;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance qos_class_t(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance qos_class_t(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

void specialized _copyCollectionToContiguousArray<A>(_:)(NSObject *a1)
{
  int64_t size;
  size_t v3;
  uint64_t v4;
  size_t v5;
  size_t v6;
  dispatch_data_t v7;

  size = dispatch_data_get_size(a1);
  if (size)
  {
    v3 = size;
    if (size <= 0)
    {
      v4 = MEMORY[0x1E0DEE9D8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
      v4 = swift_allocObject();
      v5 = _swift_stdlib_malloc_size((const void *)v4);
      *(_QWORD *)(v4 + 16) = v3;
      *(_QWORD *)(v4 + 24) = 2 * v5 - 64;
    }
    v6 = specialized Sequence._copySequenceContents(initializing:)(&v7, (_BYTE *)(v4 + 32), v3, a1);

    if (v6 != v3)
      __break(1u);
  }
}

_QWORD *specialized Sequence._copySequenceContents(initializing:)(_QWORD *result, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  uint64_t v18;
  char v19;

  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
LABEL_6:
    *result = a4;
    result[1] = a5;
    result[2] = a6;
    result[3] = a7;
    return (_QWORD *)a3;
  }
  if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    v7 = a6 - a7;
    if (a6 == a7)
    {
LABEL_5:
      a3 = 0;
      goto LABEL_6;
    }
    if (a5)
    {
      if (a7 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_24:
        __break(1u);
LABEL_25:
        a7 = a6;
        a3 = v7;
      }
      else
      {
        v8 = a7 + 1;
        v9 = ~a7 + a6;
        if (v9 >= 0x7FFFFFFFFFFFFFFELL - a7)
          v9 = 0x7FFFFFFFFFFFFFFELL - a7;
        if (v9 >= a3 - 1)
          v9 = a3 - 1;
        v10 = v9 + 1;
        if (v10 > 0x10 && (unint64_t)&a2[-a7 - a5] >= 0x10)
        {
          v13 = a2;
          v14 = v10 & 0xF;
          if ((v10 & 0xF) == 0)
            v14 = 16;
          v15 = v10 - v14;
          v8 += v10 - v14;
          a2 += v10 - v14;
          v12 = v10 - v14 + a7;
          v11 = v15 + 1;
          v16 = (__int128 *)(a5 + a7);
          do
          {
            v17 = *v16++;
            *v13++ = v17;
            v15 -= 16;
          }
          while (v15);
        }
        else
        {
          v11 = 1;
          v12 = a7;
        }
        v18 = 0x8000000000000000 - a7;
        a7 = v12;
        while (1)
        {
          v19 = *(_BYTE *)(a5 + a7);
          a7 = v8;
          *a2 = v19;
          if (a3 == v11)
            break;
          if (v7 == v11)
            goto LABEL_25;
          ++v11;
          ++a2;
          ++v8;
          if (v18 == v11)
            goto LABEL_24;
        }
      }
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

size_t specialized Sequence._copySequenceContents(initializing:)(dispatch_data_t *a1, _BYTE *a2, size_t a3, dispatch_data_t data)
{
  dispatch_data_t map;
  _BYTE *v9;
  size_t v10;
  size_t result;
  size_t v12;
  unint64_t v13;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  unint64_t v18;
  _OWORD *v19;
  __int128 *v20;
  __int128 v21;
  _BYTE *v22;
  _BYTE *v23;
  size_t v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24[0] = 0;
  map = dispatch_data_create_map(data, (const void **)&v23, v24);

  v9 = v23;
  v10 = v24[0];
  if (!a2)
  {
    result = 0;
LABEL_23:
    *a1 = map;
    a1[1] = (dispatch_data_t)v9;
    a1[2] = (dispatch_data_t)v10;
    a1[3] = (dispatch_data_t)result;
    return result;
  }
  if (!a3)
  {
LABEL_22:
    result = a3;
    goto LABEL_23;
  }
  if ((a3 & 0x8000000000000000) != 0)
    __break(1u);
  result = v24[0];
  if (!v24[0])
    goto LABEL_23;
  if (v23)
  {
    *a2 = *v23;
    if (a3 != 1)
    {
      v12 = a3 - 2;
      if (a3 - 2 >= v10 - 1)
        v12 = v10 - 1;
      v13 = v12 + 1;
      if (v13 >= 0x11 && (unint64_t)(a2 - v9) > 0xF)
      {
        v17 = v13 & 0xF;
        if ((v13 & 0xF) == 0)
          v17 = 16;
        v18 = v13 - v17;
        v16 = &a2[v13 - v17];
        v15 = v18 + 1;
        v19 = a2 + 1;
        v20 = (__int128 *)(v9 + 1);
        do
        {
          v21 = *v20++;
          *v19++ = v21;
          v18 -= 16;
        }
        while (v18);
      }
      else
      {
        v15 = 1;
        v16 = a2;
      }
      v22 = v16 + 1;
      while (v10 != v15)
      {
        *v22++ = v9[v15];
        if (a3 == ++v15)
          goto LABEL_22;
      }
      result = v10;
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

void specialized _copySequenceToContiguousArray<A>(_:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  size_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v9;
  _BYTE *v10;
  char v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  unint64_t v17;
  size_t v18;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;

  v5 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (a4 == a3)
  {
    v4 = 0;
  }
  else
  {
    v6 = a4;
    v24 = a1;
    if (!a2)
    {
LABEL_33:
      __break(1u);
      return;
    }
    v9 = v6 + 1;
    if (!__OFADD__(v6, 1))
    {
      v4 = 0;
      v10 = v5 + 4;
      while (1)
      {
        v11 = *(_BYTE *)(a2 + v6);
        if (!v4)
        {
          v12 = v5[3];
          if ((uint64_t)((v12 >> 1) + 0x4000000000000000) < 0)
            goto LABEL_31;
          v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
          if (v13 <= 1)
            v14 = 1;
          else
            v14 = v13;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
          v15 = (_QWORD *)swift_allocObject();
          v16 = 2 * _swift_stdlib_malloc_size(v15) - 64;
          v15[2] = v14;
          v15[3] = v16;
          v17 = (unint64_t)(v15 + 4);
          v18 = v5[3] >> 1;
          if (v5[2])
          {
            if (v15 != v5 || v17 >= (unint64_t)v5 + v18 + 32)
              memmove(v15 + 4, v5 + 4, v18);
            v5[2] = 0;
          }
          v10 = (_BYTE *)(v17 + v18);
          v4 = (v16 >> 1) - v18;
          swift_release();
          v5 = v15;
        }
        v20 = __OFSUB__(v4--, 1);
        if (v20)
          break;
        *v10 = v11;
        if (v9 == a3)
          goto LABEL_25;
        v6 = v9;
        ++v10;
        v20 = __OFADD__(v9++, 1);
        if (v20)
          goto LABEL_24;
      }
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
LABEL_24:
    __break(1u);
LABEL_25:

  }
  v21 = v5[3];
  if (v21 < 2)
    return;
  v22 = v21 >> 1;
  v20 = __OFSUB__(v22, v4);
  v23 = v22 - v4;
  if (v20)
    goto LABEL_32;
  v5[2] = v23;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x18D77A0B8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t specialized BidirectionalCollection.distance(from:to:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v4 = a2 - a1;
  v3 = a2 < a1;
  if (a2 <= a1)
  {
    result = 0;
    if (!v3)
      return result;
    v7 = ~a2 + a1;
    v8 = a1 ^ 0x8000000000000000;
    if (v7 >= v8)
      v7 = v8;
    v9 = 0x8000000000000000;
    if (v7 < 0x8000000000000000)
      v9 = v7;
    while ((v7 & 0x8000000000000000) == 0)
    {
      if (v8 == v9)
        goto LABEL_18;
      if (v4 == --result)
        return result;
    }
  }
  else
  {
    result = 0;
    v6 = ~a1 + a2;
    while (v6 <= 0x7FFFFFFFFFFFFFFELL)
    {
      if (v4 == ++result)
        return result;
    }
    __break(1u);
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t specialized BidirectionalCollection.index(_:offsetBy:)(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (a2 < 0)
  {
    v4 = 0;
    while ((result ^ 0x8000000000000000) > ~a2)
    {
      if (--v4 <= a2)
      {
        result += v4;
        return result;
      }
    }
    goto LABEL_12;
  }
  if (a2)
  {
    v2 = result ^ 0x7FFFFFFFFFFFFFFFLL;
    v3 = a2 - 1;
    while (v2 > v3)
    {
      ++result;
      if (!--a2)
        return result;
    }
    __break(1u);
LABEL_12:
    __break(1u);
  }
  return result;
}

uint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = 0;
  v4 = a3 - result;
  if (a3 > result)
  {
    while ((unint64_t)(~result + a3) <= 0x7FFFFFFFFFFFFFFELL)
    {
      if (v4 == ++v3)
        goto LABEL_13;
    }
    __break(1u);
    goto LABEL_32;
  }
  if (a3 < result)
  {
    v5 = ~a3 + result;
    if (v5 >= (result ^ 0x8000000000000000))
      v5 = result ^ 0x8000000000000000;
    v6 = 0x8000000000000000;
    if (v5 < 0x8000000000000000)
      v6 = v5;
    while ((v5 & 0x8000000000000000) == 0)
    {
      if ((result ^ 0x8000000000000000) == v6)
        goto LABEL_34;
      if (v4 == --v3)
      {
LABEL_13:
        if (a2 > 0)
        {
          if ((v3 & 0x8000000000000000) == 0)
            goto LABEL_19;
          goto LABEL_20;
        }
        if (v3 >= 1)
          goto LABEL_26;
        goto LABEL_24;
      }
    }
    goto LABEL_33;
  }
  if (a2 > 0)
  {
LABEL_19:
    if (v3 >= (unint64_t)a2)
    {
LABEL_20:
      v7 = result ^ 0x7FFFFFFFFFFFFFFFLL;
      v8 = a2 - 1;
      while (v7 > v8)
      {
        ++result;
        if (!--a2)
          return result;
      }
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    return 0;
  }
LABEL_24:
  if (v3 > a2)
    return 0;
LABEL_26:
  if ((a2 & 0x8000000000000000) == 0)
    return result;
  v9 = 0;
  while ((result ^ 0x8000000000000000) > ~a2)
  {
    if (--v9 <= a2)
    {
      result += v9;
      return result;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_18B52A010()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in DispatchData._copyBytesHelper(to:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return closure #1 in DispatchData._copyBytesHelper(to:from:)(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 32), *(int64_t **)(v4 + 40), *(_QWORD *)(v4 + 48)) & 1;
}

uint64_t sub_18B52A050()
{
  return swift_deallocObject();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

BOOL ___swift_dispatch_data_apply_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t (*v9)(uint64_t, id, uint64_t, uint64_t, uint64_t);
  id v10;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(uint64_t (**)(uint64_t, id, uint64_t, uint64_t, uint64_t))(v8 + 16);
  v10 = a2;
  LODWORD(a5) = v9(v8, v10, a3, a4, a5);

  return (_DWORD)a5 != 0;
}

uint64_t DispatchSpecificKey.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t DispatchSpecificKey.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DispatchSpecificKey.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t _DispatchSpecificValue.init(value:)(uint64_t a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 80) - 8) + 32))(v1 + *(_QWORD *)(*(_QWORD *)v1 + 88), a1);
  return v1;
}

uint64_t _DispatchSpecificValue.deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  return v0;
}

uint64_t OS_dispatch_queue.Attributes.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t OS_dispatch_queue.Attributes.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.union(_:) in conformance OS_dispatch_queue.Attributes@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.intersection(_:) in conformance OS_dispatch_queue.Attributes@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance OS_dispatch_queue.Attributes@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance OS_dispatch_queue.Attributes(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance OS_dispatch_queue.Attributes(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance OS_dispatch_queue.Attributes(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.subtracting(_:) in conformance OS_dispatch_queue.Attributes@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance OS_dispatch_queue.Attributes(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance OS_dispatch_queue.Attributes(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance OS_dispatch_queue.Attributes(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance OS_dispatch_queue.Attributes()
{
  _QWORD *v0;

  return *v0 == 0;
}

_QWORD *protocol witness for SetAlgebra.subtract(_:) in conformance OS_dispatch_queue.Attributes(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance OS_dispatch_queue.Attributes@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance OS_dispatch_queue.Attributes(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OS_dispatch_queue.Attributes(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

BOOL static OS_dispatch_queue.GlobalQueuePriority.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void OS_dispatch_queue.GlobalQueuePriority.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OS_dispatch_queue.GlobalQueuePriority(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void protocol witness for Hashable.hash(into:) in conformance OS_dispatch_queue.GlobalQueuePriority()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int OS_dispatch_queue.GlobalQueuePriority.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance OS_dispatch_queue.GlobalQueuePriority()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_18B52A400()
{
  return swift_deallocObject();
}

dispatch_queue_global_t static OS_dispatch_queue.global(priority:)(char *a1)
{
  return dispatch_get_global_queue(qword_18B532978[*a1], 0);
}

void OS_dispatch_queue.sync(execute:)(uint64_t a1)
{
  void *v1;

  _swift_dispatch_sync(v1, *(void **)(a1 + 16));
}

void OS_dispatch_queue.asyncAndWait(execute:)(uint64_t a1)
{
  void *v1;

  _swift_dispatch_async_and_wait(v1, *(void **)(a1 + 16));
}

void OS_dispatch_queue.async(group:execute:)(void *a1, uint64_t a2)
{
  void *v2;

  _swift_dispatch_group_async(a1, v2, *(void **)(a2 + 16));
}

uint64_t OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, dispatch_block_flags_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void (*a6)(void *)@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  dispatch_block_flags_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  void **v20;
  _QWORD *v21;
  uint64_t result;
  void *v23;
  id v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void (*v34)(void *);
  uint64_t v35;
  void (*v36)(uint64_t);
  uint64_t v37;

  v36 = a1;
  v33 = a7;
  v34 = a6;
  v37 = a2;
  v35 = a9;
  v13 = type metadata accessor for Optional();
  v30 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v32 = (char *)&v28 - v14;
  v15 = *a3;
  v16 = swift_allocBox();
  v31 = *(_QWORD *)(a8 - 8);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56);
  v29 = v18;
  v17(v18, 1, 1, a8);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = 0;
  v20 = (void **)(v19 + 16);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = a8;
  v21[3] = a4;
  v21[4] = a5;
  closure #1 in OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)((uint64_t)partial apply for thunk for @callee_guaranteed () -> (@out A, @error @owned Error), (uint64_t)v21, v15, v16, v19, v36, v37, a8);
  LOBYTE(a4) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((a4 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    swift_beginAccess();
    v23 = *v20;
    if (*v20)
    {
      v24 = v23;
      v34(v23);

LABEL_6:
      swift_release();
      return swift_release();
    }
    v25 = v29;
    swift_beginAccess();
    v26 = v32;
    (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v32, v25, v13);
    v27 = v31;
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48))(v26, 1, a8);
    if ((_DWORD)result != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v35, v26, a8);
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t closure #1 in OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)(uint64_t a1, uint64_t a2, dispatch_block_flags_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7, uint64_t a8)
{
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v21[6];

  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a8;
  v15[3] = a4;
  v15[4] = a1;
  v15[5] = a2;
  v15[6] = a5;
  v21[4] = partial apply for closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:);
  v21[5] = v15;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 1107296256;
  v21[2] = thunk for @escaping @callee_guaranteed () -> ();
  v21[3] = &block_descriptor_60;
  v16 = _Block_copy(v21);
  type metadata accessor for DispatchWorkItem();
  v17 = swift_allocObject();
  v18 = _Block_copy(v16);
  swift_retain();
  swift_retain();
  swift_retain();
  v19 = _swift_dispatch_block_create(a3, v18);
  _Block_release(v16);
  _Block_release(v18);
  *(_QWORD *)(v17 + 16) = v19;
  swift_release();
  a6(v17);
  return swift_release();
}

uint64_t closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE v13[32];

  v7 = type metadata accessor for Optional();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = &v13[-v9];
  v11 = swift_projectBox();
  a2();
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 56))(v10, 0, 1, a5);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v8 + 40))(v11, v10, v7);
}

uint64_t OS_dispatch_queue.asyncAndWait<A>(execute:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return OS_dispatch_queue.asyncAndWait<A>(execute:)(a1, a2, a3, (void (*)(uint64_t (*)(), char *))partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), (void (*)(id))partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), a4);
}

uint64_t OS_dispatch_queue.asyncAndWait<A>(flags:execute:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  void *v5;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  _BYTE v16[16];
  uint64_t v17;
  uint64_t v18;

  v10 = *a1;
  if (*a1)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v5;
    v18 = v10;
    MEMORY[0x1E0C80A78](v11);
    v17 = a4;
    v12 = v5;
    OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)((void (*)(uint64_t))partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:), v11, (dispatch_block_flags_t *)&v18, a2, a3, (void (*)(void *))partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), (uint64_t)v16, a4, a5);
  }
  else
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v5;
    MEMORY[0x1E0C80A78](v13);
    v17 = a4;
    v14 = v5;
    OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)((void (*)(uint64_t (*)(), char *))partial apply for implicit closure #4 in implicit closure #3 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:), a2, a3, (void (*)(id))partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), (uint64_t)v16, a4, a5);
  }
  return swift_release();
}

Dispatch::DispatchQoS::QoSClass_optional OS_dispatch_queue.qos.getter@<W0>(uint64_t a1@<X8>)
{
  NSObject *v1;
  qos_class_t qos_class;
  Dispatch::DispatchQoS::QoSClass_optional result;
  uint64_t v5;
  int v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  qos_class = dispatch_queue_get_qos_class(v1, &v6);
  result.value = DispatchQoS.QoSClass.init(rawValue:)(qos_class).value;
  if (v7 == 6)
    __break(1u);
  v5 = v6;
  *(_BYTE *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v5;
  return result;
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *);
  uint64_t v28;

  v25 = a5;
  v26 = a2;
  v28 = a4;
  v27 = a1;
  v24 = a3;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x1E0C80A78](v10);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v25, v12, v24);
    v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t OS_dispatch_queue_serial_executor.enqueue(_:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = UnownedJob.init(_:)();
  _swift_job_set_executor_queue(v1, v0);
  _swift_job_priority(v1);
  return dispatch_async_swift_job();
}

uint64_t protocol witness for SerialExecutor.asUnownedSerialExecutor() in conformance OS_dispatch_queue_serial_executor()
{
  uint64_t v0;

  return v0;
}

void protocol witness for SerialExecutor.checkIsolated() in conformance OS_dispatch_queue_serial_executor()
{
  NSObject *v0;

  dispatch_assert_queue_V2(v0);
}

uint64_t OS_dispatch_queue_serial.Attributes.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t OS_dispatch_queue_concurrent.Attributes.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void OS_dispatch_queue_concurrent.init(label:qos:attributes:autoreleaseFrequency:target:)(uint64_t a1, uint64_t a2, char *a3, uint64_t *a4, unsigned __int8 *a5, void *a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_autorelease_frequency_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_autorelease_frequency_t v14;
  NSObject *v15;
  NSObject *v17;
  uint64_t v18;

  v7 = *a3;
  v8 = *((_QWORD *)a3 + 1);
  v9 = *a4;
  v10 = (unint64_t)*a5;
  v11 = (id)_swift_dispatch_queue_concurrent();
  v12 = v11;
  if ((v9 & 4) != 0)
  {
    v13 = dispatch_queue_attr_make_initially_inactive(v11);

    v12 = v13;
  }
  if ((_DWORD)v10)
  {
    if ((_DWORD)v10 == DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM)
      v14 = v10;
    else
      v14 = DISPATCH_AUTORELEASE_FREQUENCY_NEVER;
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(v12, v14);

    v12 = v15;
  }
  if ((_DWORD)v7 == 5 && v8 == 0)
    goto LABEL_15;
  if (v8 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v8 <= 0x7FFFFFFF)
  {
    v17 = dispatch_queue_attr_make_with_qos_class(v12, (dispatch_qos_class_t)dword_18B5329C8[v7], v8);

    v12 = v17;
LABEL_15:
    v18 = String.utf8CString.getter();
    swift_bridgeObjectRelease();
    dispatch_concurrent_queue_create_with_target_4swift((const char *)(v18 + 32), v12, a6);
    swift_release();

    return;
  }
  __break(1u);
}

uint64_t OS_dispatch_workloop.Attributes.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

_QWORD *protocol witness for SetAlgebra.remove(_:) in conformance OS_dispatch_queue.Attributes@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance OS_dispatch_queue.Attributes@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

NSObject *OS_dispatch_workloop.init(label:attributes:autoreleaseFrequency:osWorkgroup:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, OS_os_workgroup *a5)
{
  dispatch_autorelease_frequency_t v6;
  uint64_t v7;
  dispatch_workloop_t inactive;
  NSObject *v9;
  NSObject *v10;

  v6 = (unint64_t)*a4;
  v7 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  inactive = dispatch_workloop_create_inactive((const char *)(v7 + 32));
  swift_release();
  if ((_DWORD)v6)
  {
    if ((_DWORD)v6 == DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM)
    {
      v9 = inactive;
      if (!a5)
        goto LABEL_8;
      goto LABEL_7;
    }
    v6 = DISPATCH_AUTORELEASE_FREQUENCY_NEVER;
  }
  dispatch_workloop_set_autorelease_frequency(inactive, v6);
  if (a5)
LABEL_7:
    dispatch_workloop_set_os_workgroup(inactive, a5);
LABEL_8:
  v10 = inactive;
  dispatch_activate(v10);

  return v10;
}

void _swift_dispatch_sync(void *a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = a1;
  v4 = a2;
  dispatch_sync(v3, v4);

}

void _swift_dispatch_async_and_wait(void *a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = a1;
  v4 = a2;
  dispatch_async_and_wait(v3, v4);

}

void _swift_dispatch_group_async(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  id v7;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  dispatch_group_async(v5, v6, v7);

}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)&unk_1E2168EF0, (uint64_t)thunk for @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32)partial apply, (uint64_t)&block_descriptor_71, (void (*)(uint64_t, void *))MEMORY[0x1E0C82C08]);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:)(uint64_t a1)
{
  return partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:)(a1, (uint64_t (*)(_QWORD, _QWORD))_swift_dispatch_async_and_wait);
}

uint64_t partial apply for implicit closure #4 in implicit closure #3 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)&unk_1E2168E00, (uint64_t)thunk for @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32)partial apply, (uint64_t)&block_descriptor_48, (void (*)(uint64_t, void *))MEMORY[0x1E0C82C08]);
}

uint64_t sub_18B52B134()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #4 in implicit closure #3 in OS_dispatch_queue.sync<A>(flags:execute:)(uint64_t a1)
{
  return partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:)(a1, (uint64_t (*)(_QWORD, _QWORD))_swift_dispatch_sync);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:)(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;

  return a2(*(_QWORD *)(v2 + 16), *(_QWORD *)(a1 + 16));
}

uint64_t partial apply for implicit closure #6 in implicit closure #5 in OS_dispatch_queue.sync<A>(flags:execute:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)&unk_1E2168D88, (uint64_t)thunk for @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32)partial apply, (uint64_t)&block_descriptor_34_0, (void (*)(uint64_t, void *))MEMORY[0x1E0C82F90]);
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.GlobalQueuePriority and conformance OS_dispatch_queue.GlobalQueuePriority()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.GlobalQueuePriority and conformance OS_dispatch_queue.GlobalQueuePriority;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.GlobalQueuePriority and conformance OS_dispatch_queue.GlobalQueuePriority)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.GlobalQueuePriority, &type metadata for OS_dispatch_queue.GlobalQueuePriority);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.GlobalQueuePriority and conformance OS_dispatch_queue.GlobalQueuePriority);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.AutoreleaseFrequency and conformance OS_dispatch_queue.AutoreleaseFrequency()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.AutoreleaseFrequency and conformance OS_dispatch_queue.AutoreleaseFrequency;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.AutoreleaseFrequency and conformance OS_dispatch_queue.AutoreleaseFrequency)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.AutoreleaseFrequency, &type metadata for OS_dispatch_queue.AutoreleaseFrequency);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.AutoreleaseFrequency and conformance OS_dispatch_queue.AutoreleaseFrequency);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue_concurrent.Attributes, &type metadata for OS_dispatch_queue_concurrent.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue_concurrent.Attributes, &type metadata for OS_dispatch_queue_concurrent.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue_concurrent.Attributes, &type metadata for OS_dispatch_queue_concurrent.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue_concurrent.Attributes, &type metadata for OS_dispatch_queue_concurrent.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_workloop.Attributes, &type metadata for OS_dispatch_workloop.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_workloop.Attributes, &type metadata for OS_dispatch_workloop.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_workloop.Attributes, &type metadata for OS_dispatch_workloop.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_workloop.Attributes, &type metadata for OS_dispatch_workloop.Attributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes);
  }
  return result;
}

uint64_t method lookup function for DispatchSpecificKey()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DispatchSpecificKey.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t getEnumTagSinglePayload for OS_dispatch_queue.GlobalQueuePriority(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for OS_dispatch_queue.GlobalQueuePriority(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_18B52B600 + 4 * byte_18B532095[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_18B52B634 + 4 * asc_18B532090[v4]))();
}

uint64_t sub_18B52B634(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B52B63C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18B52B644);
  return result;
}

uint64_t sub_18B52B650(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18B52B658);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_18B52B65C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B52B664(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for OS_dispatch_queue.GlobalQueuePriority(unsigned __int8 *a1)
{
  return *a1;
}

ValueMetadata *type metadata accessor for OS_dispatch_queue.GlobalQueuePriority()
{
  return &type metadata for OS_dispatch_queue.GlobalQueuePriority;
}

uint64_t getEnumTagSinglePayload for OS_dispatch_queue.AutoreleaseFrequency(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for OS_dispatch_queue.AutoreleaseFrequency(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_18B52B764 + 4 * byte_18B53209F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_18B52B798 + 4 * byte_18B53209A[v4]))();
}

uint64_t sub_18B52B798(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B52B7A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18B52B7A8);
  return result;
}

uint64_t sub_18B52B7B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18B52B7BCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_18B52B7C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B52B7C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OS_dispatch_queue_concurrent.Attributes()
{
  return &type metadata for OS_dispatch_queue_concurrent.Attributes;
}

ValueMetadata *type metadata accessor for OS_dispatch_workloop.Attributes()
{
  return &type metadata for OS_dispatch_workloop.Attributes;
}

uint64_t sub_18B52B7F4()
{
  return swift_deallocObject();
}

uint64_t sub_18B52B804()
{
  return swift_deallocObject();
}

uint64_t sub_18B52B814()
{
  return swift_deallocObject();
}

uint64_t sub_18B52B824()
{
  return swift_deallocObject();
}

uint64_t sub_18B52B834()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_18B52B858()
{
  return swift_deallocObject();
}

uint64_t sub_18B52B868()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)()
{
  uint64_t v0;

  return closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)(*(_QWORD *)(v0 + 24), *(void (**)(void))(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 16));
}

uint64_t sub_18B52B8AC()
{
  return swift_deallocObject();
}

uint64_t sub_18B52B8BC()
{
  return swift_deallocObject();
}

uint64_t thunk for @callee_guaranteed () -> (@out A, @error @owned Error)partial apply()
{
  return partial apply for thunk for @callee_guaranteed () -> (@out A, @error @owned Error)();
}

uint64_t OS_dispatch_source.setCancelHandler(handler:)(uint64_t a1, uint64_t a2)
{
  return OS_dispatch_source.setEventHandler(handler:)(a1, a2, (uint64_t (*)(uint64_t, _QWORD))_swift_dispatch_source_set_cancel_handler);
}

void OS_dispatch_source.setRegistrationHandler(qos:flags:handler:)(unsigned __int8 *a1, uint64_t *a2, void *a3, uint64_t a4)
{
  OS_dispatch_source.setEventHandler(qos:flags:handler:)(a1, a2, a3, a4, (void (*)(uint64_t, void *))_swift_dispatch_source_set_registration_handler);
}

uint64_t OS_dispatch_source.setRegistrationHandler(handler:)(uint64_t a1, uint64_t a2)
{
  return OS_dispatch_source.setEventHandler(handler:)(a1, a2, (uint64_t (*)(uint64_t, _QWORD))_swift_dispatch_source_set_registration_handler);
}

uint64_t OS_dispatch_source.handle.getter(uint64_t a1)
{
  return OS_dispatch_source.activate()(a1, MEMORY[0x1E0C82F30]);
}

uint64_t OS_dispatch_source.mask.getter(uint64_t a1)
{
  return OS_dispatch_source.activate()(a1, MEMORY[0x1E0C82F38]);
}

uint64_t OS_dispatch_source.data.getter(uint64_t a1)
{
  return OS_dispatch_source.activate()(a1, MEMORY[0x1E0C82F28]);
}

BOOL OS_dispatch_source.isCancelled.getter()
{
  NSObject *v0;

  objc_opt_self();
  v0 = swift_dynamicCastObjCClassUnconditional();
  return dispatch_source_testcancel(v0) != 0;
}

uint64_t OS_dispatch_source.MachSendEvent.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t OS_dispatch_source.MemoryPressureEvent.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void static OS_dispatch_source.MemoryPressureEvent.mslStatus.getter(_QWORD *a1@<X8>)
{
  *a1 = 4026531840;
}

void one-time initialization function for all()
{
  static OS_dispatch_source.MemoryPressureEvent.all = 7;
}

{
  static OS_dispatch_source.ProcessEvent.all = 3892314112;
}

{
  static OS_dispatch_source.FileSystemEvent.all = 127;
}

_QWORD *static OS_dispatch_source.MemoryPressureEvent.all.getter@<X0>(_QWORD *a1@<X8>)
{
  return static OS_dispatch_source.MemoryPressureEvent.all.getter(&one-time initialization token for all, &static OS_dispatch_source.MemoryPressureEvent.all, a1);
}

uint64_t OS_dispatch_source.MemoryPressureEvent.description.getter()
{
  _QWORD *v0;
  uint64_t result;

  result = 0x6C616D726F6ELL;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      result = 0x676E696E726177;
      break;
    case 3:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xALL:
    case 0xBLL:
    case 0xCLL:
    case 0xDLL:
    case 0xELL:
    case 0xFLL:
    case 0x11:
    case 0x12:
    case 0x13:
    case 0x14:
    case 0x15:
    case 0x16:
    case 0x17:
    case 0x18:
    case 0x19:
    case 0x1ALL:
    case 0x1BLL:
    case 0x1CLL:
    case 0x1DLL:
    case 0x1ELL:
    case 0x1FLL:
      goto LABEL_5;
    case 4:
      result = 0x6C61636974697263;
      break;
    case 0x10:
      result = 0xD000000000000015;
      break;
    case 0x20:
      result = 0xD000000000000016;
      break;
    default:
      if (*v0 == 4026531840)
        result = 0xD000000000000014;
      else
LABEL_5:
        result = dispatch thunk of CustomStringConvertible.description.getter();
      break;
  }
  return result;
}

uint64_t OS_dispatch_source.ProcessEvent.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void static OS_dispatch_source.ProcessEvent.exit.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x80000000;
}

void static OS_dispatch_source.ProcessEvent.fork.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x40000000;
}

void static OS_dispatch_source.ProcessEvent.exec.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x20000000;
}

void static OS_dispatch_source.ProcessEvent.signal.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x8000000;
}

_QWORD *static OS_dispatch_source.ProcessEvent.all.getter@<X0>(_QWORD *a1@<X8>)
{
  return static OS_dispatch_source.MemoryPressureEvent.all.getter(&one-time initialization token for all, &static OS_dispatch_source.ProcessEvent.all, a1);
}

uint64_t OS_dispatch_source.TimerFlags.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t OS_dispatch_source.TimerFlags.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static OS_dispatch_source.TimerFlags.strict.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

uint64_t OS_dispatch_source.FileSystemEvent.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void static OS_dispatch_source.FileSystemEvent.extend.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static OS_dispatch_source.FileSystemEvent.attrib.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static OS_dispatch_source.FileSystemEvent.link.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

void static OS_dispatch_source.FileSystemEvent.rename.getter(_QWORD *a1@<X8>)
{
  *a1 = 32;
}

void static OS_dispatch_source.FileSystemEvent.revoke.getter(_QWORD *a1@<X8>)
{
  *a1 = 64;
}

void static OS_dispatch_source.FileSystemEvent.funlock.getter(_QWORD *a1@<X8>)
{
  *a1 = 256;
}

_QWORD *static OS_dispatch_source.FileSystemEvent.all.getter@<X0>(_QWORD *a1@<X8>)
{
  return static OS_dispatch_source.MemoryPressureEvent.all.getter(&one-time initialization token for all, &static OS_dispatch_source.FileSystemEvent.all, a1);
}

_QWORD *static OS_dispatch_source.MemoryPressureEvent.all.getter@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (*result != -1)
    result = (_QWORD *)swift_once();
  *a3 = *a2;
  return result;
}

dispatch_source_t static OS_dispatch_source.makeMachSendSource(port:eventMask:queue:)(unsigned int a1, uintptr_t *a2, void *a3)
{
  return _swift_dispatch_source_create(MEMORY[0x1E0C80DA0], a1, *a2, a3);
}

dispatch_source_t static OS_dispatch_source.makeMachReceiveSource(port:queue:)(unsigned int a1, void *a2)
{
  return _swift_dispatch_source_create(MEMORY[0x1E0C80D98], a1, 0, a2);
}

dispatch_source_t static OS_dispatch_source.makeProcessSource(identifier:eventMask:queue:)(NSObject *a1, uintptr_t *a2, void *a3)
{
  return static OS_dispatch_source.makeProcessSource(identifier:eventMask:queue:)(a1, a2, a3, MEMORY[0x1E0C80DB0]);
}

dispatch_source_t static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)(NSObject *a1, void *a2)
{
  return static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)(a1, a2, MEMORY[0x1E0C80DB8]);
}

dispatch_source_t static OS_dispatch_source.makeUserDataAddSource(queue:)(void *a1)
{
  return _swift_dispatch_source_create(MEMORY[0x1E0C80D70], 0, 0, a1);
}

dispatch_source_t static OS_dispatch_source.makeUserDataOrSource(queue:)(void *a1)
{
  return _swift_dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, a1);
}

dispatch_source_t static OS_dispatch_source.makeUserDataReplaceSource(queue:)(void *a1)
{
  return _swift_dispatch_source_create(MEMORY[0x1E0C80D80], 0, 0, a1);
}

dispatch_source_t static OS_dispatch_source.makeFileSystemObjectSource(fileDescriptor:eventMask:queue:)(NSObject *a1, uintptr_t *a2, void *a3)
{
  return static OS_dispatch_source.makeProcessSource(identifier:eventMask:queue:)(a1, a2, a3, MEMORY[0x1E0C80DE8]);
}

dispatch_source_t static OS_dispatch_source.makeProcessSource(identifier:eventMask:queue:)(dispatch_source_t result, uintptr_t *a2, void *a3, const dispatch_source_type_s *a4)
{
  if ((result & 0x80000000) == 0)
    return _swift_dispatch_source_create(a4, result, *a2, a3);
  __break(1u);
  return result;
}

dispatch_source_t static OS_dispatch_source.makeWriteSource(fileDescriptor:queue:)(NSObject *a1, void *a2)
{
  return static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)(a1, a2, MEMORY[0x1E0C80DF0]);
}

uint64_t OS_dispatch_source_mach_send.data.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E0C82F28], a1);
}

uint64_t OS_dispatch_source_mach_send.mask.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E0C82F38], a1);
}

uintptr_t OS_dispatch_source_mach_send.handle.getter()
{
  NSObject *v0;
  uintptr_t result;

  objc_opt_self();
  v0 = swift_dynamicCastObjCClassUnconditional();
  result = dispatch_source_get_handle(v0);
  if (HIDWORD(result))
    __break(1u);
  return result;
}

uint64_t OS_dispatch_source_memorypressure.data.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E0C82F28], a1);
}

uint64_t OS_dispatch_source_memorypressure.mask.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E0C82F38], a1);
}

uint64_t OS_dispatch_source_proc.data.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E0C82F28], a1);
}

uint64_t OS_dispatch_source_proc.mask.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E0C82F38], a1);
}

void OS_dispatch_source_timer.scheduleOneshot(deadline:leeway:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(unsigned __int8 *)(a2 + 8);
  objc_opt_self();
  swift_dynamicCastObjCClassUnconditional();
  __asm { BR              X9 }
}

void sub_18B52BF1C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  dispatch_time_t v4;
  uint64_t v5;

  if ((unsigned __int128)(v5 * (__int128)1000000000) >> 64 == (1000000000 * v5) >> 63)
    goto LABEL_4;
  if (v5 <= 0)
  {
    do
    {
      __break(1u);
LABEL_4:
      a4 = 1000000000 * v5;
    }
    while (1000000000 * v5 < 0);
  }
  dispatch_source_set_timer(a1, v4, 0xFFFFFFFFFFFFFFFFLL, a4);
}

uintptr_t OS_dispatch_source_proc.handle.getter()
{
  NSObject *v0;
  uintptr_t result;

  objc_opt_self();
  v0 = swift_dynamicCastObjCClassUnconditional();
  result = dispatch_source_get_handle(v0);
  if (result >> 31)
    __break(1u);
  return result;
}

uint64_t OS_dispatch_source_vnode.data.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E0C82F28], a1);
}

uint64_t OS_dispatch_source_vnode.mask.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E0C82F38], a1);
}

uint64_t OS_dispatch_source_mach_send.data.getter@<X0>(uint64_t (*a1)(uint64_t)@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  objc_opt_self();
  v4 = swift_dynamicCastObjCClassUnconditional();
  result = a1(v4);
  *a2 = result;
  return result;
}

void OS_dispatch_source_data_add.add(data:)(uintptr_t a1)
{
  NSObject *v2;

  objc_opt_self();
  v2 = swift_dynamicCastObjCClassUnconditional();
  dispatch_source_merge_data(v2, a1);
}

dispatch_source_t static OS_dispatch_source.makeExclavesNotificationSource(identifier:eventMask:queue:)(uintptr_t a1, unsigned int a2, void *a3)
{
  return _swift_dispatch_source_create(MEMORY[0x1E0C80D88], a1, a2, a3);
}

void _swift_dispatch_source_set_registration_handler(void *a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = a1;
  v4 = a2;
  dispatch_source_set_registration_handler(v3, v4);

}

unint64_t lazy protocol witness table accessor for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.MachSendEvent, &type metadata for OS_dispatch_source.MachSendEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.MachSendEvent, &type metadata for OS_dispatch_source.MachSendEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.MachSendEvent, &type metadata for OS_dispatch_source.MachSendEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.MachSendEvent, &type metadata for OS_dispatch_source.MachSendEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.MemoryPressureEvent, &type metadata for OS_dispatch_source.MemoryPressureEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.MemoryPressureEvent, &type metadata for OS_dispatch_source.MemoryPressureEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.MemoryPressureEvent, &type metadata for OS_dispatch_source.MemoryPressureEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.MemoryPressureEvent, &type metadata for OS_dispatch_source.MemoryPressureEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.ProcessEvent, &type metadata for OS_dispatch_source.ProcessEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.ProcessEvent, &type metadata for OS_dispatch_source.ProcessEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.ProcessEvent, &type metadata for OS_dispatch_source.ProcessEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.ProcessEvent, &type metadata for OS_dispatch_source.ProcessEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.FileSystemEvent, &type metadata for OS_dispatch_source.FileSystemEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.FileSystemEvent, &type metadata for OS_dispatch_source.FileSystemEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.FileSystemEvent, &type metadata for OS_dispatch_source.FileSystemEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_source.FileSystemEvent, &type metadata for OS_dispatch_source.FileSystemEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent);
  }
  return result;
}

ValueMetadata *type metadata accessor for OS_dispatch_source.MachSendEvent()
{
  return &type metadata for OS_dispatch_source.MachSendEvent;
}

ValueMetadata *type metadata accessor for OS_dispatch_source.ProcessEvent()
{
  return &type metadata for OS_dispatch_source.ProcessEvent;
}

ValueMetadata *type metadata accessor for OS_dispatch_source.FileSystemEvent()
{
  return &type metadata for OS_dispatch_source.FileSystemEvent;
}

uint64_t DispatchTime.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance DispatchTime(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance DispatchTime(_QWORD *a1, _QWORD *a2)
{
  return *a2 >= *a1;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance DispatchTime(_QWORD *a1, _QWORD *a2)
{
  return *a2 < *a1;
}

BOOL static DispatchTime.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t DispatchWallTime.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

dispatch_time_t DispatchWallTime.init(timespec:)@<X0>(__darwin_time_t a1@<X0>, uint64_t a2@<X1>, dispatch_time_t *a3@<X8>)
{
  dispatch_time_t result;
  timespec when;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  when.tv_sec = a1;
  when.tv_nsec = a2;
  result = dispatch_walltime(&when, 0);
  *a3 = result;
  return result;
}

uint64_t *protocol witness for static Comparable.< infix(_:_:) in conformance DispatchWallTime(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *result;
  v3 = *a2;
  if (*a2 == -1)
    return (uint64_t *)(v2 != -1);
  if (v2 == -1)
    return 0;
  v4 = __OFSUB__(0, v2);
  v5 = -v2;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    v4 = __OFSUB__(0, v3);
    v6 = -v3;
    if (!v4)
      return (uint64_t *)(v5 < v6);
  }
  __break(1u);
  return result;
}

uint64_t *static DispatchWallTime.< infix(_:_:)(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *result;
  v3 = *a2;
  if (*a2 == -1)
    return (uint64_t *)(v2 != -1);
  if (v2 == -1)
    return 0;
  v4 = __OFSUB__(0, v2);
  v5 = -v2;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    v4 = __OFSUB__(0, v3);
    v6 = -v3;
    if (!v4)
      return (uint64_t *)(v5 < v6);
  }
  __break(1u);
  return result;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance DispatchWallTime(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 result;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *a1;
  v3 = *a2;
  result = *a2 == -1 || *a1 != -1;
  if (v2 != -1 && v3 != -1)
  {
    v6 = __OFSUB__(0, v3);
    v7 = -v3;
    if (v6)
    {
      __break(1u);
    }
    else
    {
      v6 = __OFSUB__(0, v2);
      v8 = -v2;
      if (!v6)
        return v7 >= v8;
    }
    __break(1u);
  }
  return result;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance DispatchWallTime(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 result;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *a1;
  v3 = *a2;
  result = *a1 == -1 || *a2 != -1;
  if (v3 != -1 && v2 != -1)
  {
    v6 = __OFSUB__(0, v2);
    v7 = -v2;
    if (v6)
    {
      __break(1u);
    }
    else
    {
      v6 = __OFSUB__(0, v3);
      v8 = -v3;
      if (!v6)
        return v7 >= v8;
    }
    __break(1u);
  }
  return result;
}

uint64_t *protocol witness for static Comparable.> infix(_:_:) in conformance DispatchWallTime(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *result;
  v3 = *a2;
  if (*result == -1)
    return (uint64_t *)(v3 != -1);
  if (v3 == -1)
    return 0;
  v4 = __OFSUB__(0, v3);
  v5 = -v3;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    v4 = __OFSUB__(0, v2);
    v6 = -v2;
    if (!v4)
      return (uint64_t *)(v5 < v6);
  }
  __break(1u);
  return result;
}

void - infix(_:_:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X12 }
}

dispatch_time_t sub_18B52C944(dispatch_time_t a1)
{
  uint64_t v1;
  dispatch_time_t *v2;
  uint64_t v3;
  dispatch_time_t result;

  v3 = 1000000000 * v1;
  if ((unsigned __int128)(v1 * (__int128)1000000000) >> 64 != (1000000000 * v1) >> 63)
  {
    v3 = 0x7FFFFFFFFFFFFFFFLL;
    if (v1 <= 0)
      v3 = 0x8000000000000000;
  }
  if (__OFSUB__(0, v3))
  {
    __break(1u);
    JUMPOUT(0x18B52C9A8);
  }
  result = dispatch_time(a1, -v3);
  *v2 = result;
  return result;
}

dispatch_time_t - infix(_:_:)@<X0>(dispatch_time_t *a1@<X0>, dispatch_time_t *a2@<X8>, double a3@<D0>)
{
  dispatch_time_t v4;
  int64_t v5;
  dispatch_time_t result;

  v4 = *a1;
  v5 = toInt64Clamped(_:)(a3 * -1000000000.0);
  result = dispatch_time(v4, v5);
  *a2 = result;
  return result;
}

uint64_t specialized static DispatchTimeInterval.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL4 v4;
  BOOL v5;
  char v6;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v4 = (_DWORD)v2 == 4 && *(_QWORD *)a1 == 0;
  v5 = *(_BYTE *)(a2 + 8) == 4 && *(_QWORD *)a2 == 0;
  v6 = v5;
  result = v5 && v4;
  if (!v4 && (v6 & 1) == 0)
    return ((uint64_t (*)(uint64_t))((char *)&loc_18B52CA54 + 4 * byte_18B533275[v2]))(result);
  return result;
}

unint64_t lazy protocol witness table accessor for type DispatchTime and conformance DispatchTime()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DispatchTime and conformance DispatchTime;
  if (!lazy protocol witness table cache variable for type DispatchTime and conformance DispatchTime)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for DispatchTime, &type metadata for DispatchTime);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchTime and conformance DispatchTime);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DispatchWallTime and conformance DispatchWallTime()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DispatchWallTime and conformance DispatchWallTime;
  if (!lazy protocol witness table cache variable for type DispatchWallTime and conformance DispatchWallTime)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for DispatchWallTime, &type metadata for DispatchWallTime);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWallTime and conformance DispatchWallTime);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DispatchTimeInterval(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DispatchTimeInterval(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 252;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

unint64_t *DispatchTime.distance(to:)@<X0>(unint64_t *result@<X0>, uint64_t a2@<X8>)
{
  unint64_t *v2;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  char v8;

  v4 = *result;
  v5 = *v2;
  if (*result == -1)
    goto LABEL_7;
  if (one-time initialization token for timebaseInfo != -1)
    result = (unint64_t *)swift_once();
  if ((_DWORD)static DispatchTime.timebaseInfo == HIDWORD(static DispatchTime.timebaseInfo))
  {
LABEL_7:
    if (v5 == -1)
      goto LABEL_16;
    goto LABEL_8;
  }
  if (!is_mul_ok(v4, static DispatchTime.timebaseInfo))
  {
    v4 = -1;
    goto LABEL_7;
  }
  if (!HIDWORD(static DispatchTime.timebaseInfo))
  {
    __break(1u);
    goto LABEL_26;
  }
  v4 = v4 * static DispatchTime.timebaseInfo / HIDWORD(static DispatchTime.timebaseInfo);
  if (v5 == -1)
  {
LABEL_16:
    v7 = v4 - v5;
    v6 = (uint64_t)(v4 - v5) < 0;
    if (v4 >= v5)
      goto LABEL_21;
    goto LABEL_17;
  }
LABEL_8:
  if (one-time initialization token for timebaseInfo != -1)
    result = (unint64_t *)swift_once();
  if ((_DWORD)static DispatchTime.timebaseInfo == HIDWORD(static DispatchTime.timebaseInfo))
    goto LABEL_16;
  if (!is_mul_ok(v5, static DispatchTime.timebaseInfo))
  {
    v5 = -1;
    v7 = v4 + 1;
    v6 = (uint64_t)(v4 + 1) < 0;
    if (v4 == -1)
    {
LABEL_21:
      if (!v6)
      {
        v8 = 3;
        goto LABEL_24;
      }
      goto LABEL_23;
    }
LABEL_17:
    if ((uint64_t)(v5 - v4) >= 0)
    {
      v7 = v4 - v5;
      v8 = 3;
LABEL_24:
      *(_QWORD *)a2 = v7;
      *(_BYTE *)(a2 + 8) = v8;
      return result;
    }
LABEL_23:
    v7 = 0;
    v8 = 4;
    goto LABEL_24;
  }
  if (HIDWORD(static DispatchTime.timebaseInfo))
  {
    v5 = v5 * static DispatchTime.timebaseInfo / HIDWORD(static DispatchTime.timebaseInfo);
    v7 = v4 - v5;
    v6 = (uint64_t)(v4 - v5) < 0;
    if (v4 >= v5)
      goto LABEL_21;
    goto LABEL_17;
  }
LABEL_26:
  __break(1u);
  return result;
}

void OS_dispatch_queue.SchedulerTimeType.dispatchTime.getter(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *OS_dispatch_queue.SchedulerTimeType.dispatchTime.setter(_QWORD *result)
{
  _QWORD *v1;

  *v1 = *result;
  return result;
}

uint64_t (*OS_dispatch_queue.SchedulerTimeType.dispatchTime.modify())()
{
  return protocol witness for Collection.subscript.read in conformance DispatchData;
}

_QWORD *OS_dispatch_queue.SchedulerTimeType.init(_:)@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t OS_dispatch_queue.SchedulerTimeType.init(from:)@<X0>(_QWORD *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v6;
  unsigned int v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  _QWORD v11[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  result = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  v6 = result;
  if (result == -1)
    goto LABEL_11;
  if (one-time initialization token for timebaseInfo != -1)
    result = swift_once();
  if ((_DWORD)static DispatchTime.timebaseInfo == HIDWORD(static DispatchTime.timebaseInfo))
  {
LABEL_11:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
    *a2 = v6;
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  if (!is_mul_ok(v6, HIDWORD(static DispatchTime.timebaseInfo)))
  {
LABEL_10:
    v6 = -1;
    goto LABEL_11;
  }
  v7 = static DispatchTime.timebaseInfo - 1;
  if ((_DWORD)static DispatchTime.timebaseInfo)
  {
    v8 = v6 * HIDWORD(static DispatchTime.timebaseInfo);
    v9 = __CFADD__(v8, v7);
    v10 = v8 + v7;
    if (!v9)
    {
      v6 = v10 / static DispatchTime.timebaseInfo;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t OS_dispatch_queue.SchedulerTimeType.encode(to:)(_QWORD *a1)
{
  unint64_t *v1;
  unint64_t v2;
  uint64_t result;
  _BYTE v4[24];
  uint64_t v5;

  v2 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  result = dispatch thunk of Encoder.singleValueContainer()();
  if (v2 == -1)
    goto LABEL_7;
  if (one-time initialization token for timebaseInfo != -1)
    result = swift_once();
  if ((_DWORD)static DispatchTime.timebaseInfo == HIDWORD(static DispatchTime.timebaseInfo)
    || !is_mul_ok(v2, static DispatchTime.timebaseInfo)
    || HIDWORD(static DispatchTime.timebaseInfo))
  {
LABEL_7:
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
    dispatch thunk of SingleValueEncodingContainer.encode(_:)();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

void OS_dispatch_queue.SchedulerTimeType.distance(to:)(unint64_t *a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3[2];
  uint64_t v4;

  v2 = *v1;
  v3[0] = *a1;
  v3[1] = v2;
  DispatchTime.distance(to:)(v3, (uint64_t)&v4);
  __asm { BR              X12 }
}

void sub_18B52D064()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = 1000000000 * v0;
  if ((unsigned __int128)(v0 * (__int128)1000000000) >> 64 != (1000000000 * v0) >> 63)
  {
    v2 = 0x7FFFFFFFFFFFFFFFLL;
    if (v0 <= 0)
      v2 = 0x8000000000000000;
  }
  *v1 = v2;
}

dispatch_time_t OS_dispatch_queue.SchedulerTimeType.advanced(by:)@<X0>(int64_t *a1@<X0>, dispatch_time_t *a2@<X8>)
{
  dispatch_time_t *v2;
  dispatch_time_t result;

  result = dispatch_time(*v2, *a1);
  *a2 = result;
  return result;
}

void OS_dispatch_queue.SchedulerTimeType.Stride.timeInterval.getter(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = 3;
}

void OS_dispatch_queue.SchedulerTimeType.hash(into:)()
{
  Swift::UInt64 *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.magnitude.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.magnitude.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*OS_dispatch_queue.SchedulerTimeType.Stride.magnitude.modify(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  return OS_dispatch_queue.SchedulerTimeType.Stride.magnitude.modify;
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.magnitude.modify(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.init(integerLiteral:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2;
  uint64_t v3;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0)
    v2 = 0x8000000000000000;
  if ((unsigned __int128)(result * (__int128)1000000000) >> 64 == (1000000000 * result) >> 63)
    v3 = 1000000000 * result;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.init<A>(exactly:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  _BOOL4 v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  char *v45;
  char v46;
  char *v47;
  char v48;
  uint64_t v49;
  char *v50;
  char v51;
  uint64_t v52;
  uint64_t result;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  BOOL v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t AssociatedConformanceWitness;
  char *v62;
  char v63;
  char *v64;
  int64_t v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int64_t v79;

  v75 = a4;
  v71 = *(_QWORD *)(*(_QWORD *)(a3 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v9 = (char *)&v68 - v8;
  v10 = MEMORY[0x1E0C80A78](v7);
  v69 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v68 - v13;
  v15 = MEMORY[0x1E0C80A78](v12);
  v74 = (char *)&v68 - v16;
  v17 = MEMORY[0x1E0C80A78](v15);
  v73 = (char *)&v68 - v18;
  v19 = MEMORY[0x1E0C80A78](v17);
  v72 = (char *)&v68 - v20;
  v21 = MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v68 - v22;
  v24 = MEMORY[0x1E0C80A78](v21);
  v26 = (char *)&v68 - v25;
  MEMORY[0x1E0C80A78](v24);
  v28 = (char *)&v68 - v27;
  v76 = a1;
  v77 = v29;
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
  v30((char *)&v68 - v27, a1, a2);
  LOBYTE(a1) = dispatch thunk of static BinaryInteger.isSigned.getter();
  v30(v26, (uint64_t)v28, a2);
  v70 = v14;
  v31 = (a1 & 1) != 0 && dispatch thunk of BinaryInteger.bitWidth.getter() > 64;
  v32 = *(void (**)(char *, uint64_t))(v77 + 8);
  v32(v26, a2);
  v30(v23, (uint64_t)v28, a2);
  if (!v31)
  {
    v32(v23, a2);
    v38 = v75;
    v34 = v76;
    v35 = v74;
    goto LABEL_10;
  }
  v79 = 0x8000000000000000;
  if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0)
  {
    v33 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v34 = v76;
    v35 = v74;
    if (v33 >= 64)
    {
      lazy protocol witness table accessor for type Int64 and conformance Int64();
      v36 = v72;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      v37 = dispatch thunk of static Comparable.< infix(_:_:)();
      v32(v36, a2);
      v32(v23, a2);
      v38 = v75;
      if ((v37 & 1) != 0)
        goto LABEL_39;
      goto LABEL_10;
    }
LABEL_30:
    v58 = dispatch thunk of BinaryInteger._lowWord.getter();
    v32(v23, a2);
    v38 = v75;
    if (v58 < v79)
      goto LABEL_39;
    goto LABEL_10;
  }
  v48 = dispatch thunk of static BinaryInteger.isSigned.getter();
  v49 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v48 & 1) == 0)
  {
    v34 = v76;
    v35 = v74;
    if (v49 >= 64)
    {
      v32(v23, a2);
      v38 = v75;
      goto LABEL_10;
    }
    goto LABEL_30;
  }
  if (v49 <= 64)
  {
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    MEMORY[0x18D779AC4](&unk_18B533A18, 256, AssociatedTypeWitness, AssociatedConformanceWitness);
    v62 = v72;
    MEMORY[0x18D779A94](v9, a2, v71);
    v63 = dispatch thunk of static Comparable.< infix(_:_:)();
    v32(v62, a2);
    v64 = v69;
    (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v69, v23, a2);
    v34 = v76;
    if ((v63 & 1) != 0)
    {
      v32(v64, a2);
      v38 = v75;
    }
    else
    {
      v65 = v79;
      v66 = dispatch thunk of BinaryInteger._lowWord.getter();
      v32(v64, a2);
      v67 = v66 < v65;
      v35 = v74;
      v38 = v75;
      if (!v67)
        goto LABEL_10;
    }
LABEL_39:
    v32(v28, a2);
    result = ((uint64_t (*)(uint64_t, uint64_t))v32)(v34, a2);
    v54 = 0;
    v57 = 1;
    goto LABEL_40;
  }
  lazy protocol witness table accessor for type Int64 and conformance Int64();
  v50 = v72;
  dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
  v51 = dispatch thunk of static Comparable.< infix(_:_:)();
  v32(v50, a2);
  v32(v23, a2);
  v38 = v75;
  v34 = v76;
  v35 = v74;
  if ((v51 & 1) != 0)
    goto LABEL_39;
LABEL_10:
  v39 = dispatch thunk of BinaryInteger.bitWidth.getter();
  v40 = v73;
  v30(v73, (uint64_t)v28, a2);
  if (v39 < 65)
  {
    v41 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v32(v40, a2);
    if (v41 != 64)
    {
      v30(v35, (uint64_t)v28, a2);
      goto LABEL_24;
    }
    v42 = dispatch thunk of static BinaryInteger.isSigned.getter();
    v30(v35, (uint64_t)v28, a2);
    if ((v42 & 1) != 0)
    {
LABEL_24:
      v32(v35, a2);
      goto LABEL_25;
    }
  }
  else
  {
    v32(v40, a2);
    v30(v35, (uint64_t)v28, a2);
  }
  v79 = 0x7FFFFFFFFFFFFFFFLL;
  v43 = dispatch thunk of static BinaryInteger.isSigned.getter();
  v44 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v43 & 1) != 0)
  {
    if (v44 > 64)
    {
      lazy protocol witness table accessor for type Int64 and conformance Int64();
      v45 = v72;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      v46 = dispatch thunk of static Comparable.< infix(_:_:)();
      v32(v45, a2);
      v47 = v35;
      goto LABEL_33;
    }
    goto LABEL_22;
  }
  if (v44 <= 63)
  {
LABEL_22:
    dispatch thunk of BinaryInteger._lowWord.getter();
    goto LABEL_24;
  }
  v78 = 0x7FFFFFFFFFFFFFFFLL;
  v59 = v72;
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v72, v35, a2);
  lazy protocol witness table accessor for type Int64 and conformance Int64();
  v60 = v70;
  dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
  v46 = dispatch thunk of static Comparable.< infix(_:_:)();
  v32(v60, a2);
  v47 = v59;
LABEL_33:
  v32(v47, a2);
  if ((v46 & 1) != 0)
    goto LABEL_39;
LABEL_25:
  v52 = dispatch thunk of BinaryInteger._lowWord.getter();
  v32(v28, a2);
  result = ((uint64_t (*)(uint64_t, uint64_t))v32)(v34, a2);
  v54 = 1000000000 * v52;
  v55 = (unsigned __int128)(v52 * (__int128)1000000000) >> 64;
  v56 = v55 == (1000000000 * v52) >> 63;
  v57 = v55 != (1000000000 * v52) >> 63;
  if (!v56)
    v54 = 0;
LABEL_40:
  *(_QWORD *)v38 = v54;
  *(_BYTE *)(v38 + 8) = v57;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int64 and conformance Int64()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    result = MEMORY[0x18D77A0D0](MEMORY[0x1E0DEDCA0], MEMORY[0x1E0DEDC60]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
  }
  return result;
}

BOOL static OS_dispatch_queue.SchedulerTimeType.Stride.< infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

uint64_t *static OS_dispatch_queue.SchedulerTimeType.Stride.* infix(_:_:)@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  double v3;
  double v4;
  uint64_t v5;

  v3 = (double)*result / 1000000000.0 * ((double)*a2 / 1000000000.0);
  v4 = trunc(v3 * 1000000000.0);
  v5 = 0x8000000000000000;
  if (v3 > 0.0)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 < 9.22337204e18 && v4 > -9.22337204e18)
    v5 = (uint64_t)(v3 * 1000000000.0);
  *a3 = v5;
  return result;
}

_QWORD *static OS_dispatch_queue.SchedulerTimeType.Stride.+ infix(_:_:)@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (__OFADD__(*result, *a2))
    __break(1u);
  else
    *a3 = *result + *a2;
  return result;
}

_QWORD *static OS_dispatch_queue.SchedulerTimeType.Stride.- infix(_:_:)@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (__OFSUB__(*result, *a2))
    __break(1u);
  else
    *a3 = *result - *a2;
  return result;
}

_QWORD *static OS_dispatch_queue.SchedulerTimeType.Stride.-= infix(_:_:)(_QWORD *result, _QWORD *a2)
{
  if (__OFSUB__(*result, *a2))
    __break(1u);
  else
    *result -= *a2;
  return result;
}

_QWORD *static OS_dispatch_queue.SchedulerTimeType.Stride.+= infix(_:_:)(_QWORD *result, _QWORD *a2)
{
  if (__OFADD__(*result, *a2))
    __break(1u);
  else
    *result += *a2;
  return result;
}

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.microseconds(_:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2;
  uint64_t v3;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0)
    v2 = 0x8000000000000000;
  if ((unsigned __int128)(result * (__int128)1000) >> 64 == (1000 * result) >> 63)
    v3 = 1000 * result;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.nanoseconds(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

BOOL static OS_dispatch_queue.SchedulerTimeType.Stride.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  Hasher._combine(_:)(0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  return 0x6365736F6E616E5FLL;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6365736F6E616E5FLL && a2 == 0xEC00000073646E6FLL)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys>);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    v9 = KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t protocol witness for static SchedulerTimeIntervalConvertible.seconds(_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2;
  uint64_t v3;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0)
    v2 = 0x8000000000000000;
  if ((unsigned __int128)(result * (__int128)1000000000) >> 64 == (1000000000 * result) >> 63)
    v3 = 1000000000 * result;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

void protocol witness for static SchedulerTimeIntervalConvertible.seconds(_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(uint64_t *a1@<X8>, double a2@<D0>)
{
  double v2;
  uint64_t v3;

  v2 = trunc(a2 * 1000000000.0);
  v3 = 0x8000000000000000;
  if (a2 > 0.0)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (v2 < 9.22337204e18 && v2 > -9.22337204e18)
    v3 = (uint64_t)(a2 * 1000000000.0);
  *a1 = v3;
}

uint64_t protocol witness for static SchedulerTimeIntervalConvertible.milliseconds(_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2;
  uint64_t v3;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0)
    v2 = 0x8000000000000000;
  if ((unsigned __int128)(result * (__int128)1000000) >> 64 == (1000000 * result) >> 63)
    v3 = 1000000 * result;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

uint64_t protocol witness for static SchedulerTimeIntervalConvertible.microseconds(_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2;
  uint64_t v3;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0)
    v2 = 0x8000000000000000;
  if ((unsigned __int128)(result * (__int128)1000) >> 64 == (1000 * result) >> 63)
    v3 = 1000 * result;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

uint64_t protocol witness for static SchedulerTimeIntervalConvertible.nanoseconds(_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(_QWORD *a1, _QWORD *a2)
{
  return *a2 >= *a1;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(_QWORD *a1, _QWORD *a2)
{
  return *a1 >= *a2;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(_QWORD *a1, _QWORD *a2)
{
  return *a2 < *a1;
}

_QWORD *protocol witness for static SignedNumeric.- prefix(_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFSUB__(0, *result))
    __break(1u);
  else
    *a2 = -*result;
  return result;
}

void protocol witness for SignedNumeric.negate() in conformance OS_dispatch_queue.SchedulerTimeType.Stride()
{
  _QWORD *v0;

  if (__OFSUB__(0, *v0))
    __break(1u);
  else
    *v0 = -*v0;
}

double *protocol witness for ExpressibleByFloatLiteral.init(floatLiteral:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(double *result@<X0>, uint64_t *a2@<X8>)
{
  double v2;
  double v3;
  uint64_t v4;

  v2 = *result * 1000000000.0;
  v3 = trunc(v2);
  v4 = 0x8000000000000000;
  if (*result > 0.0)
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 < 9.22337204e18 && v3 > -9.22337204e18)
    v4 = (uint64_t)v2;
  *a2 = v4;
  return result;
}

void protocol witness for Hashable.hash(into:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride()
{
  Swift::UInt64 *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t protocol witness for Decodable.init(from:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return OS_dispatch_queue.SchedulerTimeType.Stride.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys>);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

_QWORD *protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (__OFADD__(*result, *a2))
    __break(1u);
  else
    *a3 = *result + *a2;
  return result;
}

_QWORD *protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(_QWORD *result, _QWORD *a2)
{
  if (__OFADD__(*result, *a2))
    __break(1u);
  else
    *result += *a2;
  return result;
}

_QWORD *protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (__OFSUB__(*result, *a2))
    __break(1u);
  else
    *a3 = *result - *a2;
  return result;
}

_QWORD *protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(_QWORD *result, _QWORD *a2)
{
  if (__OFSUB__(*result, *a2))
    __break(1u);
  else
    *result -= *a2;
  return result;
}

uint64_t *protocol witness for ExpressibleByIntegerLiteral.init(integerLiteral:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (*result <= 0)
    v2 = 0x8000000000000000;
  if ((unsigned __int128)(*result * (__int128)1000000000) >> 64 == (1000000000 * *result) >> 63)
    v2 = 1000000000 * *result;
  *a2 = v2;
  return result;
}

Swift::Int OS_dispatch_queue.SchedulerTimeType.Stride.hashValue.getter()
{
  Swift::UInt64 *v0;
  Swift::UInt64 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Strideable._step(after:from:by:) in conformance OS_dispatch_queue.SchedulerTimeType(dispatch_time_t *a1, uint64_t a2, uint64_t a3, dispatch_time_t *a4, uint64_t a5, int64_t *a6)
{
  *a1 = dispatch_time(*a4, *a6);
  return 0;
}

uint64_t protocol witness for Decodable.init(from:) in conformance OS_dispatch_queue.SchedulerTimeType@<X0>(_QWORD *a1@<X0>, unint64_t *a2@<X8>)
{
  return OS_dispatch_queue.SchedulerTimeType.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance OS_dispatch_queue.SchedulerTimeType(_QWORD *a1)
{
  return OS_dispatch_queue.SchedulerTimeType.encode(to:)(a1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride()
{
  Swift::UInt64 *v0;
  Swift::UInt64 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  uint64_t v4;
  unint64_t v5[2];

  v2 = *a1;
  v5[0] = *a2;
  v5[1] = v2;
  OS_dispatch_queue.SchedulerTimeType.distance(to:)(v5);
  return v4 == 0;
}

void OS_dispatch_queue.SchedulerOptions.qos.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 8);
  *(_BYTE *)a1 = *(_BYTE *)v1;
  *(_QWORD *)(a1 + 8) = v2;
}

uint64_t OS_dispatch_queue.SchedulerOptions.qos.setter(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *(_BYTE *)v1 = *(_BYTE *)result;
  *(_QWORD *)(v1 + 8) = v2;
  return result;
}

uint64_t (*OS_dispatch_queue.SchedulerOptions.qos.modify())()
{
  return protocol witness for Collection.subscript.read in conformance DispatchData;
}

void OS_dispatch_queue.SchedulerOptions.flags.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
}

_QWORD *OS_dispatch_queue.SchedulerOptions.flags.setter(_QWORD *result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = *result;
  return result;
}

uint64_t (*OS_dispatch_queue.SchedulerOptions.flags.modify())()
{
  return protocol witness for Collection.subscript.read in conformance DispatchData;
}

void *OS_dispatch_queue.SchedulerOptions.group.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 24);
  v2 = v1;
  return v1;
}

void OS_dispatch_queue.SchedulerOptions.group.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
}

uint64_t (*OS_dispatch_queue.SchedulerOptions.group.modify())()
{
  return protocol witness for Collection.subscript.read in conformance DispatchData;
}

uint64_t OS_dispatch_queue.SchedulerOptions.init(qos:flags:group:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(result + 8);
  v5 = *a2;
  *(_BYTE *)a4 = *(_BYTE *)result;
  *(_QWORD *)(a4 + 8) = v4;
  *(_QWORD *)(a4 + 16) = v5;
  *(_QWORD *)(a4 + 24) = a3;
  return result;
}

void OS_dispatch_queue.minimumTolerance.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

dispatch_time_t OS_dispatch_queue.now.getter@<X0>(dispatch_time_t *a1@<X8>)
{
  dispatch_time_t result;

  result = dispatch_time(0, 0);
  *a1 = result;
  return result;
}

uint64_t *specialized static OS_dispatch_queue.SchedulerTimeType.Stride.*= infix(_:_:)(uint64_t *result, uint64_t *a2)
{
  double v2;
  double v3;
  uint64_t v4;

  v2 = (double)*a2 / 1000000000.0 * ((double)*result / 1000000000.0);
  v3 = trunc(v2 * 1000000000.0);
  v4 = 0x8000000000000000;
  if (v2 > 0.0)
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 < 9.22337204e18 && v3 > -9.22337204e18)
    v4 = (uint64_t)(v2 * 1000000000.0);
  *result = v4;
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys, &unk_1E2167E58);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys, &unk_1E2167E58);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys, &unk_1E2167E58);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys, &unk_1E2167E58);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys);
  }
  return result;
}

id outlined copy of OS_dispatch_queue.SchedulerOptions?(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id result;

  if (a4 != (void *)1)
    return a4;
  return result;
}

void outlined consume of OS_dispatch_queue.SchedulerOptions?(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4 != (void *)1)

}

uint64_t sub_18B52E498()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType.Stride, &type metadata for OS_dispatch_queue.SchedulerTimeType.Stride);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType.Stride, &type metadata for OS_dispatch_queue.SchedulerTimeType.Stride);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType.Stride, &type metadata for OS_dispatch_queue.SchedulerTimeType.Stride);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType.Stride, &type metadata for OS_dispatch_queue.SchedulerTimeType.Stride);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType.Stride, &type metadata for OS_dispatch_queue.SchedulerTimeType.Stride);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType.Stride, &type metadata for OS_dispatch_queue.SchedulerTimeType.Stride);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_queue.SchedulerTimeType.Stride, &type metadata for OS_dispatch_queue.SchedulerTimeType.Stride);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

uint64_t associated type witness table accessor for ExpressibleByFloatLiteral.FloatLiteralType : _ExpressibleByBuiltinFloatLiteral in OS_dispatch_queue.SchedulerTimeType.Stride()
{
  return MEMORY[0x1E0DEB0F0];
}

uint64_t associated type witness table accessor for Numeric.Magnitude : Numeric in OS_dispatch_queue.SchedulerTimeType.Stride()
{
  return MEMORY[0x1E0DEB450];
}

uint64_t associated type witness table accessor for ExpressibleByIntegerLiteral.IntegerLiteralType : _ExpressibleByBuiltinIntegerLiteral in OS_dispatch_queue.SchedulerTimeType.Stride()
{
  return MEMORY[0x1E0DEB488];
}

_QWORD *sub_18B52E6D8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_QWORD *sub_18B52E6E4(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void destroy for OS_dispatch_queue.SchedulerOptions(uint64_t a1)
{

}

uint64_t initializeWithCopy for OS_dispatch_queue.SchedulerOptions(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for OS_dispatch_queue.SchedulerOptions(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v3 = *(void **)(a1 + 24);
  v4 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = v4;

  return a1;
}

uint64_t assignWithTake for OS_dispatch_queue.SchedulerOptions(uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_18B52E84C + 4 * byte_18B53340F[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_18B52E86C + 4 * byte_18B533414[v4]))();
}

_BYTE *sub_18B52E84C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_18B52E86C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_18B52E874(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_18B52E87C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_18B52E884(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_18B52E88C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t getEnumTag for OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  return 0;
}

void *type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  return &unk_1E2167E58;
}

uint64_t DispatchWorkItem.__allocating_init(qos:flags:block:)(char *a1, dispatch_block_flags_t *a2, void *a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  DispatchWorkItem.init(qos:flags:block:)(a1, a2, a3);
  return v6;
}

uint64_t DispatchWorkItem.__allocating_init(flags:block:)(dispatch_block_flags_t *a1, const void *a2)
{
  uint64_t v4;
  dispatch_block_flags_t v5;
  void *v6;
  id v7;

  v4 = swift_allocObject();
  v5 = *a1;
  v6 = _Block_copy(a2);
  v7 = _swift_dispatch_block_create(v5, v6);
  _Block_release(a2);
  _Block_release(v6);
  *(_QWORD *)(v4 + 16) = v7;
  return v4;
}

uint64_t DispatchWorkItemFlags.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

Dispatch::DispatchWorkItemFlags __swiftcall DispatchWorkItemFlags.init(rawValue:)(Dispatch::DispatchWorkItemFlags rawValue)
{
  Dispatch::DispatchWorkItemFlags *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static DispatchWorkItemFlags.detached.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static DispatchWorkItemFlags.assignCurrentContext.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static DispatchWorkItemFlags.noQoS.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

Swift::Void __swiftcall DispatchWorkItem.perform()()
{
  uint64_t v0;

  (*(void (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

Swift::Void __swiftcall DispatchWorkItem.wait()()
{
  uint64_t v0;

  _swift_dispatch_block_wait(*(void **)(v0 + 16), 0xFFFFFFFFFFFFFFFFLL);
}

BOOL DispatchWorkItem.wait(wallTimeout:)(dispatch_time_t *a1)
{
  uint64_t v1;

  return _swift_dispatch_block_wait(*(void **)(v1 + 16), *a1) != 0;
}

void DispatchWorkItem.notify(queue:execute:)(void *a1, uint64_t a2)
{
  uint64_t v2;

  _swift_dispatch_block_notify(*(void **)(v2 + 16), a1, *(void **)(a2 + 16));
}

uint64_t DispatchWorkItem.deinit()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return v0;
}

intptr_t _swift_dispatch_block_wait(void *a1, dispatch_time_t a2)
{
  id v3;
  intptr_t v4;

  v3 = a1;
  v4 = dispatch_block_wait(v3, a2);

  return v4;
}

uint64_t method lookup function for DispatchWorkItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DispatchWorkItem.__allocating_init(qos:flags:block:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of DispatchWorkItem.__allocating_init(flags:block:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of DispatchWorkItem.perform()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of DispatchWorkItem.wait()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of DispatchWorkItem.wait(timeout:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))() & 1;
}

uint64_t dispatch thunk of DispatchWorkItem.wait(wallTimeout:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))() & 1;
}

uint64_t dispatch thunk of DispatchWorkItem.notify(queue:execute:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t OS_dispatch_io.StreamType.init(rawValue:)@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  if (result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!result)
    v2 = 0;
  *a2 = v2;
  return result;
}

uint64_t OS_dispatch_io.StreamType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OS_dispatch_io.StreamType(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance OS_dispatch_io.StreamType@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance OS_dispatch_io.StreamType(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t OS_dispatch_io.CloseFlags.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t OS_dispatch_io.CloseFlags.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static OS_dispatch_io.CloseFlags.stop.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance OS_dispatch_io.CloseFlags@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return specialized SetAlgebra<>.init(arrayLiteral:)(a1, a2);
}

uint64_t OS_dispatch_io.IntervalFlags.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void OS_dispatch_io.IntervalFlags.init(nilLiteral:)(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static OS_dispatch_io.read(fromFileDescriptor:maxLength:runningHandlerOn:handler:)(dispatch_fd_t a1, size_t a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  void *v11;
  _QWORD v12[6];

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a4;
  *(_QWORD *)(v10 + 24) = a5;
  v12[4] = partial apply for closure #1 in static OS_dispatch_io.read(fromFileDescriptor:maxLength:runningHandlerOn:handler:);
  v12[5] = v10;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int32) -> ();
  v12[3] = &block_descriptor_2;
  v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  dispatch_read(a1, a2, a3, v11);
  _Block_release(v11);
}

uint64_t sub_18B52EE38()
{
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in static OS_dispatch_io.read(fromFileDescriptor:maxLength:runningHandlerOn:handler:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  void (*v4)(void **, uint64_t);
  id v5;
  void *v6;

  v4 = *(void (**)(void **, uint64_t))(v2 + 16);
  v6 = a1;
  v5 = a1;
  v4(&v6, a2);

}

void thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int32) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void static OS_dispatch_io.write(toFileDescriptor:data:runningHandlerOn:handler:)(dispatch_fd_t a1, void **a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[6];

  v9 = *a2;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a4;
  *(_QWORD *)(v10 + 24) = a5;
  v13[4] = partial apply for closure #1 in static OS_dispatch_io.read(fromFileDescriptor:maxLength:runningHandlerOn:handler:);
  v13[5] = v10;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data?, @unowned Int32) -> ();
  v13[3] = &block_descriptor_6_0;
  v11 = _Block_copy(v13);
  v12 = v9;
  swift_retain();
  swift_release();
  dispatch_write(a1, v12, a3, v11);
  _Block_release(v11);

}

void thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data?, @unowned Int32) -> ()(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(void *, uint64_t);
  id v6;

  v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  swift_retain();
  v6 = a2;
  v5(a2, a3);
  swift_release();

}

dispatch_io_t OS_dispatch_io.init(type:fileDescriptor:queue:cleanupHandler:)(unsigned __int8 *a1, dispatch_fd_t a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  dispatch_io_type_t v7;
  void *v8;
  dispatch_io_t v9;
  _QWORD v11[6];

  v7 = *a1;
  v11[4] = a4;
  v11[5] = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  v11[3] = &block_descriptor_9_0;
  v8 = _Block_copy(v11);
  swift_retain();
  swift_release();
  v9 = dispatch_io_create(v7, a2, a3, v8);

  swift_release();
  _Block_release(v8);
  return v9;
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int32) -> ()(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

dispatch_io_t OS_dispatch_io.init(type:path:oflag:mode:queue:cleanupHandler:)(unsigned __int8 *a1, const char *a2, int a3, mode_t a4, NSObject *a5, uint64_t a6, uint64_t a7)
{
  dispatch_io_type_t v11;
  void *v12;
  dispatch_io_t v13;
  _QWORD v15[6];

  v11 = *a1;
  v15[4] = a6;
  v15[5] = a7;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  v15[3] = &block_descriptor_12;
  v12 = _Block_copy(v15);
  swift_retain();
  swift_release();
  v13 = dispatch_io_create_with_path(v11, a2, a3, a4, a5, v12);

  swift_release();
  _Block_release(v12);
  return v13;
}

{
  dispatch_io_type_t v11;
  void *v12;
  dispatch_io_t v13;
  _QWORD v15[6];

  v11 = *a1;
  v15[4] = a6;
  v15[5] = a7;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  v15[3] = &block_descriptor_15;
  v12 = _Block_copy(v15);
  swift_retain();
  swift_release();
  v13 = dispatch_io_create_with_path(v11, a2, a3, a4, a5, v12);

  swift_release();
  _Block_release(v12);
  return v13;
}

dispatch_io_t OS_dispatch_io.init(type:io:queue:cleanupHandler:)(unsigned __int8 *a1, NSObject *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  dispatch_io_type_t v7;
  void *v8;
  dispatch_io_t v9;
  _QWORD v11[6];

  v7 = *a1;
  v11[4] = a4;
  v11[5] = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  v11[3] = &block_descriptor_18;
  v8 = _Block_copy(v11);
  swift_retain();
  swift_release();
  v9 = dispatch_io_create_with_io(v7, a2, a3, v8);

  swift_release();
  _Block_release(v8);
  return v9;
}

void OS_dispatch_io.read(offset:length:queue:ioHandler:)(off_t a1, size_t a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  NSObject *v5;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a4;
  *(_QWORD *)(v11 + 24) = a5;
  v13[4] = partial apply for closure #1 in OS_dispatch_io.read(offset:length:queue:ioHandler:);
  v13[5] = v11;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed OS_dispatch_data?, @unowned Int32) -> ();
  v13[3] = &block_descriptor_24;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  dispatch_io_read(v5, a1, a2, a3, v12);
  _Block_release(v12);
}

void thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed OS_dispatch_data?, @unowned Int32) -> ()(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void (*v7)(uint64_t, void *, uint64_t);
  id v8;

  v7 = *(void (**)(uint64_t, void *, uint64_t))(a1 + 32);
  swift_retain();
  v8 = a3;
  v7(a2, a3, a4);
  swift_release();

}

void OS_dispatch_io.write(offset:data:queue:ioHandler:)(off_t a1, void **a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  NSObject *v5;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[6];

  v10 = *a2;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a4;
  *(_QWORD *)(v11 + 24) = a5;
  v14[4] = partial apply for closure #1 in OS_dispatch_io.read(offset:length:queue:ioHandler:);
  v14[5] = v11;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 1107296256;
  v14[2] = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed OS_dispatch_data?, @unowned Int32) -> ();
  v14[3] = &block_descriptor_30;
  v12 = _Block_copy(v14);
  v13 = v10;
  swift_retain();
  swift_release();
  dispatch_io_write(v5, a1, v13, a3, v12);
  _Block_release(v12);

}

void partial apply for closure #1 in OS_dispatch_io.read(offset:length:queue:ioHandler:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  void (*v6)(uint64_t, void **, uint64_t);
  id v7;
  void *v8;

  v6 = *(void (**)(uint64_t, void **, uint64_t))(v3 + 16);
  v8 = a2;
  v7 = a2;
  v6(a1, &v8, a3);

}

uint64_t OS_dispatch_io.setInterval(interval:flags:)(uint64_t a1)
{
  return ((uint64_t (*)(void))((char *)&loc_18B52F658 + *((int *)qword_18B52F6B0 + *(unsigned __int8 *)(a1 + 8))))();
}

void sub_18B52F668(uint64_t a1@<X1>, dispatch_io_interval_flags_t a2@<X2>, uint64_t a3@<X8>)
{
  NSObject *v3;

  if ((unsigned __int128)(a3 * (__int128)1000000000) >> 64 == (1000000000 * a3) >> 63)
    goto LABEL_4;
  if (a3 <= 0)
  {
    do
    {
      __break(1u);
LABEL_4:
      a1 = 1000000000 * a3;
    }
    while (1000000000 * a3 < 0);
  }
  dispatch_io_set_interval(v3, a1, a2);
}

void OS_dispatch_io.close(flags:)(dispatch_io_close_flags_t *a1)
{
  NSObject *v1;

  dispatch_io_close(v1, *a1);
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_io.StreamType and conformance OS_dispatch_io.StreamType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_io.StreamType and conformance OS_dispatch_io.StreamType;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.StreamType and conformance OS_dispatch_io.StreamType)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_io.StreamType, &type metadata for OS_dispatch_io.StreamType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.StreamType and conformance OS_dispatch_io.StreamType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_io.CloseFlags, &type metadata for OS_dispatch_io.CloseFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_io.CloseFlags, &type metadata for OS_dispatch_io.CloseFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_io.CloseFlags, &type metadata for OS_dispatch_io.CloseFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_io.CloseFlags, &type metadata for OS_dispatch_io.CloseFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_io.IntervalFlags, &type metadata for OS_dispatch_io.IntervalFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_io.IntervalFlags, &type metadata for OS_dispatch_io.IntervalFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_io.IntervalFlags, &type metadata for OS_dispatch_io.IntervalFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for OS_dispatch_io.IntervalFlags, &type metadata for OS_dispatch_io.IntervalFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for OS_dispatch_io.StreamType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for OS_dispatch_io.StreamType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_18B52FA34 + 4 * byte_18B533C39[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18B52FA68 + 4 * byte_18B533C34[v4]))();
}

uint64_t sub_18B52FA68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B52FA70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18B52FA78);
  return result;
}

uint64_t sub_18B52FA84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18B52FA8CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_18B52FA90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B52FA98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for OS_dispatch_io.StreamType(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OS_dispatch_io.StreamType()
{
  return &type metadata for OS_dispatch_io.StreamType;
}

ValueMetadata *type metadata accessor for OS_dispatch_io.CloseFlags()
{
  return &type metadata for OS_dispatch_io.CloseFlags;
}

ValueMetadata *type metadata accessor for OS_dispatch_io.IntervalFlags()
{
  return &type metadata for OS_dispatch_io.IntervalFlags;
}

uint64_t DispatchQoS.QoSClass.rawValue.getter()
{
  char *v0;

  return *(unsigned int *)&asc_18B534208[4 * *v0];
}

BOOL static DispatchQoS.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1);
}

void dispatchPrecondition(condition:)(void (*a1)(dispatch_queue_t *__return_ptr))
{
  dispatch_queue_t v1;
  dispatch_queue_t queue;
  char v3;

  a1(&queue);
  v1 = queue;
  if (v3)
  {
    if (v3 == 1)
      dispatch_assert_queue_barrier(queue);
    else
      dispatch_assert_queue_not_V2(queue);
  }
  else
  {
    dispatch_assert_queue_V2(queue);
  }

}

void DispatchQoS.qosClass.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t DispatchQoS.relativePriority.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

BOOL static DispatchQoS.QoSClass.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void DispatchQoS.QoSClass.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int DispatchQoS.QoSClass.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void DispatchTimeoutResult.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int DispatchTimeoutResult.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type DispatchQoS.QoSClass and conformance DispatchQoS.QoSClass()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DispatchQoS.QoSClass and conformance DispatchQoS.QoSClass;
  if (!lazy protocol witness table cache variable for type DispatchQoS.QoSClass and conformance DispatchQoS.QoSClass)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for DispatchQoS.QoSClass, &type metadata for DispatchQoS.QoSClass);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchQoS.QoSClass and conformance DispatchQoS.QoSClass);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DispatchTimeoutResult and conformance DispatchTimeoutResult()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DispatchTimeoutResult and conformance DispatchTimeoutResult;
  if (!lazy protocol witness table cache variable for type DispatchTimeoutResult and conformance DispatchTimeoutResult)
  {
    result = MEMORY[0x18D77A0D0](&protocol conformance descriptor for DispatchTimeoutResult, &type metadata for DispatchTimeoutResult);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchTimeoutResult and conformance DispatchTimeoutResult);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DispatchPredicate(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

uint64_t assignWithCopy for DispatchPredicate(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

  return a1;
}

uint64_t assignWithTake for DispatchPredicate(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for DispatchPredicate(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DispatchPredicate(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for DispatchPredicate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t storeEnumTagSinglePayload for DispatchTimeoutResult(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_18B52FEC4 + 4 * byte_18B534081[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18B52FEF8 + 4 * byte_18B53407C[v4]))();
}

uint64_t sub_18B52FEF8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B52FF00(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18B52FF08);
  return result;
}

uint64_t sub_18B52FF14(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18B52FF1CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_18B52FF20(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B52FF28(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DispatchTimeoutResult()
{
  return &type metadata for DispatchTimeoutResult;
}

void dispatch_queue_create(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_queue_create_with_target(_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_io_create(_:_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_io_create_with_path(_:_:_:_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_io_create_with_io(_:_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_read(_:_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_data_create(_:_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_data_get_size(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_data_create_map(_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_data_create_concat(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_data_create_subrange(_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_data_apply(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_data_copy_region(_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_group_async(_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_group_notify(_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_group_wait(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_io_close(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_io_set_interval(_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_apply(_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_async(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_get_global_queue(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_get_main_queue()()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_queue_attr_make_initially_inactive(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_queue_attr_make_with_autorelease_frequency(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_queue_attr_make_with_qos_class(_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_queue_get_label(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_queue_get_qos_class(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_after(_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_barrier_async(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_barrier_sync(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_queue_set_specific(_:_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_queue_get_specific(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_get_specific(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_assert_queue(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_assert_queue_barrier(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_assert_queue_not(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_semaphore_wait(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_semaphore_signal(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_source_create(_:_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_source_set_event_handler(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_source_set_cancel_handler(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_source_cancel(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_source_testcancel(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_source_get_handle(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_source_get_mask(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_source_get_data(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_source_merge_data(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_source_set_timer(_:_:_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void dispatch_source_set_registration_handler(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

Swift::UInt64 __swiftcall dispatch_time(_:_:)(Swift::UInt64 a1, Swift::Int64 a2)
{
  Swift::UInt64 result;

  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void dispatch_walltime(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_QUEUE_PRIORITY_HIGH.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_QUEUE_PRIORITY_DEFAULT.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_QUEUE_PRIORITY_LOW.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_QUEUE_PRIORITY_BACKGROUND.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_IO_STREAM.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_IO_RANDOM.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_IO_STOP.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_IO_STRICT_INTERVAL.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_MACH_SEND_DEAD.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_MEMORYPRESSURE_NORMAL.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_MEMORYPRESSURE_WARN.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_MEMORYPRESSURE_CRITICAL.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_PROC_EXIT.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_PROC_FORK.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_PROC_EXEC.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_PROC_SIGNAL.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_TIMER_STRICT.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_VNODE_DELETE.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_VNODE_WRITE.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_VNODE_EXTEND.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_VNODE_ATTRIB.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_VNODE_LINK.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_VNODE_RENAME.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_VNODE_REVOKE.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_VNODE_FUNLOCK.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_TIME_NOW.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void DISPATCH_TIME_FOREVER.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  type metadata accessor for AnyCancellable();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return MEMORY[0x1E0C95E08]();
}

uint64_t AnyCancellable.init(_:)()
{
  return MEMORY[0x1E0C95E40]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t String.init(validatingUTF8:)()
{
  return MEMORY[0x1E0DEA678]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t UnsafeRawBufferPointer.init<A>(_:)()
{
  return MEMORY[0x1E0DEAC40]();
}

uint64_t Executor.enqueue(_:)()
{
  return MEMORY[0x1E0DF05F0]();
}

{
  return MEMORY[0x1E0DF0600]();
}

uint64_t UnownedJob.init(_:)()
{
  return MEMORY[0x1E0DF06D0]();
}

uint64_t SerialExecutor.isSameExclusiveExecutionContext(other:)()
{
  return MEMORY[0x1E0DF0938]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t UnsafeMutableBufferPointer.baseAddress.getter()
{
  return MEMORY[0x1E0DEB980]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x1E0DEBD70]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x1E0DEBDF8]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x1E0DEBE00]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x1E0DEBE10]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1E0DED010]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1E0DED140]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x1E0DED5C0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x1E0DED688]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x1E0DED738]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x1E0DED9E8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
  MEMORY[0x1E0DEDF30](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x1E0DEE8E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF0](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

uint64_t dispatch_async_swift_job()
{
  return MEMORY[0x1E0C82C20]();
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void dispatch_block_notify(dispatch_block_t block, dispatch_queue_t queue, dispatch_block_t notification_block)
{
  MEMORY[0x1E0C82C80](block, queue, notification_block);
}

intptr_t dispatch_block_testcancel(dispatch_block_t block)
{
  return MEMORY[0x1E0C82C90](block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1E0C82CA0](data, applier);
}

dispatch_data_t dispatch_data_copy_region(dispatch_data_t data, size_t location, size_t *offset_ptr)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CA8](data, location, offset_ptr);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CC0](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD0](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD8](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1E0C82CE8](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
  MEMORY[0x1E0C82D58](channel, flags);
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1E0C82D60](type, *(_QWORD *)&fd, queue, cleanup_handler);
}

dispatch_io_t dispatch_io_create_with_io(dispatch_io_type_t type, dispatch_io_t io, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1E0C82D68](type, io, queue, cleanup_handler);
}

dispatch_io_t dispatch_io_create_with_path(dispatch_io_type_t type, const char *path, int oflag, mode_t mode, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1E0C82D70](type, path, *(_QWORD *)&oflag, mode, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x1E0C82D80](channel, offset, length, queue, io_handler);
}

void dispatch_io_set_interval(dispatch_io_t channel, uint64_t interval, dispatch_io_interval_flags_t flags)
{
  MEMORY[0x1E0C82D90](channel, interval, flags);
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x1E0C82DA0](channel, offset, data, queue, io_handler);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1E0C82E60](queue, relative_priority_ptr);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x1E0C82E68](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_read(dispatch_fd_t fd, size_t length, dispatch_queue_t queue, void *handler)
{
  MEMORY[0x1E0C82E90](*(_QWORD *)&fd, length, queue, handler);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F30](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_registration_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F70](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F80](source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
  MEMORY[0x1E0C82FF0](workloop, frequency);
}

void dispatch_workloop_set_os_workgroup(dispatch_workloop_t workloop, os_workgroup_t workgroup)
{
  MEMORY[0x1E0C83000](workloop, workgroup);
}

void dispatch_write(dispatch_fd_t fd, dispatch_data_t data, dispatch_queue_t queue, void *handler)
{
  MEMORY[0x1E0C83018](*(_QWORD *)&fd, data, queue, handler);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_reportError()
{
  return MEMORY[0x1E0DEEE40]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

