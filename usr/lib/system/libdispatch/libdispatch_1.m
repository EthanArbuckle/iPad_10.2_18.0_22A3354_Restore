void _dispatch_queue_xref_dispose_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of a suspended object";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_queue_xref_dispose_VARIANT_mp_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of an inactive object";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_queue_set_width_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Cannot set width of a serial queue";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_queue_set_width_VARIANT_mp_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unexpected dispatch object type";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_lane_set_target_queue_VARIANT_mp_cold_3()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Too many calls to dispatch_suspend() prior to calling dispatc"
                             "h_set_target_queue() or dispatch_set_*_handler()";
  __break(1u);
}

void _dispatch_lane_set_target_queue_VARIANT_mp_cold_4()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Cannot change the target of this object after it has been activated";
  __break(1u);
}

void _dispatch_lane_set_target_queue_VARIANT_mp_cold_5()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Cannot change the target of a queue already targeted by other"
                             " dispatch objects";
  __break(1u);
}

void _dispatch_lane_set_target_queue_VARIANT_mp_cold_6(unsigned __int8 a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unexpected dispatch object type";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_lane_legacy_set_target_queue_cold_2()
{
  if (MEMORY[0xFFFFFC100])
    kdebug_trace();
  _dispatch_bug_deprecated("Changing the target of a queue already targeted by other dispatch objects");
}

void _dispatch_queue_priority_inherit_from_target_cold_1(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Corrupted priority";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_workloop_set_cpupercent_VARIANT_mp_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: workloop qos class or priority must be set before cpupercent";
  __break(1u);
}

void _dispatch_workloop_dispose_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of a workloop while items are enqueued";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_workloop_dispose_VARIANT_mp_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of a workloop with corrupt state";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_workloop_dispose_VARIANT_mp_cold_3(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of a locked workloop";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_workloop_activate_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Process has too many threads.";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_workloop_wakeup_VARIANT_mp_cold_1(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Invalid way to wake up a workloop";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_workloop_wakeup_VARIANT_mp_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Waking up an inactive workloop";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_async_swift_job_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Used Swift only SPI to enqueue non-Swift runtime objects into dispatch";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_channel_xref_dispose_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of a channel that has not been cancelled, but has a c"
                             "ancel acknowledgement callback";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_channel_invoke_VARIANT_mp_cold_3()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Channel didn't call dispatch_channel_drain";
  __break(1u);
}

void _dispatch_channel_invoke_VARIANT_mp_cold_4()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: sync waiter found on channel";
  __break(1u);
}

void dispatch_channel_foreach_work_item_peek_f_VARIANT_mp_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Called peek after drain";
  __break(1u);
}

void dispatch_channel_drain_f_VARIANT_mp_cold_3()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Called drain twice in the same invoke";
  __break(1u);
}

void dispatch_channel_create_VARIANT_mp_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unsupported callbacks version";
  qword_1EDF52D38 = 0;
  __break(1u);
}

void _dispatch_mgr_queue_push_VARIANT_mp_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Waiter pushed onto manager";
  __break(1u);
}

void _dispatch_pthread_root_queue_create_with_observer_hooks_4IOHID_VARIANT_mp_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid pthread root queue observer hooks";
  __break(1u);
}

void _dispatch_queue_is_exclusively_owned_by_current_thread_4IOHID_VARIANT_mp_cold_1(unsigned __int16 a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid queue type";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_runloop_root_queue_perform_4CF_VARIANT_mp_cold_6(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Not a runloop queue";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_main_queue_drain_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: _dispatch_main_queue_callback_4CF called after dispatch_main()";
  __break(1u);
}

void _dispatch_main_queue_drain_cold_7()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Lingering DISPATCH_WLH_ANON";
  __break(1u);
}

void _dispatch_main_queue_drain_cold_8(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: _dispatch_main_queue_callback_4CF called from the wrong thread";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_queue_cleanup_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Premature thread exit while a dispatch queue is running";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_worker_thread_cold_1(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Pending thread request underflow";
  qword_1EDF52D38 = a1 - 1;
  __break(1u);
}

void _dispatch_root_queues_init_once_cold_1(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: QoS Maintenance support required";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_root_queues_init_once_cold_2(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Missing Kevent WORKQ support";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_root_queues_init_once_cold_3()
{
  uint64_t v0;

  v0 = **(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Unable to limit cooperative pool size";
  qword_1EDF52D38 = v0;
  __break(1u);
}

void _dispatch_root_queues_init_once_cold_4(int a1, int a2)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Root queue initialization failed";
  qword_1EDF52D38 = a2 | (a1 << 16);
  __break(1u);
}

void _dispatch_mgr_queue_drain_cold_2()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Interrupted drain on manager queue";
  __break(1u);
}

void _dispatch_root_queue_drain_deferred_wlh_cold_4(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Invalid wlh state";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_apply_with_attr_f_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: attribute's properties are invalid or meaningless on this system";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_apply_with_attr_f_cold_4(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: dispatch_apply_attr not initialized using dispatch_apply_attr_init";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_apply_attr_set_parallelism_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unknown entity";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_apply_attr_set_parallelism_VARIANT_mp_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid threads_per_entity value for CPU entity";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_apply_attr_set_parallelism_VARIANT_mp_cold_3(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid threads_per_cluster value, only acceptable value is 1";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_apply_attr_set_parallelism_VARIANT_mp_cold_4()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: 0 is an invalid threads_per_cluster value";
  qword_1EDF52D38 = 0;
  __break(1u);
}

size_t _dispatch_source_debug_VARIANT_mp(_QWORD *a1, char *a2, size_t a3)
{
  const char ***v6;
  const char *ClassName;
  int v8;
  size_t v9;
  size_t v10;
  uint64_t v11;
  char *v12;
  size_t v13;
  size_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  size_t v18;
  char v19;
  size_t v20;
  const char *v21;
  int v22;
  size_t v23;
  int v25;
  char *v26;
  unint64_t v27;

  v6 = (const char ***)a1[11];
  ClassName = object_getClassName(a1);
  v8 = snprintf(a2, a3, "%s[%p] = { ", ClassName + 12, a1);
  v9 = v8;
  if (v8 >= a3)
    v9 = a3;
  if (v8 >= 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = OUTLINED_FUNCTION_0_2();
  v14 = v10 + _dispatch_object_debug_attr_VARIANT_mp(v11, v12, v13);
  v15 = OUTLINED_FUNCTION_0_2();
  v18 = v14 + _dispatch_source_debug_attr(v15, v16, v17);
  v19 = *((_BYTE *)v6 + 29);
  if ((v19 & 2) != 0)
  {
    v25 = OUTLINED_FUNCTION_0_2();
    v18 += _dispatch_timer_debug_attr(v25, v26, v27);
    v19 = *((_BYTE *)v6 + 29);
  }
  v20 = a3 - v18;
  if ((v19 & 1) != 0)
    v21 = " (direct)";
  else
    v21 = (const char *)&unk_18A069831;
  v22 = snprintf(&a2[v18], v20, "kevent = %p%s, filter = %s }", v6, v21, **v6);
  v23 = v22;
  if (v20 < v22)
    v23 = v20;
  if (v22 < 0)
    v23 = 0;
  return v23 + v18;
}

unint64_t _dispatch_source_debug_attr(uint64_t a1, char *a2, unint64_t a3)
{
  int v4;
  unint64_t v5;

  v4 = OUTLINED_FUNCTION_1_1((int)"deleted, ", a2, "target = %s[%p], ident = 0x%x, mask = 0x%x, pending_data = 0x%llx, registered = %d, armed = %d, %s%s%s");
  v5 = v4;
  if (v4 >= a3)
    v5 = a3;
  if (v4 >= 0)
    return v5;
  else
    return 0;
}

unint64_t _dispatch_timer_debug_attr(int a1, char *a2, unint64_t a3)
{
  int v4;
  unint64_t v5;

  v4 = OUTLINED_FUNCTION_1_1(a1, a2, "timer = { target = 0x%llx, deadline = 0x%llx, interval = 0x%llx, flags = 0x%x }, ");
  v5 = v4;
  if (v4 >= a3)
    v5 = a3;
  if (v4 >= 0)
    return v5;
  else
    return 0;
}

void dispatch_source_create_VARIANT_mp_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Cannot target source to the cooperative root queue - not implemented";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_source_xref_dispose_VARIANT_mp_cold_1(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of a source that has not been cancelled, but has a ma"
                             "ndatory cancel handler";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_source_merge_data_VARIANT_mp_cold_1(char a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid source type";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_source_will_reenable_kevent_4NW_VARIANT_mp_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: _dispatch_source_will_reenable_kevent_4NW not called from wit"
                             "hin the event handler";
  __break(1u);
}

void dispatch_source_cancel_and_wait_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Source is suspended";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_source_cancel_and_wait_VARIANT_mp_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: dispatch_source_cancel_and_wait called from a source handler";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_source_cancel_and_wait_VARIANT_mp_cold_3(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Dispatch source used after last release";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_source_cancel_and_wait_VARIANT_mp_cold_4(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Source has a cancel handler";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_source_merge_evt_VARIANT_mp_cold_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(unsigned int *)(a1 + 24);
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unexpected EV_VANISHED (do not destroy random mach ports or f"
                             "ile descriptors)";
  qword_1EDF52D38 = v1;
  __break(1u);
}

uint64_t _dispatch_mach_msg_debug_VARIANT_mp(_DWORD *a1, char *a2, unint64_t a3)
{
  uint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  _DWORD *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  size_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  size_t v39;
  unint64_t v40;
  int v41;
  unint64_t v42;

  object_getClassName(a1);
  v7 = OUTLINED_FUNCTION_3_0(a2, v6, "%s[%p] = { ");
  v8 = v7;
  if (v7 >= a3)
    v8 = a3;
  if (v7 >= 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9 + OUTLINED_FUNCTION_2_0();
  v11 = a1 + 22;
  v12 = snprintf(&a2[v10], a3 - v10, "opts/err = 0x%x, msgh[%p] = { ", a1[12], a1 + 22);
  v14 = v12;
  if (a3 - v10 < v12)
    v14 = a3 - v10;
  if (v12 < 0)
    v14 = 0;
  if (a1[18])
    v11 = *(_DWORD **)v11;
  v15 = v14 + v10;
  if (v11[5])
  {
    v16 = (char *)OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_1_2(v16, v17, "id 0x%x, ");
    OUTLINED_FUNCTION_0_3();
    if (v19 < 0)
      v18 = 0;
    v15 += v18;
  }
  if (v11[1])
  {
    v20 = (char *)OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_1_2(v20, v21, "size %u, ");
    OUTLINED_FUNCTION_0_3();
    if (v23 < 0)
      v22 = 0;
    v15 += v22;
  }
  if (*v11)
  {
    OUTLINED_FUNCTION_1_2(&a2[v15], v13, "bits <l %u, r %u");
    OUTLINED_FUNCTION_0_3();
    if (v26 < 0)
      v25 = 0;
    v27 = v25 + v15;
    if ((*v11 & 0xFFE0E0E0) != 0)
    {
      v28 = (char *)OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_1_2(v28, v29, ", o 0x%x");
      OUTLINED_FUNCTION_0_3();
      if (v31 < 0)
        v30 = 0;
      v27 += v30;
    }
    OUTLINED_FUNCTION_1_2(&a2[v27], v24, ">, ");
    OUTLINED_FUNCTION_0_3();
    if (v33 < 0)
      v32 = 0;
    v15 = v32 + v27;
  }
  v34 = v11[2];
  if (v11[3])
  {
    if (v34)
      v35 = "local 0x%x, remote 0x%x";
    else
      v35 = "local 0x%x";
  }
  else if (v34)
  {
    v35 = "remote 0x%x";
  }
  else
  {
    v35 = "no ports";
  }
  OUTLINED_FUNCTION_1_2(&a2[v15], v13, v35);
  OUTLINED_FUNCTION_0_3();
  if (v38 < 0)
    v37 = 0;
  v39 = v37 + v15;
  v40 = a3 - (v37 + v15);
  v41 = OUTLINED_FUNCTION_3_0(&a2[v37 + v15], v36, " } }");
  v42 = v41;
  if (v40 < v41)
    v42 = v40;
  if (v41 < 0)
    v42 = 0;
  return v42 + v39;
}

uint64_t _dispatch_mach_debug_VARIANT_mp(id a1, char *a2, unint64_t a3)
{
  int v6;
  unint64_t v7;
  unint64_t v8;
  size_t v9;
  size_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;

  if (!*((_QWORD *)a1 + 9) || (*((_WORD *)a1 + 58) & 8) != 0)
    object_getClassName(a1);
  v6 = OUTLINED_FUNCTION_3_0(a2, (uint64_t)a2, "%s[%p] = { ");
  v7 = v6;
  if (v6 >= a3)
    v7 = a3;
  if (v6 >= 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8 + OUTLINED_FUNCTION_2_0();
  v10 = v9 + _dispatch_mach_debug_attr((uint64_t)a1, &a2[v9], a3 - v9);
  v11 = a3 - v10;
  v13 = OUTLINED_FUNCTION_3_0(&a2[v10], v12, "}");
  v14 = v13;
  if (v11 < v13)
    v14 = v11;
  if (v13 < 0)
    v14 = 0;
  return v14 + v10;
}

size_t _dispatch_mach_debug_attr(uint64_t a1, char *__str, size_t __size)
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  int v9;
  size_t v10;

  v4 = *(_QWORD **)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 120);
  v6 = (const char *)&unk_18A069831;
  if (v4)
  {
    v7 = (const char *)v4[9];
    if (!v7)
      v7 = (const char *)&unk_18A069831;
  }
  else
  {
    v7 = (const char *)&unk_18A069831;
  }
  if ((*(_BYTE *)(v5 + 30) & 1) != 0)
    v8 = " (armed)";
  else
    v8 = (const char *)&unk_18A069831;
  if (*(_QWORD *)(v5 + 48))
    v6 = " (pending)";
  v9 = snprintf(__str, __size, "target = %s[%p], receive = 0x%x, send = 0x%x, send-possible = 0x%x%s, checkin = 0x%x%s, send state = %016llx, disconnected = %d, canceled = %d ", v7, v4, *(_DWORD *)(*(_QWORD *)(a1 + 88) + 24), *(_DWORD *)(v5 + 92), *(_DWORD *)(v5 + 24), v8, *(_DWORD *)(v5 + 96), v6, *(_QWORD *)(v5 + 64), *(_DWORD *)(v5 + 88), (*(_DWORD *)(a1 + 80) >> 28) & 1);
  v10 = v9;
  if (v9 >= __size)
    v10 = __size;
  if (v9 >= 0)
    return v10;
  else
    return 0;
}

void dispatch_mach_hooks_install_4libxpc_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: trying to install hooks with unsupported version";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_mach_hooks_install_4libxpc_VARIANT_mp_cold_2()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: dispatch_mach_hooks_install_4libxpc called twice";
  qword_1EDF52D38 = (uint64_t)_dispatch_mach_xpc_hooks;
  __break(1u);
}

void _dispatch_mach_create_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Cannot target object to cooperative root queue - not implemented";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_mach_connect_VARIANT_mp_cold_1(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Channel already connected";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_mach_arm_no_senders_cold_2(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Mach port notification collision";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_mach_merge_msg_VARIANT_mp_cold_1()
{
  _dispatch_bug(687, 0);
}

void _dispatch_mach_merge_msg_VARIANT_mp_cold_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(unsigned int *)(a1 + 24);
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unexpected EV_VANISHED (do not destroy random mach ports)";
  qword_1EDF52D38 = v1;
  __break(1u);
}

void _dispatch_mach_send_and_wait_for_reply_cold_1(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid reply port";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_mach_send_and_wait_for_reply_cold_2(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Unexpected error from mach_msg_receive";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_mach_send_and_wait_for_reply_cold_3(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Overlarge message";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_mach_send_and_wait_for_reply_cold_4(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Reply received on unexpected port";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_mach_send_and_wait_for_reply_cold_5()
{
  _dispatch_bug(831, 0);
}

void _dispatch_mach_send_and_wait_for_reply_cold_6()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unable to allocate reply port, possible port leak";
  __break(1u);
}

void _dispatch_mach_handoff_context_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Trying to handoff IPC from non IPC context";
  __break(1u);
}

void _dispatch_mach_handoff_context_cold_2()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Calling dispatch_mach_handoff_reply multiple times from the same context";
  __break(1u);
}

void _dispatch_mach_install_cold_1(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Channel never connected";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_mach_msg_create_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Empty message";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_mach_msg_create_VARIANT_mp_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Message size too large";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_mach_msg_get_filter_policy_id_VARIANT_mp_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Filter id should be non-NULL";
  qword_1EDF52D38 = 0;
  __break(1u);
}

void dispatch_mach_msg_get_filter_policy_id_VARIANT_mp_cold_2(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Trailer doesn't contain filter policy id";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_mach_msg_get_filter_policy_id_VARIANT_mp_cold_3(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Trailer format is invalid";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_mach_msg_get_filter_policy_id_VARIANT_mp_cold_4(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Messsage should be non-NULL";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_mach_mig_demux_VARIANT_mp_cold_1(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: dispatch_mach_mig_demux: mach_msg(MACH_SEND_MSG) failed";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_mach_mig_demux_get_context_VARIANT_mp_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: dispatch_mach_mig_demux_get_context not called from dispatch_"
                             "mach_mig_demux context";
  __break(1u);
}

void _dispatch_sync_ipc_handoff_begin_VARIANT_mp_cold_1(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Unexpected error from kevent";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_unote_unregister_muxed_VARIANT_mp_cold_1()
{
  _dispatch_bug(1236, 0);
}

void _dispatch_unote_unregister_direct_VARIANT_mp_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Unregistration failed";
  __break(1u);
}

void _dispatch_event_loop_leave_immediate_VARIANT_mp_cold_2(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid workloop owner, possible memory corruption";
  qword_1EDF52D38 = v1;
  __break(1u);
}

void _dispatch_event_loop_leave_immediate_VARIANT_mp_cold_3(unsigned int *a1, unsigned __int16 a2)
{
  unint64_t v2;

  v2 = ((unint64_t)a2 << 16) | ((unint64_t)*a1 << 32) | 2;
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Unexpected error from kevent";
  qword_1EDF52D38 = v2;
  __break(1u);
}

void _dispatch_event_loop_leave_immediate_VARIANT_mp_cold_4(int *a1)
{
  uint64_t v1;

  v1 = *a1;
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Broken priority";
  qword_1EDF52D38 = v1;
  __break(1u);
}

void _dispatch_event_loop_leave_deferred_VARIANT_mp_cold_1(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Waking up a kq with cooperative thread request is not supported";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_event_loop_cancel_waiter_VARIANT_mp_cold_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 64);
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid workloop owner, possible memory corruption";
  qword_1EDF52D38 = v1;
  __break(1u);
}

void _dispatch_event_loop_cancel_waiter_VARIANT_mp_cold_3(uint64_t a1, unsigned __int16 a2)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Unexpected error from kevent";
  qword_1EDF52D38 = ((unint64_t)a2 << 16) | (a1 << 32) | 2;
  __break(1u);
}

void _dispatch_event_loop_wake_owner_VARIANT_mp_cold_4(uint64_t a1, unsigned __int16 a2)
{
  unint64_t v2;

  v2 = ((unint64_t)a2 << 16) | ((unint64_t)*(unsigned int *)(a1 + 24) << 32) | 2;
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Unexpected error from kevent";
  qword_1EDF52D38 = v2;
  __break(1u);
}

void _dispatch_event_loop_wake_owner_VARIANT_mp_cold_5(uint64_t a1)
{
  uint64_t v1;

  v1 = *(int *)(a1 + 12);
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Broken priority";
  qword_1EDF52D38 = v1;
  __break(1u);
}

void _dispatch_event_loop_wait_for_ownership_VARIANT_mp_cold_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 72 * a2 + 64);
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid workloop owner, possible memory corruption";
  qword_1EDF52D38 = v2;
  __break(1u);
}

void _dispatch_event_loop_wait_for_ownership_VARIANT_mp_cold_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(int *)(a1 + 72 * a2 + 12);
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Broken priority";
  qword_1EDF52D38 = v2;
  __break(1u);
}

void _dispatch_mach_msg_sender_is_kernel_VARIANT_mp_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: message received without expected trailer";
  __break(1u);
}

void _dispatch_mach_host_port_init_cold_1(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Could not get unprivileged host port";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_mach_recv_direct_merge_evt_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unexpected EV_VANISHED (do not destroy random mach ports)";
  __break(1u);
}

void _dispatch_kevent_mach_msg_recv_cold_1(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Overlarge message received";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_kevent_mach_msg_recv_cold_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(int *)(a1 + 20);
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Received message with MACH_PORT_NULL msgh_local_port";
  qword_1EDF52D38 = v1;
  __break(1u);
}

void _dispatch_kq_init_cold_1(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Failed to initalize workqueue kevent";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_kevent_mach_notify_resume_cold_1(int a1, _QWORD *a2)
{
  _dispatch_bug(2935, a1);
  *a2 &= 0xFFFFFFF2uLL;
}

uint64_t _dispatch_kevent_mach_notify_resume_cold_3(unsigned int a1, mach_port_name_t *a2, _DWORD *a3)
{
  uint64_t result;

  _dispatch_bug(2938, a1);
  result = mach_port_deallocate(*MEMORY[0x1E0C883F0], *a2);
  *a3 = result;
  if ((_DWORD)result == -301)
  {
    qword_1EDF52D08 = (uint64_t)"MIG_REPLY_MISMATCH";
    qword_1EDF52D38 = -301;
    __break(1u);
  }
  if ((_DWORD)result)
    return 1;
  return result;
}

size_t voucher_kvoucher_debug_VARIANT_mp(uint64_t a1, uint64_t a2)
{
  size_t v2;
  ipc_space_read_t v3;
  unint64_t v4;
  unint64_t v5;
  const char *v6;
  const char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  mach_port_name_t v14;
  mach_port_name_t v15;
  ipc_space_read_t v16;
  kern_return_t v17;
  mach_error_t v18;
  size_t v19;
  int v20;
  size_t v21;
  size_t v22;
  int v23;
  size_t v24;
  size_t v25;
  unint64_t v26;
  uint8_t *v27;
  int v28;
  char *v29;
  uint64_t v30;
  int v31;
  size_t v32;
  uint64_t v33;
  int v34;
  size_t v35;
  char *v36;
  uint64_t v37;
  int v38;
  size_t v39;
  char *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  int v46;
  char *v47;
  size_t v48;
  uint64_t v49;
  int v50;
  char *v51;
  size_t v52;
  char *v53;
  size_t v54;
  uint64_t v55;
  int v56;
  char *v57;
  size_t v58;
  uint64_t v59;
  int v60;
  const char *v61;
  unint64_t v62;
  size_t v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint8_t *v67;
  uint64_t v68;
  char *v69;
  size_t v70;
  uint64_t v71;
  int v72;
  char *v73;
  uint64_t v74;
  int v75;
  char *v76;
  uint64_t v77;
  int v78;
  int v79;
  unint64_t v80;
  char *v81;
  size_t v82;
  uint64_t v83;
  int v84;
  char *v86;
  size_t v87;
  uint64_t v88;
  int v89;
  char *v90;
  size_t v91;
  uint64_t v92;
  int v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  size_t v98;
  int v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  size_t v108;
  const char *v110;
  const char *v111;
  unint64_t v112;
  const char *v113;
  unsigned int object_addr[2];
  mach_msg_type_number_t recipesCnt[3];
  uint8_t recipes[8209];
  uint64_t v117;

  v3 = MEMORY[0x1E0C86820](a1, a2);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = v3;
  v117 = *MEMORY[0x1E0C874D8];
  bzero(recipes, 0x2000uLL);
  *(_QWORD *)object_addr = 0;
  *(_QWORD *)recipesCnt = 0x2000;
  if (mach_port_kernel_object(v16, v15, object_addr, &object_addr[1]) || object_addr[0] != 37)
  {
    if (v7)
    {
      v94 = (char *)OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_1_0(v94, v95, "%s");
      OUTLINED_FUNCTION_0_1();
      if (v97 < 0)
        v96 = 0;
      v9 += v96;
    }
    if (v11 >= v9)
      v98 = v11 - v9;
    else
      v98 = 0;
    v99 = snprintf((char *)(v13 + v9), v98, "Invalid voucher: 0x%x\n");
    goto LABEL_119;
  }
  v17 = mach_voucher_debug_info(v16, v15, recipes, recipesCnt);
  if (v17)
  {
    v18 = v17;
    if (v17 != 46)
    {
      if (v7)
      {
        v100 = (char *)OUTLINED_FUNCTION_2_1();
        OUTLINED_FUNCTION_1_0(v100, v101, "%s");
        OUTLINED_FUNCTION_0_1();
        if (v103 < 0)
          v102 = 0;
        v9 += v102;
      }
      if (v11 >= v9)
        v98 = v11 - v9;
      else
        v98 = 0;
      mach_error_string(v18);
      v99 = snprintf((char *)(v13 + v9), v98, "Voucher: 0x%x Failed to get contents %s\n");
      goto LABEL_119;
    }
  }
  if (!*(_QWORD *)recipesCnt)
  {
    if (v7)
    {
      v104 = (char *)OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_1_0(v104, v105, "%s");
      OUTLINED_FUNCTION_0_1();
      if (v107 < 0)
        v106 = 0;
      v9 += v106;
    }
    if (v11 >= v9)
      v98 = v11 - v9;
    else
      v98 = 0;
    v99 = snprintf((char *)(v13 + v9), v98, "Voucher: 0x%x has no contents\n");
LABEL_119:
    v108 = v99;
    if (v98 < v99)
      v108 = v98;
    if (v99 < 0)
      v108 = 0;
    return v108 + v9;
  }
  if (v7)
  {
    if (v11 >= v9)
      v19 = v11 - v9;
    else
      v19 = 0;
    v20 = snprintf((char *)(v13 + v9), v19, "%s", v7);
    v21 = v20;
    if (v19 < v20)
      v21 = v19;
    if (v20 < 0)
      v21 = 0;
    v9 += v21;
  }
  if (v11 >= v9)
    v22 = v11 - v9;
  else
    v22 = 0;
  v23 = snprintf((char *)(v13 + v9), v22, "Voucher: 0x%x\n", object_addr[1]);
  v24 = v23;
  if (v22 < v23)
    v24 = v22;
  if (v23 < 0)
    v24 = 0;
  v25 = v24 + v9;
  if (*(_QWORD *)recipesCnt)
  {
    v112 = v5;
    v113 = v7;
    v26 = 0;
    while (1)
    {
      v27 = &recipes[v26];
      v28 = *(_DWORD *)&recipes[v26];
      if (v28)
        break;
LABEL_93:
      v26 = (v26 + *((_DWORD *)v27 + 3) + 16);
      if (*(_QWORD *)recipesCnt <= v26)
        return v25;
    }
    if (v7)
    {
      v29 = (char *)OUTLINED_FUNCTION_6();
      snprintf(v29, v2, "%s", v7);
      OUTLINED_FUNCTION_0_4();
      if (v31 < 0)
        v30 = 0;
      v25 += v30;
      v28 = *(_DWORD *)v27;
    }
    if (v11 >= v25)
      v32 = v11 - v25;
    else
      v32 = 0;
    snprintf((char *)(v13 + v25), v32, "Key: %u, ", v28);
    OUTLINED_FUNCTION_0_4();
    if (v34 < 0)
      v33 = 0;
    v35 = v33 + v25;
    v36 = (char *)OUTLINED_FUNCTION_8();
    snprintf(v36, v25, "Command: %u, ", *((_DWORD *)v27 + 1));
    OUTLINED_FUNCTION_1_3();
    if (v38 < 0)
      v37 = 0;
    v39 = v37 + v35;
    v40 = (char *)OUTLINED_FUNCTION_8();
    snprintf(v40, v25, "Previous voucher: 0x%x, ", *((_DWORD *)v27 + 2));
    OUTLINED_FUNCTION_1_3();
    if (v42 < 0)
      v41 = 0;
    v43 = v41 + v39;
    v44 = (char *)OUTLINED_FUNCTION_8();
    snprintf(v44, v25, "Content size: %u\n", *((_DWORD *)v27 + 3));
    OUTLINED_FUNCTION_1_3();
    if (v46 < 0)
      v45 = 0;
    v2 = v45 + v43;
    if (*(_DWORD *)v27 == 3)
    {
      if (v7)
      {
        v53 = (char *)OUTLINED_FUNCTION_7();
        snprintf(v53, v54, "%s", v110);
        OUTLINED_FUNCTION_1_3();
        if (v56 < 0)
          v55 = 0;
        v2 += v55;
      }
      v57 = (char *)OUTLINED_FUNCTION_4_1();
      snprintf(v57, v58, "RESOURCE ACCOUNTING INFO: %s");
      goto LABEL_52;
    }
    if (*(_DWORD *)v27 == 2)
    {
      if (v7)
      {
        v47 = (char *)OUTLINED_FUNCTION_7();
        snprintf(v47, v48, "%s", v110);
        OUTLINED_FUNCTION_1_3();
        if (v50 < 0)
          v49 = 0;
        v2 += v49;
      }
      v51 = (char *)OUTLINED_FUNCTION_4_1();
      snprintf(v51, v52, "IMPORTANCE INFO: %s");
LABEL_52:
      OUTLINED_FUNCTION_1_3();
      if (v60 < 0)
        v59 = 0;
      v25 = v59 + v2;
      goto LABEL_89;
    }
    v61 = v7;
    if (*((unsigned int *)v27 + 3) >= v112)
      v62 = v112;
    else
      v62 = *((unsigned int *)v27 + 3);
    if (v11 >= v2)
      v63 = v11 - v2;
    else
      v63 = 0;
    snprintf((char *)(v13 + v2), v63, "%s%s:\n", v61, "Recipe Contents");
    OUTLINED_FUNCTION_1_3();
    if (v65 < 0)
      v64 = 0;
    v25 = v64 + v2;
    if (v62)
    {
      v66 = 0;
      v67 = v27 + 16;
      do
      {
        v68 = v66 & 0xF;
        if ((v66 & 0xF) == 0)
        {
          if (v66)
          {
            v69 = (char *)OUTLINED_FUNCTION_3_2();
            snprintf(v69, v70, "  %s\n", v111);
            OUTLINED_FUNCTION_0_4();
            if (v72 < 0)
              v71 = 0;
            v25 += v71;
          }
          v73 = (char *)OUTLINED_FUNCTION_6();
          snprintf(v73, v2, "%s  %04lx ", v113, v66);
          OUTLINED_FUNCTION_0_4();
          if (v75 < 0)
            v74 = 0;
          v25 += v74;
        }
        v76 = (char *)OUTLINED_FUNCTION_6();
        snprintf(v76, v2, " %02x", v67[v66]);
        OUTLINED_FUNCTION_0_4();
        if (v78 < 0)
          v77 = 0;
        v25 += v77;
        v79 = v67[v66];
        if ((v79 - 127) < 0xFFFFFFA1)
          LOBYTE(v79) = 46;
        recipes[v68 + 0x2000] = v79;
        ++v66;
      }
      while (v62 != v66);
      recipes[v68 + 8193] = 0;
      if ((v62 & 0xF) == 0)
      {
        v7 = v113;
LABEL_89:
        if (*(_BYTE *)(v25 + v13 - 1) != 10)
        {
          v90 = (char *)OUTLINED_FUNCTION_9();
          snprintf(v90, v91, "\n");
          OUTLINED_FUNCTION_0_4();
          if (v93 < 0)
            v92 = 0;
          v25 += v92;
        }
        goto LABEL_93;
      }
      v80 = v62 + 1;
      do
      {
        v81 = (char *)OUTLINED_FUNCTION_9();
        snprintf(v81, v82, "   ");
        OUTLINED_FUNCTION_0_4();
        if (v84 < 0)
          v83 = 0;
        v25 += v83;
      }
      while ((v80++ & 0xF) != 0);
      v86 = (char *)OUTLINED_FUNCTION_3_2();
      snprintf(v86, v87, "  %s\n", v111);
      OUTLINED_FUNCTION_0_4();
      if (v89 < 0)
        v88 = 0;
      v25 += v88;
    }
    v7 = v113;
    goto LABEL_89;
  }
  return v25;
}

void _voucher_task_mach_voucher_init_VARIANT_mp_cold_2(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Could not create task mach voucher";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _voucher_insert_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: base voucher has nested base voucher";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _voucher_insert_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: base voucher has non-zero activity value";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _voucher_insert_cold_3()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Voucher corruption";
  __break(1u);
}

void _voucher_create_with_mach_msgv_VARIANT_mp_cold_1(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Invalid msg aux data size.";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void voucher_decrement_importance_count4CF_VARIANT_mp_cold_1(uint64_t a1, int a2)
{
  _dispatch_bug(766, a1);
  if (a2 == 5)
  {
    qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Voucher importance count underflow";
    qword_1EDF52D38 = a1;
    __break(1u);
  }
}

void _voucher_activity_debug_channel_init_VARIANT_mp_cold_1(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Couldn't get debug control port";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _voucher_process_can_use_arbitrary_personas_init_cold_1(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: mach_voucher_attr_command(BANK_PERSONA_ADOPT_ANY) failed";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void voucher_activity_initialize_4libtrace_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: unsupported vah_version";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void voucher_activity_initialize_4libtrace_VARIANT_mp_cold_2()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: voucher_activity_initialize_4libtrace called twice";
  qword_1EDF52D38 = _voucher_libtrace_hooks;
  __break(1u);
}

void voucher_activity_create_with_data_2_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Absurd publen";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void voucher_activity_flush_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Allocation should always fail";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void firehose_buffer_create_VARIANT_mp_cold_2(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unable to allocate mach port";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void firehose_buffer_create_VARIANT_mp_cold_4()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Invalid values for MADVISE_CHUNK_COUNT / CHUNK_SIZE";
  qword_1EDF52D38 = 0x4000;
  __break(1u);
}

void firehose_client_reconnect_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid size for the firehose buffer";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void firehose_client_reconnect_cold_3(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unable to register with logd";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void firehose_client_reconnect_cold_9(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unable to make memory port";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void firehose_drain_notifications_once_cold_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(int *)(a1 + 20);
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: firehose_mig_server doesn't handle replies";
  qword_1EDF52D38 = v1;
  __break(1u);
}

void firehose_drain_notifications_once_cold_2(int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: firehose_drain_notifications_once() failed";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_io_debug_VARIANT_mp(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  OUTLINED_FUNCTION_1_4(v1, v2, "%s[%p] = { ");
  OUTLINED_FUNCTION_0_5();
  if (v4 >= 0)
    v5 = v3;
  else
    v5 = 0;
  OUTLINED_FUNCTION_3_3();
  v6 = OUTLINED_FUNCTION_5_0();
  v8 = _dispatch_io_debug_attr(v6, v7);
  OUTLINED_FUNCTION_1_4(&v1[v5 + v8], v9, "}");
  OUTLINED_FUNCTION_4_2();
}

uint64_t _dispatch_io_debug_attr(uint64_t a1, char *a2)
{
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_1_4(a2, (uint64_t)a2, "type = %s, fd = 0x%lx, %sfd_entry = %p, queue = %p, target = %s[%p], barrier_queue = %p, barrier_group = %p, err = 0x%x, low = 0x%zx, high = 0x%zx, interval%s = %llu ");
  OUTLINED_FUNCTION_0_5();
  if (v3 >= 0)
    return v2;
  else
    return 0;
}

void _dispatch_operation_debug_VARIANT_mp(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  OUTLINED_FUNCTION_1_4(v1, v2, "%s[%p] = { ");
  OUTLINED_FUNCTION_0_5();
  if (v4 >= 0)
    v5 = v3;
  else
    v5 = 0;
  OUTLINED_FUNCTION_3_3();
  v6 = OUTLINED_FUNCTION_5_0();
  v8 = _dispatch_operation_debug_attr(v6, v7);
  OUTLINED_FUNCTION_1_4(&v1[v5 + v8], v9, "}");
  OUTLINED_FUNCTION_4_2();
}

uint64_t _dispatch_operation_debug_attr(uint64_t a1, char *a2)
{
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_1_4(a2, (uint64_t)a2, "type = %s %s, fd = 0x%lx, fd_entry = %p, channel = %p, queue = %p -> %s[%p], target = %s[%p], offset = %lld, length = %zu, done = %zu, undelivered = %zu, flags = %u, err = 0x%x, low = 0x%zx, high = 0x%zx, interval%s = %llu ");
  OUTLINED_FUNCTION_0_5();
  if (v3 >= 0)
    return v2;
  else
    return 0;
}

uint64_t _dispatch_data_debug_VARIANT_mp(_QWORD *a1, char *__str, size_t __size)
{
  int v6;
  uint64_t v7;
  size_t v8;
  size_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  size_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  _QWORD *v18;
  int v19;
  size_t v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  size_t v24;
  int v25;
  size_t v26;
  uint64_t v28;
  uint64_t v29;

  v6 = snprintf(__str, __size, "data[%p] = { ", a1);
  v8 = v6;
  if (v6 >= __size)
    v8 = __size;
  if (v6 >= 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = &__str[v9];
  if (a1[7])
  {
    OUTLINED_FUNCTION_1_0(v10, v7, "composite, size = %zd, num_records = %zd ");
    OUTLINED_FUNCTION_0_1();
    if (v13 < 0)
      v12 = 0;
    v14 = v12 + v9;
    if (a1[4])
    {
      OUTLINED_FUNCTION_1_0(&__str[v14], v11, ", flatbuf = %p ");
      OUTLINED_FUNCTION_0_1();
      if (v16 < 0)
        v15 = 0;
      v14 += v15;
    }
    v17 = 0;
    v18 = a1 + 10;
    do
    {
      v19 = snprintf(&__str[v14], __size - v14, "record[%zd] = { from = %zd, length = %zd, data_object = %p }, ", v17, *(v18 - 1), *v18, (const void *)*(v18 - 2));
      v20 = v19;
      if (__size - v14 < v19)
        v20 = __size - v14;
      if (v19 < 0)
        v20 = 0;
      v14 += v20;
      ++v17;
      v21 = a1[7];
      if (v21 <= 1)
        v21 = 1;
      v18 += 3;
    }
    while (v17 < v21);
  }
  else
  {
    v28 = a1[6];
    v29 = a1[4];
    OUTLINED_FUNCTION_1_0(v10, v7, "leaf, size = %zd, buf = %p ");
    OUTLINED_FUNCTION_0_1();
    if (v23 < 0)
      v22 = 0;
    v14 = v22 + v9;
  }
  v24 = __size - v14;
  v25 = snprintf(&__str[v14], v24, "}", v28, v29);
  v26 = v25;
  if (v24 < v25)
    v26 = v24;
  if (v25 < 0)
    v26 = 0;
  return v26 + v14;
}

void dispatch_data_create_subrange_VARIANT_mp_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: dispatch_data_create_subrange out of bounds";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_data_copy_region_VARIANT_mp_cold_1(uint64_t a1, uint64_t a2)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: dispatch_data_copy_region out of bounds";
  qword_1EDF52D38 = a1 + a2;
  __break(1u);
}

void os_workgroup_create_with_workload_id_VARIANT_armv81_cold_1(int a1)
{
  _dispatch_log("BUG IN CLIENT of %s: Non-default attribute flags: 0x%x", "os_workgroup_create_with_workload_id$VARIANT$armv81", a1);
  OUTLINED_FUNCTION_0_0(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)));
  OUTLINED_FUNCTION_1();
}

void os_workgroup_create_with_workload_id_VARIANT_armv81_cold_2()
{
  _dispatch_log("BUG IN CLIENT of %s: Invalid attribute pointer", "os_workgroup_create_with_workload_id$VARIANT$armv81");
  OUTLINED_FUNCTION_0_0(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)));
  OUTLINED_FUNCTION_1();
}

void os_workgroup_interval_create_with_workload_id_VARIANT_armv81_cold_1(int a1)
{
  _dispatch_log("BUG IN CLIENT of %s: Non-default attribute flags: 0x%x", "os_workgroup_interval_create_with_workload_id$VARIANT$armv81", a1);
  OUTLINED_FUNCTION_0_0(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)));
  OUTLINED_FUNCTION_1();
}

void os_workgroup_interval_create_with_workload_id_VARIANT_armv81_cold_2()
{
  _dispatch_log("BUG IN CLIENT of %s: Invalid attribute pointer", "os_workgroup_interval_create_with_workload_id$VARIANT$armv81");
  OUTLINED_FUNCTION_0_0(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)));
  OUTLINED_FUNCTION_1();
}

void os_workgroup_create_with_workload_id_and_port_VARIANT_armv81_cold_2(int a1)
{
  _dispatch_bug(1488, 0);
  _dispatch_log("BUG IN CLIENT of %s: Invalid mach port 0x%x", "os_workgroup_create_with_workload_id_and_port$VARIANT$armv81", a1);
}

void os_workgroup_create_with_workload_id_and_port_VARIANT_armv81_cold_3(int a1)
{
  _dispatch_log("BUG IN CLIENT of %s: Invalid mach port 0x%x", "os_workgroup_create_with_workload_id_and_port$VARIANT$armv81", a1);
  OUTLINED_FUNCTION_0_0(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)));
  OUTLINED_FUNCTION_1();
}

void os_workgroup_create_with_workload_id_and_workgroup_VARIANT_armv81_cold_1()
{
  _dispatch_log("BUG IN CLIENT of %s: Workgroup already cancelled", "os_workgroup_create_with_workload_id_and_workgroup$VARIANT$armv81");
  OUTLINED_FUNCTION_0_0(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)));
  OUTLINED_FUNCTION_1();
}

void _os_workgroup_join_update_wg_VARIANT_armv81_cold_1()
{
  __assert_rtn("_os_workgroup_join_update_wg$VARIANT$armv81", "workgroup.c", 1653, "cur_wg == NULL");
}

void _os_workgroup_lookup_type_from_workload_id_cold_1_0()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Workload identifier must not be NULL";
  __break(1u);
}

void dispatch_suspend_VARIANT_armv81_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"API MISUSE: Object type does not support suspension";
  __break(1u);
}

void dispatch_resume_VARIANT_armv81_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"API MISUSE: Object type does not support resume";
  __break(1u);
}

void _dlock_wait_cold_2_0(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Owner in ulock is unknown - possible memory corruption";
  qword_1EDF52D38 = a1;
  __break(1u);
}

size_t _dispatch_semaphore_debug_VARIANT_armv81(uint64_t a1, char *a2, size_t a3)
{
  const char *ClassName;
  int v7;
  size_t v8;
  size_t v9;
  size_t v10;
  int v11;
  size_t v12;
  size_t v13;
  size_t v14;
  int v15;
  size_t v16;

  ClassName = object_getClassName((id)a1);
  v7 = snprintf(a2, a3, "%s[%p] = { ", ClassName + 12, (const void *)a1);
  v8 = v7;
  if (v7 >= a3)
    v8 = a3;
  if (v7 >= 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9 + _dispatch_object_debug_attr_VARIANT_mp(a1, &a2[v9], a3 - v9);
  v11 = snprintf(&a2[v10], a3 - v10, "port = 0x%x, ", *(_DWORD *)(a1 + 64));
  v12 = v11;
  if (a3 - v10 < v11)
    v12 = a3 - v10;
  if (v11 < 0)
    v12 = 0;
  v13 = v12 + v10;
  v14 = a3 - (v12 + v10);
  v15 = snprintf(&a2[v12 + v10], v14, "value = %ld, orig = %ld }", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v16 = v15;
  if (v14 < v15)
    v16 = v14;
  if (v15 < 0)
    v16 = 0;
  return v16 + v13;
}

size_t _dispatch_group_debug_VARIANT_armv81(_QWORD *a1, char *a2, size_t a3)
{
  uint64_t v6;
  const char *ClassName;
  int v8;
  size_t v9;
  size_t v10;
  size_t v11;
  size_t v12;
  int v13;
  size_t v14;

  v6 = a1[6];
  ClassName = object_getClassName(a1);
  v8 = snprintf(a2, a3, "%s[%p] = { ", ClassName + 12, a1);
  v9 = v8;
  if (v8 >= a3)
    v9 = a3;
  if (v8 >= 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10 + _dispatch_object_debug_attr_VARIANT_mp((uint64_t)a1, &a2[v10], a3 - v10);
  v12 = a3 - v11;
  v13 = snprintf(&a2[v11], v12, "count = %u, gen = %d, waiters = %d, notifs = %d }", -(v6 & 0xFFFFFFFC) >> 2, HIDWORD(v6), v6 & 1, (v6 >> 1) & 1);
  v14 = v13;
  if (v12 < v13)
    v14 = v12;
  if (v13 < 0)
    v14 = 0;
  return v14 + v11;
}

void _dispatch_group_dispose_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Group object deallocated while in use";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_group_leave_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unbalanced call to dispatch_group_leave()";
  qword_1EDF52D38 = a1;
  __break(1u);
}

uint64_t _dispatch_mach_msg_debug_VARIANT_armv81(_DWORD *a1, char *a2, unint64_t a3)
{
  uint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  _DWORD *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  size_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  size_t v39;
  unint64_t v40;
  int v41;
  unint64_t v42;

  object_getClassName(a1);
  v7 = OUTLINED_FUNCTION_3_0(a2, v6, "%s[%p] = { ");
  v8 = v7;
  if (v7 >= a3)
    v8 = a3;
  if (v7 >= 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9 + OUTLINED_FUNCTION_2_0();
  v11 = a1 + 22;
  v12 = snprintf(&a2[v10], a3 - v10, "opts/err = 0x%x, msgh[%p] = { ", a1[12], a1 + 22);
  v14 = v12;
  if (a3 - v10 < v12)
    v14 = a3 - v10;
  if (v12 < 0)
    v14 = 0;
  if (a1[18])
    v11 = *(_DWORD **)v11;
  v15 = v14 + v10;
  if (v11[5])
  {
    v16 = (char *)OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_1_2(v16, v17, "id 0x%x, ");
    OUTLINED_FUNCTION_0_3();
    if (v19 < 0)
      v18 = 0;
    v15 += v18;
  }
  if (v11[1])
  {
    v20 = (char *)OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_1_2(v20, v21, "size %u, ");
    OUTLINED_FUNCTION_0_3();
    if (v23 < 0)
      v22 = 0;
    v15 += v22;
  }
  if (*v11)
  {
    OUTLINED_FUNCTION_1_2(&a2[v15], v13, "bits <l %u, r %u");
    OUTLINED_FUNCTION_0_3();
    if (v26 < 0)
      v25 = 0;
    v27 = v25 + v15;
    if ((*v11 & 0xFFE0E0E0) != 0)
    {
      v28 = (char *)OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_1_2(v28, v29, ", o 0x%x");
      OUTLINED_FUNCTION_0_3();
      if (v31 < 0)
        v30 = 0;
      v27 += v30;
    }
    OUTLINED_FUNCTION_1_2(&a2[v27], v24, ">, ");
    OUTLINED_FUNCTION_0_3();
    if (v33 < 0)
      v32 = 0;
    v15 = v32 + v27;
  }
  v34 = v11[2];
  if (v11[3])
  {
    if (v34)
      v35 = "local 0x%x, remote 0x%x";
    else
      v35 = "local 0x%x";
  }
  else if (v34)
  {
    v35 = "remote 0x%x";
  }
  else
  {
    v35 = "no ports";
  }
  OUTLINED_FUNCTION_1_2(&a2[v15], v13, v35);
  OUTLINED_FUNCTION_0_3();
  if (v38 < 0)
    v37 = 0;
  v39 = v37 + v15;
  v40 = a3 - (v37 + v15);
  v41 = OUTLINED_FUNCTION_3_0(&a2[v37 + v15], v36, " } }");
  v42 = v41;
  if (v40 < v41)
    v42 = v40;
  if (v41 < 0)
    v42 = 0;
  return v42 + v39;
}

uint64_t _dispatch_mach_debug_VARIANT_armv81(id a1, char *a2, unint64_t a3)
{
  int v6;
  unint64_t v7;
  unint64_t v8;
  size_t v9;
  size_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;

  if (!*((_QWORD *)a1 + 9) || (*((_WORD *)a1 + 58) & 8) != 0)
    object_getClassName(a1);
  v6 = OUTLINED_FUNCTION_3_0(a2, (uint64_t)a2, "%s[%p] = { ");
  v7 = v6;
  if (v6 >= a3)
    v7 = a3;
  if (v6 >= 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8 + OUTLINED_FUNCTION_2_0();
  v10 = v9 + _dispatch_mach_debug_attr((uint64_t)a1, &a2[v9], a3 - v9);
  v11 = a3 - v10;
  v13 = OUTLINED_FUNCTION_3_0(&a2[v10], v12, "}");
  v14 = v13;
  if (v11 < v13)
    v14 = v11;
  if (v13 < 0)
    v14 = 0;
  return v14 + v10;
}

void _dispatch_mach_send_and_wait_for_reply_cold_6_0()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unable to allocate reply port, possible port leak";
  __break(1u);
}

void _dispatch_mach_handoff_context_cold_1_0()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Trying to handoff IPC from non IPC context";
  __break(1u);
}

void _dispatch_mach_handoff_context_cold_2_0()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Calling dispatch_mach_handoff_reply multiple times from the same context";
  __break(1u);
}

void dispatch_mach_mig_demux_get_context_VARIANT_armv81_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: dispatch_mach_mig_demux_get_context not called from dispatch_"
                             "mach_mig_demux context";
  __break(1u);
}

uint64_t _dispatch_queue_debug_VARIANT_armv81(id a1, char *a2, unint64_t a3)
{
  int v6;
  unint64_t v7;
  unint64_t v8;
  size_t v9;
  size_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;

  if (!*((_QWORD *)a1 + 9))
    object_getClassName(a1);
  v6 = OUTLINED_FUNCTION_3_0(a2, (uint64_t)a2, "%s[%p] = { ");
  v7 = v6;
  if (v6 >= a3)
    v7 = a3;
  if (v6 >= 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8 + _dispatch_object_debug_attr_VARIANT_mp((uint64_t)a1, &a2[v8], a3 - v8);
  v10 = v9 + _dispatch_queue_debug_attr_VARIANT_mp((uint64_t)a1, &a2[v9], a3 - v9);
  v11 = a3 - v10;
  v13 = OUTLINED_FUNCTION_3_0(&a2[v10], v12, "}");
  v14 = v13;
  if (v11 < v13)
    v14 = v11;
  if (v13 < 0)
    v14 = 0;
  return v14 + v10;
}

size_t _dispatch_channel_debug_VARIANT_armv81(void *a1, uint64_t a2, unint64_t a3)
{
  const char *ClassName;
  uint64_t v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unint64_t v15;

  ClassName = object_getClassName(a1);
  v8 = OUTLINED_FUNCTION_4_0((uint64_t)ClassName, v7, "%s[%p] = { ");
  v9 = v8;
  if (v8 >= a3)
    v9 = a3;
  if (v8 >= 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10 + _dispatch_object_debug_attr_VARIANT_mp((uint64_t)a1, (char *)(a2 + v10), a3 - v10);
  v12 = _dispatch_queue_debug_attr_VARIANT_mp((uint64_t)a1, (char *)(a2 + v11), a3 - v11);
  v14 = OUTLINED_FUNCTION_4_0(v12, v13, "%s%s%s");
  v15 = v14;
  if (v14 >= a3)
    v15 = a3;
  if (v14 < 0)
    v15 = 0;
  return v11 + v15 + v12;
}

void dispatch_assert_queue_V2_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: invalid queue passed to dispatch_assert_queue()";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_assert_queue_not_V2_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: invalid queue passed to dispatch_assert_queue_not()";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_block_perform_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid flags passed to dispatch_block_perform()";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_block_cancel_VARIANT_armv81_cold_2()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid block object passed to dispatch_block_cancel()";
  __break(1u);
}

void dispatch_block_testcancel_VARIANT_armv81_cold_2()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid block object passed to dispatch_block_testcancel()";
  __break(1u);
}

void dispatch_block_wait_VARIANT_armv81_cold_4()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid block object passed to dispatch_block_wait()";
  __break(1u);
}

void dispatch_block_notify_VARIANT_armv81_cold_3(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid block object passed to dispatch_block_notify()";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_queue_set_label_nocopy_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Cannot change label for this queue";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_set_qos_class_floor_VARIANT_armv81_cold_2()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: dispatch_set_qos_class_floor called on invalid object type";
  __break(1u);
}

void dispatch_set_qos_class_VARIANT_armv81_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: dispatch_set_qos_class called on invalid object type";
  __break(1u);
}

void dispatch_set_qos_class_fallback_VARIANT_armv81_cold_2()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: dispatch_set_qos_class_fallback called on invalid object type";
  __break(1u);
}

void _dispatch_lane_class_dispose_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of a queue with corrupt state";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_lane_class_dispose_VARIANT_armv81_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Premature release of a locked queue";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_queue_xref_dispose_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of a suspended object";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_queue_xref_dispose_VARIANT_armv81_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of an inactive object";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_queue_set_width_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Cannot set width of a serial queue";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_queue_set_width_VARIANT_armv81_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unexpected dispatch object type";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_lane_set_target_queue_VARIANT_armv81_cold_3()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Too many calls to dispatch_suspend() prior to calling dispatc"
                             "h_set_target_queue() or dispatch_set_*_handler()";
  __break(1u);
}

void _dispatch_lane_set_target_queue_VARIANT_armv81_cold_5()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Cannot change the target of a queue already targeted by other"
                             " dispatch objects";
  __break(1u);
}

void dispatch_workloop_set_cpupercent_VARIANT_armv81_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: workloop qos class or priority must be set before cpupercent";
  __break(1u);
}

void _dispatch_workloop_dispose_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of a workloop while items are enqueued";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_workloop_dispose_VARIANT_armv81_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of a workloop with corrupt state";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_workloop_dispose_VARIANT_armv81_cold_3(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of a locked workloop";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_workloop_activate_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Process has too many threads.";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_workloop_wakeup_VARIANT_armv81_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Waking up an inactive workloop";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_async_swift_job_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Used Swift only SPI to enqueue non-Swift runtime objects into dispatch";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_channel_xref_dispose_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Release of a channel that has not been cancelled, but has a c"
                             "ancel acknowledgement callback";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_channel_invoke_VARIANT_armv81_cold_3()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Channel didn't call dispatch_channel_drain";
  __break(1u);
}

void _dispatch_channel_invoke_VARIANT_armv81_cold_4()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: sync waiter found on channel";
  __break(1u);
}

void dispatch_channel_foreach_work_item_peek_f_VARIANT_armv81_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Called peek after drain";
  __break(1u);
}

void dispatch_channel_drain_f_VARIANT_armv81_cold_3()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Called drain twice in the same invoke";
  __break(1u);
}

void _dispatch_mgr_queue_push_VARIANT_armv81_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Waiter pushed onto manager";
  __break(1u);
}

void _dispatch_pthread_root_queue_create_with_observer_hooks_4IOHID_VARIANT_armv81_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid pthread root queue observer hooks";
  __break(1u);
}

void _dispatch_main_queue_drain_cold_1_0()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: _dispatch_main_queue_callback_4CF called after dispatch_main()";
  __break(1u);
}

void _dispatch_main_queue_drain_cold_8_0(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: _dispatch_main_queue_callback_4CF called from the wrong thread";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_queue_cleanup_cold_1_0(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Premature thread exit while a dispatch queue is running";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_mgr_queue_drain_cold_2_0()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Interrupted drain on manager queue";
  __break(1u);
}

void _dispatch_root_queue_drain_deferred_wlh_cold_4_0(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Invalid wlh state";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_apply_with_attr_f_cold_2_0(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: attribute's properties are invalid or meaningless on this system";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_apply_attr_set_parallelism_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Unknown entity";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_apply_attr_set_parallelism_VARIANT_armv81_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid threads_per_entity value for CPU entity";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_apply_attr_set_parallelism_VARIANT_armv81_cold_3(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid threads_per_cluster value, only acceptable value is 1";
  qword_1EDF52D38 = a1;
  __break(1u);
}

size_t _dispatch_source_debug_VARIANT_armv81(_QWORD *a1, char *a2, size_t a3)
{
  const char ***v6;
  const char *ClassName;
  int v8;
  size_t v9;
  size_t v10;
  uint64_t v11;
  char *v12;
  size_t v13;
  size_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  size_t v18;
  char v19;
  size_t v20;
  const char *v21;
  int v22;
  size_t v23;
  int v25;
  char *v26;
  unint64_t v27;

  v6 = (const char ***)a1[11];
  ClassName = object_getClassName(a1);
  v8 = snprintf(a2, a3, "%s[%p] = { ", ClassName + 12, a1);
  v9 = v8;
  if (v8 >= a3)
    v9 = a3;
  if (v8 >= 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = OUTLINED_FUNCTION_0_2();
  v14 = v10 + _dispatch_object_debug_attr_VARIANT_mp(v11, v12, v13);
  v15 = OUTLINED_FUNCTION_0_2();
  v18 = v14 + _dispatch_source_debug_attr(v15, v16, v17);
  v19 = *((_BYTE *)v6 + 29);
  if ((v19 & 2) != 0)
  {
    v25 = OUTLINED_FUNCTION_0_2();
    v18 += _dispatch_timer_debug_attr(v25, v26, v27);
    v19 = *((_BYTE *)v6 + 29);
  }
  v20 = a3 - v18;
  if ((v19 & 1) != 0)
    v21 = " (direct)";
  else
    v21 = (const char *)&unk_18A069831;
  v22 = snprintf(&a2[v18], v20, "kevent = %p%s, filter = %s }", v6, v21, **v6);
  v23 = v22;
  if (v20 < v22)
    v23 = v20;
  if (v22 < 0)
    v23 = 0;
  return v23 + v18;
}

void dispatch_source_create_VARIANT_armv81_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Cannot target source to the cooperative root queue - not implemented";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_source_will_reenable_kevent_4NW_VARIANT_armv81_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: _dispatch_source_will_reenable_kevent_4NW not called from wit"
                             "hin the event handler";
  __break(1u);
}

void dispatch_source_cancel_and_wait_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Source is suspended";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_source_cancel_and_wait_VARIANT_armv81_cold_2(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: dispatch_source_cancel_and_wait called from a source handler";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_source_cancel_and_wait_VARIANT_armv81_cold_3(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Dispatch source used after last release";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void dispatch_source_cancel_and_wait_VARIANT_armv81_cold_4(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Source has a cancel handler";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_unote_unregister_direct_VARIANT_armv81_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Unregistration failed";
  __break(1u);
}

size_t voucher_kvoucher_debug_VARIANT_armv81(uint64_t a1, uint64_t a2)
{
  size_t v2;
  ipc_space_read_t v3;
  unint64_t v4;
  unint64_t v5;
  const char *v6;
  const char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  mach_port_name_t v14;
  mach_port_name_t v15;
  ipc_space_read_t v16;
  kern_return_t v17;
  mach_error_t v18;
  size_t v19;
  int v20;
  size_t v21;
  size_t v22;
  int v23;
  size_t v24;
  size_t v25;
  unint64_t v26;
  uint8_t *v27;
  int v28;
  char *v29;
  uint64_t v30;
  int v31;
  size_t v32;
  uint64_t v33;
  int v34;
  size_t v35;
  char *v36;
  uint64_t v37;
  int v38;
  size_t v39;
  char *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  int v46;
  char *v47;
  size_t v48;
  uint64_t v49;
  int v50;
  char *v51;
  size_t v52;
  char *v53;
  size_t v54;
  uint64_t v55;
  int v56;
  char *v57;
  size_t v58;
  uint64_t v59;
  int v60;
  const char *v61;
  unint64_t v62;
  size_t v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint8_t *v67;
  uint64_t v68;
  char *v69;
  size_t v70;
  uint64_t v71;
  int v72;
  char *v73;
  uint64_t v74;
  int v75;
  char *v76;
  uint64_t v77;
  int v78;
  int v79;
  unint64_t v80;
  char *v81;
  size_t v82;
  uint64_t v83;
  int v84;
  char *v86;
  size_t v87;
  uint64_t v88;
  int v89;
  char *v90;
  size_t v91;
  uint64_t v92;
  int v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  size_t v98;
  int v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  size_t v108;
  const char *v110;
  const char *v111;
  unint64_t v112;
  const char *v113;
  unsigned int object_addr[2];
  mach_msg_type_number_t recipesCnt[3];
  uint8_t recipes[8209];
  uint64_t v117;

  v3 = MEMORY[0x1E0C86820](a1, a2);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = v3;
  v117 = *MEMORY[0x1E0C874D8];
  bzero(recipes, 0x2000uLL);
  *(_QWORD *)object_addr = 0;
  *(_QWORD *)recipesCnt = 0x2000;
  if (mach_port_kernel_object(v16, v15, object_addr, &object_addr[1]) || object_addr[0] != 37)
  {
    if (v7)
    {
      v94 = (char *)OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_1_0(v94, v95, "%s");
      OUTLINED_FUNCTION_0_1();
      if (v97 < 0)
        v96 = 0;
      v9 += v96;
    }
    if (v11 >= v9)
      v98 = v11 - v9;
    else
      v98 = 0;
    v99 = snprintf((char *)(v13 + v9), v98, "Invalid voucher: 0x%x\n");
    goto LABEL_119;
  }
  v17 = mach_voucher_debug_info(v16, v15, recipes, recipesCnt);
  if (v17)
  {
    v18 = v17;
    if (v17 != 46)
    {
      if (v7)
      {
        v100 = (char *)OUTLINED_FUNCTION_2_1();
        OUTLINED_FUNCTION_1_0(v100, v101, "%s");
        OUTLINED_FUNCTION_0_1();
        if (v103 < 0)
          v102 = 0;
        v9 += v102;
      }
      if (v11 >= v9)
        v98 = v11 - v9;
      else
        v98 = 0;
      mach_error_string(v18);
      v99 = snprintf((char *)(v13 + v9), v98, "Voucher: 0x%x Failed to get contents %s\n");
      goto LABEL_119;
    }
  }
  if (!*(_QWORD *)recipesCnt)
  {
    if (v7)
    {
      v104 = (char *)OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_1_0(v104, v105, "%s");
      OUTLINED_FUNCTION_0_1();
      if (v107 < 0)
        v106 = 0;
      v9 += v106;
    }
    if (v11 >= v9)
      v98 = v11 - v9;
    else
      v98 = 0;
    v99 = snprintf((char *)(v13 + v9), v98, "Voucher: 0x%x has no contents\n");
LABEL_119:
    v108 = v99;
    if (v98 < v99)
      v108 = v98;
    if (v99 < 0)
      v108 = 0;
    return v108 + v9;
  }
  if (v7)
  {
    if (v11 >= v9)
      v19 = v11 - v9;
    else
      v19 = 0;
    v20 = snprintf((char *)(v13 + v9), v19, "%s", v7);
    v21 = v20;
    if (v19 < v20)
      v21 = v19;
    if (v20 < 0)
      v21 = 0;
    v9 += v21;
  }
  if (v11 >= v9)
    v22 = v11 - v9;
  else
    v22 = 0;
  v23 = snprintf((char *)(v13 + v9), v22, "Voucher: 0x%x\n", object_addr[1]);
  v24 = v23;
  if (v22 < v23)
    v24 = v22;
  if (v23 < 0)
    v24 = 0;
  v25 = v24 + v9;
  if (*(_QWORD *)recipesCnt)
  {
    v112 = v5;
    v113 = v7;
    v26 = 0;
    while (1)
    {
      v27 = &recipes[v26];
      v28 = *(_DWORD *)&recipes[v26];
      if (v28)
        break;
LABEL_93:
      v26 = (v26 + *((_DWORD *)v27 + 3) + 16);
      if (*(_QWORD *)recipesCnt <= v26)
        return v25;
    }
    if (v7)
    {
      v29 = (char *)OUTLINED_FUNCTION_6();
      snprintf(v29, v2, "%s", v7);
      OUTLINED_FUNCTION_0_4();
      if (v31 < 0)
        v30 = 0;
      v25 += v30;
      v28 = *(_DWORD *)v27;
    }
    if (v11 >= v25)
      v32 = v11 - v25;
    else
      v32 = 0;
    snprintf((char *)(v13 + v25), v32, "Key: %u, ", v28);
    OUTLINED_FUNCTION_0_4();
    if (v34 < 0)
      v33 = 0;
    v35 = v33 + v25;
    v36 = (char *)OUTLINED_FUNCTION_8();
    snprintf(v36, v25, "Command: %u, ", *((_DWORD *)v27 + 1));
    OUTLINED_FUNCTION_1_3();
    if (v38 < 0)
      v37 = 0;
    v39 = v37 + v35;
    v40 = (char *)OUTLINED_FUNCTION_8();
    snprintf(v40, v25, "Previous voucher: 0x%x, ", *((_DWORD *)v27 + 2));
    OUTLINED_FUNCTION_1_3();
    if (v42 < 0)
      v41 = 0;
    v43 = v41 + v39;
    v44 = (char *)OUTLINED_FUNCTION_8();
    snprintf(v44, v25, "Content size: %u\n", *((_DWORD *)v27 + 3));
    OUTLINED_FUNCTION_1_3();
    if (v46 < 0)
      v45 = 0;
    v2 = v45 + v43;
    if (*(_DWORD *)v27 == 3)
    {
      if (v7)
      {
        v53 = (char *)OUTLINED_FUNCTION_7();
        snprintf(v53, v54, "%s", v110);
        OUTLINED_FUNCTION_1_3();
        if (v56 < 0)
          v55 = 0;
        v2 += v55;
      }
      v57 = (char *)OUTLINED_FUNCTION_4_1();
      snprintf(v57, v58, "RESOURCE ACCOUNTING INFO: %s");
      goto LABEL_52;
    }
    if (*(_DWORD *)v27 == 2)
    {
      if (v7)
      {
        v47 = (char *)OUTLINED_FUNCTION_7();
        snprintf(v47, v48, "%s", v110);
        OUTLINED_FUNCTION_1_3();
        if (v50 < 0)
          v49 = 0;
        v2 += v49;
      }
      v51 = (char *)OUTLINED_FUNCTION_4_1();
      snprintf(v51, v52, "IMPORTANCE INFO: %s");
LABEL_52:
      OUTLINED_FUNCTION_1_3();
      if (v60 < 0)
        v59 = 0;
      v25 = v59 + v2;
      goto LABEL_89;
    }
    v61 = v7;
    if (*((unsigned int *)v27 + 3) >= v112)
      v62 = v112;
    else
      v62 = *((unsigned int *)v27 + 3);
    if (v11 >= v2)
      v63 = v11 - v2;
    else
      v63 = 0;
    snprintf((char *)(v13 + v2), v63, "%s%s:\n", v61, "Recipe Contents");
    OUTLINED_FUNCTION_1_3();
    if (v65 < 0)
      v64 = 0;
    v25 = v64 + v2;
    if (v62)
    {
      v66 = 0;
      v67 = v27 + 16;
      do
      {
        v68 = v66 & 0xF;
        if ((v66 & 0xF) == 0)
        {
          if (v66)
          {
            v69 = (char *)OUTLINED_FUNCTION_3_2();
            snprintf(v69, v70, "  %s\n", v111);
            OUTLINED_FUNCTION_0_4();
            if (v72 < 0)
              v71 = 0;
            v25 += v71;
          }
          v73 = (char *)OUTLINED_FUNCTION_6();
          snprintf(v73, v2, "%s  %04lx ", v113, v66);
          OUTLINED_FUNCTION_0_4();
          if (v75 < 0)
            v74 = 0;
          v25 += v74;
        }
        v76 = (char *)OUTLINED_FUNCTION_6();
        snprintf(v76, v2, " %02x", v67[v66]);
        OUTLINED_FUNCTION_0_4();
        if (v78 < 0)
          v77 = 0;
        v25 += v77;
        v79 = v67[v66];
        if ((v79 - 127) < 0xFFFFFFA1)
          LOBYTE(v79) = 46;
        recipes[v68 + 0x2000] = v79;
        ++v66;
      }
      while (v62 != v66);
      recipes[v68 + 8193] = 0;
      if ((v62 & 0xF) == 0)
      {
        v7 = v113;
LABEL_89:
        if (*(_BYTE *)(v25 + v13 - 1) != 10)
        {
          v90 = (char *)OUTLINED_FUNCTION_9();
          snprintf(v90, v91, "\n");
          OUTLINED_FUNCTION_0_4();
          if (v93 < 0)
            v92 = 0;
          v25 += v92;
        }
        goto LABEL_93;
      }
      v80 = v62 + 1;
      do
      {
        v81 = (char *)OUTLINED_FUNCTION_9();
        snprintf(v81, v82, "   ");
        OUTLINED_FUNCTION_0_4();
        if (v84 < 0)
          v83 = 0;
        v25 += v83;
      }
      while ((v80++ & 0xF) != 0);
      v86 = (char *)OUTLINED_FUNCTION_3_2();
      snprintf(v86, v87, "  %s\n", v111);
      OUTLINED_FUNCTION_0_4();
      if (v89 < 0)
        v88 = 0;
      v25 += v88;
    }
    v7 = v113;
    goto LABEL_89;
  }
  return v25;
}

void voucher_activity_initialize_4libtrace_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: unsupported vah_version";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void voucher_activity_create_with_data_2_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Absurd publen";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void voucher_activity_flush_VARIANT_armv81_cold_1(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN LIBDISPATCH: Allocation should always fail";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void firehose_client_reconnect_cold_1_0(uint64_t a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid size for the firehose buffer";
  qword_1EDF52D38 = a1;
  __break(1u);
}

void _dispatch_io_debug_VARIANT_armv81(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  OUTLINED_FUNCTION_1_4(v1, v2, "%s[%p] = { ");
  OUTLINED_FUNCTION_0_5();
  if (v4 >= 0)
    v5 = v3;
  else
    v5 = 0;
  OUTLINED_FUNCTION_3_3();
  v6 = OUTLINED_FUNCTION_5_0();
  v8 = _dispatch_io_debug_attr(v6, v7);
  OUTLINED_FUNCTION_1_4(&v1[v5 + v8], v9, "}");
  OUTLINED_FUNCTION_4_2();
}

void _dispatch_operation_debug_VARIANT_armv81(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  OUTLINED_FUNCTION_1_4(v1, v2, "%s[%p] = { ");
  OUTLINED_FUNCTION_0_5();
  if (v4 >= 0)
    v5 = v3;
  else
    v5 = 0;
  OUTLINED_FUNCTION_3_3();
  v6 = OUTLINED_FUNCTION_5_0();
  v8 = _dispatch_operation_debug_attr(v6, v7);
  OUTLINED_FUNCTION_1_4(&v1[v5 + v8], v9, "}");
  OUTLINED_FUNCTION_4_2();
}

uint64_t _dispatch_data_debug_VARIANT_armv81(_QWORD *a1, char *__str, size_t __size)
{
  int v6;
  uint64_t v7;
  size_t v8;
  size_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  size_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  _QWORD *v18;
  int v19;
  size_t v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  size_t v24;
  int v25;
  size_t v26;
  uint64_t v28;
  uint64_t v29;

  v6 = snprintf(__str, __size, "data[%p] = { ", a1);
  v8 = v6;
  if (v6 >= __size)
    v8 = __size;
  if (v6 >= 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = &__str[v9];
  if (a1[7])
  {
    OUTLINED_FUNCTION_1_0(v10, v7, "composite, size = %zd, num_records = %zd ");
    OUTLINED_FUNCTION_0_1();
    if (v13 < 0)
      v12 = 0;
    v14 = v12 + v9;
    if (a1[4])
    {
      OUTLINED_FUNCTION_1_0(&__str[v14], v11, ", flatbuf = %p ");
      OUTLINED_FUNCTION_0_1();
      if (v16 < 0)
        v15 = 0;
      v14 += v15;
    }
    v17 = 0;
    v18 = a1 + 10;
    do
    {
      v19 = snprintf(&__str[v14], __size - v14, "record[%zd] = { from = %zd, length = %zd, data_object = %p }, ", v17, *(v18 - 1), *v18, (const void *)*(v18 - 2));
      v20 = v19;
      if (__size - v14 < v19)
        v20 = __size - v14;
      if (v19 < 0)
        v20 = 0;
      v14 += v20;
      ++v17;
      v21 = a1[7];
      if (v21 <= 1)
        v21 = 1;
      v18 += 3;
    }
    while (v17 < v21);
  }
  else
  {
    v28 = a1[6];
    v29 = a1[4];
    OUTLINED_FUNCTION_1_0(v10, v7, "leaf, size = %zd, buf = %p ");
    OUTLINED_FUNCTION_0_1();
    if (v23 < 0)
      v22 = 0;
    v14 = v22 + v9;
  }
  v24 = __size - v14;
  v25 = snprintf(&__str[v14], v24, "}", v28, v29);
  v26 = v25;
  if (v24 < v25)
    v26 = v24;
  if (v25 < 0)
    v26 = 0;
  return v26 + v14;
}

void _dispatch_bug(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  if (qword_1EDF52D88 != -1)
    dispatch_once_f_0(&qword_1EDF52D88, 0, (dispatch_function_t)_dispatch_build_init);
  v5 = qword_1EDF52D90;
  qword_1EDF52D90 = v2;
  if (v2 != v5)
    _dispatch_log("BUG in libdispatch: %s - %lu - 0x%lx", byte_1EDF52DB8, a1, a2);
  OUTLINED_FUNCTION_2_3();
}

void _dispatch_log(char *__format, ...)
{
  char *v2;
  va_list va;

  va_start(va, __format);
  if (qword_1EDF52DB0 != -1)
    dispatch_once_f_0(&qword_1EDF52DB0, 0, (dispatch_function_t)_dispatch_logv_init);
  if ((_MergedGlobals & 1) == 0)
  {
    if (dispatch_logfile == -1)
    {
      v2 = 0;
      vasprintf(&v2, __format, va);
      if (v2)
      {
        _simple_asl_log();
        free(v2);
      }
    }
    else
    {
      _dispatch_logv_file(__format, va);
    }
  }
  OUTLINED_FUNCTION_4_3();
}

void _dispatch_bug_mach_client(const char *a1, mach_error_t error_value)
{
  uint64_t v2;
  uint64_t v3;
  char *v6;
  char *v7;
  char v8;

  v3 = _dispatch_bug_mach_client_last_seen;
  _dispatch_bug_mach_client_last_seen = v2;
  if (v2 == v3
    || (v6 = mach_error_string(error_value),
        _dispatch_log("BUG in libdispatch client: %s %s - 0x%x", a1, v6, error_value),
        v7 = mach_error_string(error_value),
        _dispatch_fault((uint64_t)"LIBDISPATCH_STRICT: _dispatch_bug_mach_client", "BUG in libdispatch client: %s %s - 0x%x", a1, v7, error_value), OUTLINED_FUNCTION_0_6(), (v8 & 1) == 0))
  {
    OUTLINED_FUNCTION_2_3();
  }
  else
  {
    qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: LIBDISPATCH_STRICT: _dispatch_bug_mach_client";
    __break(1u);
  }
}

void _dispatch_bug_kevent_client(const char *a1, const char *a2, const char *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  const char *v8;
  const char *v11;
  uint64_t v15;
  _QWORD *v16;
  const void *function_symbol;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  const void *v42;

  v8 = (const char *)v7;
  LODWORD(v11) = a4;
  if (a7)
  {
    v15 = *(_QWORD *)(*(_QWORD *)~*(_QWORD *)(a7 + 8) + 40);
    if (v15 == 787)
    {
      function_symbol = *(const void **)(a7 + 40);
    }
    else if (v15 == 275 && (v16 = *(_QWORD **)(a7 + 40)) != 0)
    {
      function_symbol = (const void *)_dispatch_continuation_get_function_symbol(v16);
    }
    else
    {
      function_symbol = 0;
    }
    a2 = **(const char ***)a7;
    if (!a3)
      goto LABEL_15;
  }
  else
  {
    function_symbol = 0;
    if (!a3)
      goto LABEL_15;
  }
  if ((_DWORD)v11)
  {
    v19 = qword_1EDF52D98;
    qword_1EDF52D98 = v7;
    if (v7 == v19)
      return;
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_3_4();
    v8 = "BUG in libdispatch client: %s %s: \"%s\" - 0x%x { 0x%llx[%s], ident: %lld / 0x%llx, handler: %p }";
    _dispatch_log("BUG in libdispatch client: %s %s: \"%s\" - 0x%x { 0x%llx[%s], ident: %lld / 0x%llx, handler: %p }", a1, v27, v29, v31, v33, v35, v37, v39, v41);
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_3_4();
    _dispatch_fault((uint64_t)"LIBDISPATCH_STRICT: _dispatch_bug_kevent_client", "BUG in libdispatch client: %s %s: \"%s\" - 0x%x { 0x%llx[%s], ident: %lld / 0x%llx, handler: %p }", a1, v28, v30, v32, v34, v36, v38, v40, v42);
    OUTLINED_FUNCTION_0_6();
    if ((v20 & 1) == 0)
      return;
    qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: LIBDISPATCH_STRICT: _dispatch_bug_kevent_client";
    __break(1u);
  }
LABEL_15:
  if (a3)
  {
    v21 = qword_1EDF52DA0;
    qword_1EDF52DA0 = (uint64_t)v8;
    if (v8 == (const char *)v21)
      return;
    v11 = "BUG in libdispatch client: %s %s{ 0x%llx[%s], ident: %lld / 0x%llx, handler: %p }";
    _dispatch_log("BUG in libdispatch client: %s %s{ 0x%llx[%s], ident: %lld / 0x%llx, handler: %p }", a1, a3, a6, a2, a5, a5, function_symbol);
    _dispatch_fault((uint64_t)"LIBDISPATCH_STRICT: _dispatch_bug_kevent_client", "BUG in libdispatch client: %s %s{ 0x%llx[%s], ident: %lld / 0x%llx, handler: %p }", a1, a3, a6, a2, a5, a5, function_symbol);
    OUTLINED_FUNCTION_0_6();
    if ((v22 & 1) == 0)
      return;
    qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: LIBDISPATCH_STRICT: _dispatch_bug_kevent_client";
    __break(1u);
  }
  v23 = qword_1EDF52DA8;
  qword_1EDF52DA8 = (uint64_t)v8;
  if (v8 != (const char *)v23)
  {
    v24 = OUTLINED_FUNCTION_5_1();
    _dispatch_log("BUG in libdispatch: %s: \"%s\" - 0x%x{ 0x%llx[%s], ident: %lld / 0x%llx, handler: %p }", a1, v24, (_DWORD)v11, a6, a2, a5, a5, function_symbol);
    v25 = strerror((int)v11);
    _dispatch_fault((uint64_t)"LIBDISPATCH_STRICT: _dispatch_bug_kevent_client", "BUG in libdispatch: %s: \"%s\" - 0x%x{ 0x%llx[%s], ident: %lld / 0x%llx, handler: %p }", a1, v25, (_DWORD)v11, a6, a2, a5, a5, function_symbol);
    OUTLINED_FUNCTION_0_6();
    if ((v26 & 1) != 0)
    {
      qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: LIBDISPATCH_STRICT: _dispatch_bug_kevent_client";
      __break(1u);
    }
  }
}

void _dispatch_bug_kevent_vanished(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;
  const char *v5;
  const char *v6;
  const void *v7;
  const void *v8;
  const char *v9;
  const char *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  const void *v15;
  const void *v16;

  if (*(_QWORD *)(*(_QWORD *)~*(_QWORD *)(a1 + 8) + 40) == 275)
  {
    v2 = *(_QWORD **)(a1 + 40);
    if (v2)
      _dispatch_continuation_get_function_symbol(v2);
  }
  v3 = _dispatch_bug_kevent_vanished_last_seen;
  _dispatch_bug_kevent_vanished_last_seen = v1;
  if (v1 != v3)
  {
    OUTLINED_FUNCTION_1_5();
    _dispatch_log("BUG in libdispatch client: %s, monitored resource vanished before the source cancel handler was invoked { %p[%s], ident: %d / 0x%x, handler: %p }", v5, v7, v9, v11, v13, v15);
    OUTLINED_FUNCTION_1_5();
    _dispatch_fault((uint64_t)"LIBDISPATCH_STRICT: _dispatch_bug_kevent_vanished", "BUG in libdispatch client: %s, monitored resource vanished before the source cancel handler was invoked { %p[%s], ident: %d / 0x%x, handler: %p }", v6, v8, v10, v12, v14, v16);
    OUTLINED_FUNCTION_0_6();
    if ((v4 & 1) != 0)
    {
      qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: LIBDISPATCH_STRICT: _dispatch_bug_kevent_vanished";
      __break(1u);
    }
  }
}

void _dispatch_bug_deprecated(const char *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v4;

  v2 = _dispatch_bug_deprecated_last_seen;
  _dispatch_bug_deprecated_last_seen = v1;
  if (v1 == v2
    || (_dispatch_log("DEPRECATED USE in libdispatch client: %s; set a breakpoint on _dispatch_bug_deprecated to debug",
          a1),
        _dispatch_fault((uint64_t)"LIBDISPATCH_STRICT: _dispatch_bug_deprecated", "DEPRECATED USE in libdispatch client: %s; set a breakpoint on _dispatch_bug_deprecated to debug",
          a1),
        OUTLINED_FUNCTION_0_6(),
        (v4 & 1) == 0))
  {
    OUTLINED_FUNCTION_4_3();
  }
  else
  {
    qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: LIBDISPATCH_STRICT: _dispatch_bug_deprecated";
    __break(1u);
  }
}

void dispatch_debug(dispatch_object_t object, const char *message, ...)
{
  va_list va;

  va_start(va, message);
  _dispatch_debugv((unint64_t *)object, message, va);
}

void _dispatch_queue_attr_to_info_cold_1(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: Invalid queue attribute";
  qword_1EDF52D38 = v1;
  __break(1u);
}

uint64_t _dispatch_fault_cold_1(const char *a1)
{
  strlen(a1);
  return os_fault_with_payload();
}

void _dispatch_strdup_if_mutable_cold_1()
{
  _dispatch_bug(1515, 0);
}

void _dispatch_Block_copy_cold_1()
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: NULL was passed where a block should have been";
  __break(1u);
}

uint64_t _dispatch_objc_debug(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t result;
  uint64_t v7;

  v7 = 0;
  v5 = (void *)objc_msgSend(a1, "debugDescription");
  objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", a2, a3 - 1, &v7, 4, 0, 0, objc_msgSend(v5, "length"), 0);
  result = v7;
  if (v7)
    *(_BYTE *)(a2 + v7) = 0;
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C87428](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C87438](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C87440](aBlock);
}

void _Block_use_RR2(const Block_callbacks_RR *callbacks)
{
  MEMORY[0x1E0C87448](callbacks);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C88F60](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C87488](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __bsdthread_ctl()
{
  return MEMORY[0x1E0C87D50]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

uint64_t __libkernel_voucher_init()
{
  return MEMORY[0x1E0C87DF8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C87508]();
}

uint64_t __telemetry()
{
  return MEMORY[0x1E0C87F30]();
}

uint64_t __udivti3()
{
  return MEMORY[0x1E0C86840]();
}

uint64_t __ulock_wait()
{
  return MEMORY[0x1E0C87F48]();
}

uint64_t __ulock_wake()
{
  return MEMORY[0x1E0C87F58]();
}

uint64_t __work_interval_ctl()
{
  return MEMORY[0x1E0C87F78]();
}

uint64_t j___dispatch_block_invoke_direct(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_block_invoke_direct_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_channel_debug(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_channel_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_channel_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_channel_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_channel_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_channel_invoke_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_channel_wakeup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_channel_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_channel_xref_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_channel_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_data_debug(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_data_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_data_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_data_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_data_init_with_bytes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_data_init_with_bytes_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_data_set_target_queue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_data_set_target_queue_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_disk_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_disk_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_event_loop_atfork_child(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_event_loop_atfork_child_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_get_main_queue_handle_4CF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_get_main_queue_handle_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_get_main_queue_port_4CF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_get_main_queue_port_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_group_create_and_enter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_group_create_and_enter_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_group_debug(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_group_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_group_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_group_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_io_debug(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_io_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_io_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_io_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_iocntl_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_iocntl_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_lane_activate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_lane_activate_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_lane_concurrent_push(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_lane_concurrent_push_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_lane_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_lane_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_lane_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_lane_invoke_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_lane_push(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_lane_push_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_lane_wakeup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_lane_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_mach_activate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_activate_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_mach_debug(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_mach_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_mach_hooks_install_default_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_hooks_install_default_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_mach_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_invoke_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_mach_msg_debug(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_msg_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_mach_msg_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_msg_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_mach_msg_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_msg_invoke_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_mach_notify_dead_name(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_notify_dead_name_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_mach_notify_port_deleted(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_notify_port_deleted_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_mach_notify_send_possible(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_notify_send_possible_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_mach_wakeup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_main_queue_callback_4CF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_main_queue_callback_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_main_queue_push(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_main_queue_push_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_main_queue_wakeup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_main_queue_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_mgr_queue_push(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mgr_queue_push_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_mgr_queue_wakeup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mgr_queue_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_operation_debug(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_operation_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_operation_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_operation_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_poll_for_events_4launchd_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_poll_for_events_4launchd_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_prohibit_transition_to_multithreaded_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_prohibit_transition_to_multithreaded_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_pthread_root_queue_create_with_observer_hooks_4IOHID_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_pthread_root_queue_create_with_observer_hooks_4IOHID_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_pthread_root_queue_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_pthread_root_queue_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_queue_atfork_child(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_queue_atfork_child_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_queue_debug(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_queue_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_queue_is_exclusively_owned_by_current_thread_4IOHID_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_queue_is_exclusively_owned_by_current_thread_4IOHID_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_queue_xref_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_queue_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_root_queue_push(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_root_queue_push_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_root_queue_wakeup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_root_queue_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_runloop_queue_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_queue_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_runloop_queue_wakeup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_queue_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_runloop_queue_xref_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_queue_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_runloop_root_queue_create_4CF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_root_queue_create_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_runloop_root_queue_get_port_4CF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_root_queue_get_port_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_runloop_root_queue_perform_4CF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_root_queue_perform_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_runloop_root_queue_wakeup_4CF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_root_queue_wakeup_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_semaphore_debug(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_semaphore_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_semaphore_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_semaphore_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_source_activate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_activate_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_source_debug(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_source_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_source_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_invoke_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_source_set_runloop_timer_4CF(NSObject *a1, dispatch_time_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(NSObject *, dispatch_time_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_set_runloop_timer_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_source_wakeup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_source_will_reenable_kevent_4NW_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_will_reenable_kevent_4NW_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_source_xref_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_workloop_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_workloop_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_workloop_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_workloop_invoke_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_workloop_push(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_workloop_push_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_workloop_set_observer_hooks_4IOHID_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_workloop_set_observer_hooks_4IOHID_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dispatch_workloop_should_yield_4NW_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_workloop_should_yield_4NW_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___dispatch_workloop_wakeup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_workloop_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1E0C87308]();
}

uint64_t _objc_atfork_child()
{
  return MEMORY[0x1E0DE7948]();
}

uint64_t _objc_atfork_parent()
{
  return MEMORY[0x1E0DE7950]();
}

uint64_t _objc_atfork_prepare()
{
  return MEMORY[0x1E0DE7958]();
}

uint64_t _objc_init()
{
  return MEMORY[0x1E0DE79B0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C87528]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1E0C87530]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C87548]();
}

uint64_t j___os_eventlink_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_eventlink_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_object_allows_weak_reference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_allows_weak_reference_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _os_object_release_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_release_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _os_object_release_internal_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_release_internal_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _os_object_release_internal_n_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_release_internal_n_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _os_object_release_without_xref_dispose_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_release_without_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _os_object_retain_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_retain_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_object_retain_count(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_retain_count_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _os_object_retain_internal_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_retain_internal_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _os_object_retain_internal_n_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_retain_internal_n_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_object_retain_weak(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_retain_weak_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _os_object_retain_with_resurrect_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_retain_with_resurrect_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _os_semaphore_create()
{
  return MEMORY[0x1E0C88AA8]();
}

uint64_t _os_semaphore_dispose()
{
  return MEMORY[0x1E0C88AB0]();
}

uint64_t j___os_workgroup_debug(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_workgroup_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_workgroup_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_workgroup_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_workgroup_interval_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_workgroup_interval_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_workgroup_interval_xref_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_workgroup_interval_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_workgroup_xref_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_workgroup_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _pthread_qos_class_encode()
{
  return MEMORY[0x1E0C88C28]();
}

uint64_t _pthread_qos_override_end_direct()
{
  return MEMORY[0x1E0C88C30]();
}

uint64_t _pthread_qos_override_start_direct()
{
  return MEMORY[0x1E0C88C38]();
}

uint64_t _pthread_set_properties_self()
{
  return MEMORY[0x1E0C88C40]();
}

uint64_t _pthread_workloop_create()
{
  return MEMORY[0x1E0C88C48]();
}

uint64_t _pthread_workloop_destroy()
{
  return MEMORY[0x1E0C88C50]();
}

uint64_t _pthread_workqueue_add_cooperativethreads()
{
  return MEMORY[0x1E0C88C58]();
}

uint64_t _pthread_workqueue_addthreads()
{
  return MEMORY[0x1E0C88C60]();
}

uint64_t _pthread_workqueue_allow_send_signals()
{
  return MEMORY[0x1E0C88C68]();
}

uint64_t _pthread_workqueue_override_reset()
{
  return MEMORY[0x1E0C88C70]();
}

uint64_t _pthread_workqueue_override_start_direct()
{
  return MEMORY[0x1E0C88C78]();
}

uint64_t _pthread_workqueue_override_start_direct_check_owner()
{
  return MEMORY[0x1E0C88C80]();
}

uint64_t _pthread_workqueue_set_event_manager_priority()
{
  return MEMORY[0x1E0C88C88]();
}

uint64_t _pthread_workqueue_supported()
{
  return MEMORY[0x1E0C88C90]();
}

uint64_t _pthread_yield_to_enqueuer_4dispatch()
{
  return MEMORY[0x1E0C88C98]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1E0C88B40]();
}

uint64_t j___voucher_atfork_child(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_voucher_atfork_child_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___voucher_atfork_parent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_voucher_atfork_parent_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___voucher_atfork_prepare(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_voucher_atfork_prepare_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___voucher_debug(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_voucher_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___voucher_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_voucher_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___voucher_xref_dispose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_voucher_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87620](a1, a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C87630](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C87668](a1, a2);
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x1E0DE7A90](cls, extraBytes);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C87678](*(_QWORD *)&__clock_id);
}

uint64_t close_NOCANCEL()
{
  return MEMORY[0x1E0C88020]();
}

void dispatch_activate_0(dispatch_object_t object)
{
  ((void (*))dispatch_activate_ptr[0])(object);
}

void dispatch_after_0(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  ((void (*)(dispatch_time_t, NSObject *, void *))dispatch_after_ptr[0])(when, queue, block);
}

void dispatch_after_f_0(dispatch_time_t when, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  ((void (*)(dispatch_time_t, NSObject *, void *, void (__cdecl *)(void *)))dispatch_after_f_ptr[0])(when, queue, context, work);
}

uint64_t dispatch_allow_send_signals_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_allow_send_signals_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_apply_0(size_t iterations, dispatch_queue_t queue, void *block)
{
  ((void (*)(size_t, NSObject *, void *))dispatch_apply_ptr[0])(iterations, queue, block);
}

uint64_t dispatch_apply_attr_destroy_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_apply_attr_destroy_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_apply_attr_init_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_apply_attr_init_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_apply_attr_query_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_apply_attr_query_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_apply_attr_set_parallelism_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_apply_attr_set_parallelism_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_apply_f_0(size_t iterations, dispatch_queue_t queue, void *context, void (__cdecl *work)(void *, size_t))
{
  ((void (*)(size_t, NSObject *, void *, void (__cdecl *)(void *, size_t)))dispatch_apply_f_ptr[0])(iterations, queue, context, work);
}

uint64_t dispatch_apply_with_attr_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_apply_with_attr_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_apply_with_attr_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_apply_with_attr_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_assert_queue(dispatch_queue_t queue)
{
  ((void (*))dispatch_assert_queue_ptr[0])(queue);
}

void dispatch_assert_queue_V2_0(dispatch_queue_t queue)
{
  ((void (*))dispatch_assert_queue_V2_ptr[0])(queue);
}

void dispatch_assert_queue_barrier_0(dispatch_queue_t queue)
{
  ((void (*))dispatch_assert_queue_barrier_ptr[0])(queue);
}

void dispatch_assert_queue_not(dispatch_queue_t queue)
{
  ((void (*))dispatch_assert_queue_not_ptr[0])(queue);
}

void dispatch_assert_queue_not_V2_0(dispatch_queue_t queue)
{
  ((void (*))dispatch_assert_queue_not_V2_ptr[0])(queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  ((void (*)(NSObject *, void *))dispatch_async_ptr[0])(queue, block);
}

void dispatch_async_and_wait_0(dispatch_queue_t queue, dispatch_block_t block)
{
  ((void (*)(NSObject *, void *))dispatch_async_and_wait_ptr[0])(queue, block);
}

void dispatch_async_and_wait_f_0(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  ((void (*)(NSObject *, void *, void (__cdecl *)(void *)))dispatch_async_and_wait_f_ptr[0])(queue, context, work);
}

uint64_t dispatch_async_enforce_qos_class_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_async_enforce_qos_class_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  ((void (*)(NSObject *, void *, void (__cdecl *)(void *)))dispatch_async_f_ptr[0])(queue, context, work);
}

uint64_t dispatch_async_swift_job_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_async_swift_job_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_barrier_async_0(dispatch_queue_t queue, dispatch_block_t block)
{
  ((void (*)(NSObject *, void *))dispatch_barrier_async_ptr[0])(queue, block);
}

void dispatch_barrier_async_and_wait_0(dispatch_queue_t queue, dispatch_block_t block)
{
  ((void (*)(NSObject *, void *))dispatch_barrier_async_and_wait_ptr[0])(queue, block);
}

void dispatch_barrier_async_and_wait_f_0(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  ((void (*)(NSObject *, void *, void (__cdecl *)(void *)))dispatch_barrier_async_and_wait_f_ptr[0])(queue, context, work);
}

void dispatch_barrier_async_f_0(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  ((void (*)(NSObject *, void *, void (__cdecl *)(void *)))dispatch_barrier_async_f_ptr[0])(queue, context, work);
}

void dispatch_barrier_sync_0(dispatch_queue_t queue, dispatch_block_t block)
{
  ((void (*)(NSObject *, void *))dispatch_barrier_sync_ptr[0])(queue, block);
}

void dispatch_barrier_sync_f_0(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  ((void (*)(NSObject *, void *, void (__cdecl *)(void *)))dispatch_barrier_sync_f_ptr[0])(queue, context, work);
}

void dispatch_block_cancel_0(dispatch_block_t block)
{
  ((void (*)(void *))dispatch_block_cancel_ptr[0])(block);
}

dispatch_block_t dispatch_block_create_0(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)((uint64_t (*)(dispatch_block_flags_t, void *))dispatch_block_create_ptr[0])(flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class_0(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)((uint64_t (*)(dispatch_block_flags_t, uint64_t, uint64_t, void *))dispatch_block_create_with_qos_class_ptr[0])(flags, *(uint64_t *)&qos_class, *(uint64_t *)&relative_priority, block);
}

uint64_t dispatch_block_create_with_voucher_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_block_create_with_voucher_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_block_create_with_voucher_and_qos_class_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_block_create_with_voucher_and_qos_class_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_block_notify_0(dispatch_block_t block, dispatch_queue_t queue, dispatch_block_t notification_block)
{
  ((void (*)(void *, NSObject *, void *))dispatch_block_notify_ptr[0])(block, queue, notification_block);
}

void dispatch_block_perform_0(dispatch_block_flags_t flags, dispatch_block_t block)
{
  ((void (*)(dispatch_block_flags_t, void *))dispatch_block_perform_ptr[0])(flags, block);
}

intptr_t dispatch_block_testcancel_0(dispatch_block_t block)
{
  return ((uint64_t (*)(void *))dispatch_block_testcancel_ptr[0])(block);
}

intptr_t dispatch_block_wait_0(dispatch_block_t block, dispatch_time_t timeout)
{
  return ((uint64_t (*)(void *, dispatch_time_t))dispatch_block_wait_ptr[0])(block, timeout);
}

uint64_t dispatch_channel_async_0(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_async_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_channel_async_f_0(NSObject *a1, void *a2, void (__cdecl *a3)(void *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(NSObject *, void *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_async_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_channel_cancel(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_cancel_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_channel_create_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_create_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_channel_drain_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_drain_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_channel_drain_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_drain_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_channel_enqueue_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_enqueue_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_channel_foreach_work_item_peek_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_foreach_work_item_peek_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_channel_foreach_work_item_peek_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_foreach_work_item_peek_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_channel_testcancel(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_testcancel_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_channel_wakeup_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

BOOL dispatch_data_apply_0(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return ((uint64_t (*)(NSObject *, void *))dispatch_data_apply_ptr[0])(data, applier);
}

uint64_t dispatch_data_apply_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_apply_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

dispatch_data_t dispatch_data_copy_region_0(dispatch_data_t data, size_t location, size_t *offset_ptr)
{
  return (dispatch_data_t)((uint64_t (*)(NSObject *, size_t, size_t *))dispatch_data_copy_region_ptr[0])(data, location, offset_ptr);
}

dispatch_data_t dispatch_data_create_0(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)((uint64_t (*)(const void *, size_t, NSObject *, void *))dispatch_data_create_ptr[0])(buffer, size, queue, destructor);
}

uint64_t dispatch_data_create_alloc_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_create_alloc_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

dispatch_data_t dispatch_data_create_concat_0(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)((uint64_t (*)(NSObject *, NSObject *))dispatch_data_create_concat_ptr[0])(data1, data2);
}

uint64_t dispatch_data_create_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_create_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

dispatch_data_t dispatch_data_create_map_0(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)((uint64_t (*)(NSObject *, const void **, size_t *))dispatch_data_create_map_ptr[0])(data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange_0(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)((uint64_t (*)(NSObject *, size_t, size_t))dispatch_data_create_subrange_ptr[0])(data, offset, length);
}

uint64_t dispatch_data_get_flattened_bytes_4libxpc_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_get_flattened_bytes_4libxpc_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

size_t dispatch_data_get_size_0(dispatch_data_t data)
{
  return ((uint64_t (*))dispatch_data_get_size_ptr[0])(data);
}

uint64_t dispatch_data_make_memory_entry_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_make_memory_entry_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

void *__cdecl dispatch_get_context_0(dispatch_object_t object)
{
  return (void *)((uint64_t (*))dispatch_get_context_ptr[0])(object);
}

dispatch_queue_global_t dispatch_get_global_queue_0(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)((uint64_t (*)(intptr_t, uintptr_t))dispatch_get_global_queue_ptr[0])(identifier, flags);
}

void *__cdecl dispatch_get_specific_0(const void *key)
{
  return (void *)((uint64_t (*)(const void *))dispatch_get_specific_ptr[0])(key);
}

void dispatch_group_async_0(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  ((void (*)(NSObject *, NSObject *, void *))dispatch_group_async_ptr[0])(group, queue, block);
}

void dispatch_group_async_f_0(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  ((void (*)(NSObject *, NSObject *, void *, void (__cdecl *)(void *)))dispatch_group_async_f_ptr[0])(group, queue, context, work);
}

dispatch_group_t dispatch_group_create_0(void)
{
  return (dispatch_group_t)dispatch_group_create_ptr[0]();
}

void dispatch_group_enter_0(dispatch_group_t group)
{
  ((void (*))dispatch_group_enter_ptr[0])(group);
}

void dispatch_group_leave_0(dispatch_group_t group)
{
  ((void (*))dispatch_group_leave_ptr[0])(group);
}

void dispatch_group_notify_0(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  ((void (*)(NSObject *, NSObject *, void *))dispatch_group_notify_ptr[0])(group, queue, block);
}

void dispatch_group_notify_f_0(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  ((void (*)(NSObject *, NSObject *, void *, void (__cdecl *)(void *)))dispatch_group_notify_f_ptr[0])(group, queue, context, work);
}

intptr_t dispatch_group_wait_0(dispatch_group_t group, dispatch_time_t timeout)
{
  return ((uint64_t (*)(NSObject *, dispatch_time_t))dispatch_group_wait_ptr[0])(group, timeout);
}

void dispatch_io_barrier_0(dispatch_io_t channel, dispatch_block_t barrier)
{
  ((void (*)(NSObject *, void *))dispatch_io_barrier_ptr[0])(channel, barrier);
}

uint64_t dispatch_io_barrier_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_barrier_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_io_close_0(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
  ((void (*)(NSObject *, dispatch_io_close_flags_t))dispatch_io_close_ptr[0])(channel, flags);
}

dispatch_io_t dispatch_io_create_0(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)((uint64_t (*)(dispatch_io_type_t, uint64_t, NSObject *, void *))dispatch_io_create_ptr[0])(type, *(uint64_t *)&fd, queue, cleanup_handler);
}

uint64_t dispatch_io_create_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_create_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

dispatch_io_t dispatch_io_create_with_io_0(dispatch_io_type_t type, dispatch_io_t io, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)((uint64_t (*)(dispatch_io_type_t, NSObject *, NSObject *, void *))dispatch_io_create_with_io_ptr[0])(type, io, queue, cleanup_handler);
}

uint64_t dispatch_io_create_with_io_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_create_with_io_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

dispatch_io_t dispatch_io_create_with_path_0(dispatch_io_type_t type, const char *path, int oflag, mode_t mode, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)((uint64_t (*)(dispatch_io_type_t, const char *, uint64_t, uint64_t, NSObject *, void *))dispatch_io_create_with_path_ptr[0])(type, path, *(uint64_t *)&oflag, mode, queue, cleanup_handler);
}

uint64_t dispatch_io_create_with_path_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_create_with_path_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

dispatch_fd_t dispatch_io_get_descriptor_0(dispatch_io_t channel)
{
  return ((uint64_t (*))dispatch_io_get_descriptor_ptr[0])(channel);
}

void dispatch_io_read_0(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  ((void (*)(NSObject *, off_t, size_t, NSObject *, void *))dispatch_io_read_ptr[0])(channel, offset, length, queue, io_handler);
}

uint64_t dispatch_io_read_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_read_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_io_set_high_water_0(dispatch_io_t channel, size_t high_water)
{
  ((void (*)(NSObject *, size_t))dispatch_io_set_high_water_ptr[0])(channel, high_water);
}

void dispatch_io_set_interval_0(dispatch_io_t channel, uint64_t interval, dispatch_io_interval_flags_t flags)
{
  ((void (*)(NSObject *, uint64_t, dispatch_io_interval_flags_t))dispatch_io_set_interval_ptr[0])(channel, interval, flags);
}

void dispatch_io_set_low_water_0(dispatch_io_t channel, size_t low_water)
{
  ((void (*)(NSObject *, size_t))dispatch_io_set_low_water_ptr[0])(channel, low_water);
}

void dispatch_io_write_0(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  ((void (*)(NSObject *, off_t, NSObject *, NSObject *, void *))dispatch_io_write_ptr[0])(channel, offset, data, queue, io_handler);
}

uint64_t dispatch_io_write_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_write_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_lock_override_end_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_lock_override_end_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_lock_override_start_with_debounce_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_lock_override_start_with_debounce_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_can_handoff_4libxpc_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_can_handoff_4libxpc_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_cancel_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_cancel_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_connect_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_connect_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_create_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_create_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_create_4libxpc_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_create_4libxpc_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_create_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_create_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_get_checkin_port_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_get_checkin_port_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_handoff_reply_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_handoff_reply_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_handoff_reply_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_handoff_reply_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_hooks_install_4libxpc_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_hooks_install_4libxpc_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_mig_demux_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_mig_demux_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_mig_demux_get_context_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_mig_demux_get_context_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_msg_create_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_msg_create_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_msg_get_filter_policy_id_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_msg_get_filter_policy_id_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_msg_get_msg_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_msg_get_msg_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_notify_no_senders_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_notify_no_senders_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_receive_barrier_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_receive_barrier_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_receive_barrier_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_receive_barrier_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_reconnect_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_reconnect_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_request_no_senders_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_request_no_senders_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_send_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_send_and_wait_for_reply_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_and_wait_for_reply_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_send_barrier_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_barrier_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_send_barrier_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_barrier_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_send_with_result_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_with_result_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_send_with_result_and_async_reply_4libxpc_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_with_result_and_async_reply_4libxpc_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_send_with_result_and_wait_for_reply_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_with_result_and_wait_for_reply_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_mach_set_flags_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_mach_set_flags_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_main_0(void)
{
  dispatch_main_ptr();
}

uint64_t dispatch_mig_server_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_mig_server_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_once_0(dispatch_once_t *predicate, dispatch_block_t block)
{
  ((void (*)(dispatch_once_t *, void *))dispatch_once_ptr)(predicate, block);
}

void dispatch_once_f_0(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  ((void (*)(dispatch_once_t *, void *, void (__cdecl *)(void *)))dispatch_once_f_ptr)(predicate, context, function);
}

uint64_t dispatch_pthread_root_queue_copy_current_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_pthread_root_queue_copy_current_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_pthread_root_queue_create_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_pthread_root_queue_create_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

dispatch_queue_t dispatch_queue_create_0(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)((uint64_t (*)(const char *, NSObject *))dispatch_queue_create_ptr)(label, attr);
}

uint64_t dispatch_queue_create_with_accounting_override_voucher_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_queue_create_with_accounting_override_voucher_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

dispatch_queue_t dispatch_queue_create_with_target(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)((uint64_t (*)(const char *, NSObject *, NSObject *))dispatch_queue_create_with_target_ptr)(label, attr, target);
}

dispatch_queue_t dispatch_queue_create_with_target_V2_0(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)((uint64_t (*)(const char *, NSObject *, NSObject *))dispatch_queue_create_with_target_V2_ptr)(label, attr, target);
}

const char *__cdecl dispatch_queue_get_label_0(dispatch_queue_t queue)
{
  return (const char *)((uint64_t (*))dispatch_queue_get_label_ptr)(queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class_0(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return ((uint64_t (*)(NSObject *, int *))dispatch_queue_get_qos_class_ptr)(queue, relative_priority_ptr);
}

void *__cdecl dispatch_queue_get_specific_0(dispatch_queue_t queue, const void *key)
{
  return (void *)((uint64_t (*)(NSObject *, const void *))dispatch_queue_get_specific_ptr)(queue, key);
}

uint64_t dispatch_queue_set_label_nocopy_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_queue_set_label_nocopy_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_queue_set_specific_0(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  ((void (*)(NSObject *, const void *, void *, void (__cdecl *)(void *)))dispatch_queue_set_specific_ptr)(queue, key, context, destructor);
}

uint64_t dispatch_queue_set_width_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_queue_set_width_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_read_0(dispatch_fd_t fd, size_t length, dispatch_queue_t queue, void *handler)
{
  ((void (*)(uint64_t, size_t, NSObject *, void *))dispatch_read_ptr)(*(uint64_t *)&fd, length, queue, handler);
}

uint64_t dispatch_read_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_read_f_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_release_0(dispatch_object_t object)
{
  ((void (*))dispatch_release_ptr)(object);
}

void dispatch_resume_0(dispatch_object_t object)
{
  ((void (*))dispatch_resume_ptr)(object);
}

void dispatch_retain_0(dispatch_object_t object)
{
  ((void (*))dispatch_retain_ptr)(object);
}

dispatch_semaphore_t dispatch_semaphore_create_0(intptr_t value)
{
  return (dispatch_semaphore_t)((uint64_t (*)(intptr_t))dispatch_semaphore_create_ptr)(value);
}

intptr_t dispatch_semaphore_signal_0(dispatch_semaphore_t dsema)
{
  return ((uint64_t (*))dispatch_semaphore_signal_ptr)(dsema);
}

intptr_t dispatch_semaphore_wait_0(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return ((uint64_t (*)(NSObject *, dispatch_time_t))dispatch_semaphore_wait_ptr)(dsema, timeout);
}

void dispatch_set_context_0(dispatch_object_t object, void *context)
{
  ((void (*)(NSObject *, void *))dispatch_set_context_ptr)(object, context);
}

void dispatch_set_finalizer_f_0(dispatch_object_t object, dispatch_function_t finalizer)
{
  ((void (*)(NSObject *, void (__cdecl *)(void *)))dispatch_set_finalizer_f_ptr)(object, finalizer);
}

uint64_t dispatch_set_qos_class_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_set_qos_class_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_set_qos_class_fallback_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_set_qos_class_fallback_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_set_qos_class_floor_0(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
  ((void (*)(NSObject *, uint64_t, uint64_t))dispatch_set_qos_class_floor_ptr)(object, *(uint64_t *)&qos_class, *(uint64_t *)&relative_priority);
}

void dispatch_set_target_queue_0(dispatch_object_t object, dispatch_queue_t queue)
{
  ((void (*)(NSObject *, NSObject *))dispatch_set_target_queue_ptr)(object, queue);
}

void dispatch_source_cancel_0(dispatch_source_t source)
{
  ((void (*))dispatch_source_cancel_ptr)(source);
}

uint64_t dispatch_source_cancel_and_wait_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_source_cancel_and_wait_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

dispatch_source_t dispatch_source_create_0(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)((uint64_t (*)(const dispatch_source_type_s *, uintptr_t, uintptr_t, NSObject *))dispatch_source_create_ptr)(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data_0(dispatch_source_t source)
{
  return ((uint64_t (*))dispatch_source_get_data_ptr)(source);
}

uint64_t dispatch_source_get_extended_data_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_source_get_extended_data_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uintptr_t dispatch_source_get_handle_0(dispatch_source_t source)
{
  return ((uint64_t (*))dispatch_source_get_handle_ptr)(source);
}

uintptr_t dispatch_source_get_mask_0(dispatch_source_t source)
{
  return ((uint64_t (*))dispatch_source_get_mask_ptr)(source);
}

void dispatch_source_merge_data_0(dispatch_source_t source, uintptr_t value)
{
  ((void (*)(NSObject *, uintptr_t))dispatch_source_merge_data_ptr)(source, value);
}

void dispatch_source_set_cancel_handler_0(dispatch_source_t source, dispatch_block_t handler)
{
  ((void (*)(NSObject *, void *))dispatch_source_set_cancel_handler_ptr)(source, handler);
}

void dispatch_source_set_cancel_handler_f_0(dispatch_source_t source, dispatch_function_t handler)
{
  ((void (*)(NSObject *, void (__cdecl *)(void *)))dispatch_source_set_cancel_handler_f_ptr)(source, handler);
}

void dispatch_source_set_event_handler_0(dispatch_source_t source, dispatch_block_t handler)
{
  ((void (*)(NSObject *, void *))dispatch_source_set_event_handler_ptr)(source, handler);
}

void dispatch_source_set_event_handler_f_0(dispatch_source_t source, dispatch_function_t handler)
{
  ((void (*)(NSObject *, void (__cdecl *)(void *)))dispatch_source_set_event_handler_f_ptr)(source, handler);
}

uint64_t dispatch_source_set_mandatory_cancel_handler_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_source_set_mandatory_cancel_handler_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_source_set_mandatory_cancel_handler_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_source_set_mandatory_cancel_handler_f_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_source_set_registration_handler_0(dispatch_source_t source, dispatch_block_t handler)
{
  ((void (*)(NSObject *, void *))dispatch_source_set_registration_handler_ptr)(source, handler);
}

void dispatch_source_set_registration_handler_f_0(dispatch_source_t source, dispatch_function_t handler)
{
  ((void (*)(NSObject *, void (__cdecl *)(void *)))dispatch_source_set_registration_handler_f_ptr)(source, handler);
}

void dispatch_source_set_timer_0(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  ((void (*)(NSObject *, dispatch_time_t, uint64_t, uint64_t))dispatch_source_set_timer_ptr)(source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel_0(dispatch_source_t source)
{
  return ((uint64_t (*))dispatch_source_testcancel_ptr)(source);
}

void dispatch_suspend_0(dispatch_object_t object)
{
  ((void (*))dispatch_suspend_ptr)(object);
}

uint64_t dispatch_swift_job_should_yield_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_swift_job_should_yield_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_sync_0(dispatch_queue_t queue, dispatch_block_t block)
{
  ((void (*)(NSObject *, void *))dispatch_sync_ptr)(queue, block);
}

void dispatch_sync_f_0(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  ((void (*)(NSObject *, void *, void (__cdecl *)(void *)))dispatch_sync_f_ptr)(queue, context, work);
}

uint64_t dispatch_thread_get_current_override_qos_floor_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_thread_get_current_override_qos_floor_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_thread_override_self_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_thread_override_self_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_workloop_copy_current_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_workloop_copy_current_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

dispatch_workloop_t dispatch_workloop_create_0(const char *label)
{
  return (dispatch_workloop_t)((uint64_t (*)(const char *))dispatch_workloop_create_ptr)(label);
}

dispatch_workloop_t dispatch_workloop_create_inactive_0(const char *label)
{
  return (dispatch_workloop_t)((uint64_t (*)(const char *))dispatch_workloop_create_inactive_ptr)(label);
}

uint64_t dispatch_workloop_is_current_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_workloop_is_current_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_workloop_set_autorelease_frequency_0(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
  ((void (*)(NSObject *, dispatch_autorelease_frequency_t))dispatch_workloop_set_autorelease_frequency_ptr)(workloop, frequency);
}

uint64_t dispatch_workloop_set_cpupercent_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_workloop_set_cpupercent_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_workloop_set_os_workgroup_0(dispatch_workloop_t workloop, os_workgroup_t workgroup)
{
  ((void (*)(NSObject *, OS_os_workgroup *))dispatch_workloop_set_os_workgroup_ptr)(workloop, workgroup);
}

uint64_t dispatch_workloop_set_qos_class_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_workloop_set_qos_class_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_workloop_set_qos_class_floor_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_workloop_set_qos_class_floor_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_workloop_set_scheduler_priority_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_workloop_set_scheduler_priority_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch_workloop_set_uses_bound_thread_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_workloop_set_uses_bound_thread_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_write_0(dispatch_fd_t fd, dispatch_data_t data, dispatch_queue_t queue, void *handler)
{
  ((void (*)(uint64_t, NSObject *, NSObject *, void *))dispatch_write_ptr)(*(uint64_t *)&fd, data, queue, handler);
}

uint64_t dispatch_write_f_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return dispatch_write_f_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x1E0C876A8](*(_QWORD *)&a1, a2);
}

uint64_t fcntl_NOCANCEL()
{
  return MEMORY[0x1E0C88098]();
}

uint64_t j__firehose_client_push_notify_async(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return firehose_client_push_notify_async_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j__firehose_client_push_reply(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return firehose_client_push_reply_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C88108](*(_QWORD *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C877A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C88190]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C877C0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C877C8](a1, a2);
}

uint64_t guarded_close_np()
{
  return MEMORY[0x1E0C881D0]();
}

uint64_t guarded_open_np()
{
  return MEMORY[0x1E0C881D8]();
}

kern_return_t host_create_mach_voucher(host_t host, mach_voucher_attr_raw_recipe_array_t recipes, mach_msg_type_number_t recipesCnt, ipc_voucher_t *voucher)
{
  return MEMORY[0x1E0C881E0](*(_QWORD *)&host, recipes, *(_QWORD *)&recipesCnt, voucher);
}

kern_return_t host_get_special_port(host_priv_t host_priv, int node, int which, mach_port_t *port)
{
  return MEMORY[0x1E0C88200](*(_QWORD *)&host_priv, *(_QWORD *)&node, *(_QWORD *)&which, port);
}

kern_return_t host_request_notification(host_t host, host_flavor_t notify_type, mach_port_t notify_port)
{
  return MEMORY[0x1E0C88210](*(_QWORD *)&host, *(_QWORD *)&notify_type, *(_QWORD *)&notify_port);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C88238]();
}

uint64_t kevent_id()
{
  return MEMORY[0x1E0C88248]();
}

uint64_t kevent_qos()
{
  return MEMORY[0x1E0C88250]();
}

uint64_t kpersona_get()
{
  return MEMORY[0x1E0C88270]();
}

uint64_t libdispatch_init_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return libdispatch_init_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C882A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C882A8](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C882B0]();
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x1E0C882C8]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C882D0]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C882D8](*(_QWORD *)&error_value);
}

uint64_t mach_eventlink_associate()
{
  return MEMORY[0x1E0C882E0]();
}

uint64_t mach_eventlink_create()
{
  return MEMORY[0x1E0C882E8]();
}

uint64_t mach_eventlink_destroy()
{
  return MEMORY[0x1E0C882F0]();
}

uint64_t mach_eventlink_disassociate()
{
  return MEMORY[0x1E0C882F8]();
}

uint64_t mach_eventlink_signal()
{
  return MEMORY[0x1E0C88300]();
}

uint64_t mach_eventlink_signal_wait_until()
{
  return MEMORY[0x1E0C88308]();
}

uint64_t mach_eventlink_wait_until()
{
  return MEMORY[0x1E0C88310]();
}

kern_return_t mach_generate_activity_id(mach_port_name_t target, int count, uint64_t *activity_id)
{
  return MEMORY[0x1E0C88318](*(_QWORD *)&target, *(_QWORD *)&count, activity_id);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C88320]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C88328]();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1E0C88330](*(_QWORD *)&target_task, size, offset, *(_QWORD *)&permission, object_handle, *(_QWORD *)&parent_entry);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C88338](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

uint64_t mach_msg2_internal()
{
  return MEMORY[0x1E0C88340]();
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C88348](a1);
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1E0C88360](*(_QWORD *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C88368](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x1E0C88370](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&srdelta, guard);
}

kern_return_t mach_port_kernel_object(ipc_space_read_t task, mach_port_name_t name, unsigned int *object_type, unsigned int *object_addr)
{
  return MEMORY[0x1E0C883B0](*(_QWORD *)&task, *(_QWORD *)&name, object_type, object_addr);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C883B8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1E0C883C0](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C88400](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1E0C88408](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C88410](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1E0C88418](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

kern_return_t mach_voucher_attr_command(ipc_voucher_t voucher, mach_voucher_attr_key_t key, mach_voucher_attr_command_t command, mach_voucher_attr_content_t in_content, mach_msg_type_number_t in_contentCnt, mach_voucher_attr_content_t out_content, mach_msg_type_number_t *out_contentCnt)
{
  return MEMORY[0x1E0C88490](*(_QWORD *)&voucher, *(_QWORD *)&key, *(_QWORD *)&command, in_content, *(_QWORD *)&in_contentCnt, out_content, out_contentCnt);
}

kern_return_t mach_voucher_deallocate(mach_port_name_t voucher)
{
  return MEMORY[0x1E0C88498](*(_QWORD *)&voucher);
}

kern_return_t mach_voucher_debug_info(ipc_space_read_t task, mach_port_name_t voucher_name, mach_voucher_attr_raw_recipe_array_t recipes, mach_msg_type_number_t *recipesCnt)
{
  return MEMORY[0x1E0C884A0](*(_QWORD *)&task, *(_QWORD *)&voucher_name, recipes, recipesCnt);
}

uint64_t mach_voucher_persona_for_originator_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return mach_voucher_persona_for_originator_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t mach_voucher_persona_self_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return mach_voucher_persona_self_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C884A8](a1, a2, *(_QWORD *)&a3);
}

uint64_t malloc_engaged_nano()
{
  return MEMORY[0x1E0C88930]();
}

uint64_t malloc_memory_event_handler()
{
  return MEMORY[0x1E0C88948]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88970](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C88980](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88988](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C87830](__dst, __src, __n);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1E0C884B8]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1E0C884D0]();
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C88518](a1, a2);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

void *__cdecl objc_destructInstance(id obj)
{
  return (void *)MEMORY[0x1E0DE7C68](obj);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
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

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

uint64_t open_NOCANCEL()
{
  return MEMORY[0x1E0C88530]();
}

uint64_t os_eventlink_activate_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_eventlink_activate_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_eventlink_associate_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_eventlink_associate_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_eventlink_cancel_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_eventlink_cancel_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_eventlink_create_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_eventlink_create_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_eventlink_create_remote_with_eventlink_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_eventlink_create_remote_with_eventlink_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_eventlink_create_with_port_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_eventlink_create_with_port_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_eventlink_disassociate_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_eventlink_disassociate_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_eventlink_extract_remote_port_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_eventlink_extract_remote_port_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_eventlink_signal_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_eventlink_signal_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_eventlink_signal_and_wait_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_eventlink_signal_and_wait_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_eventlink_signal_and_wait_until_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_eventlink_signal_and_wait_until_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_eventlink_wait_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_eventlink_wait_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_eventlink_wait_until_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_eventlink_wait_until_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_fault_with_payload()
{
  return MEMORY[0x1E0C88558]();
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C88BE8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BF0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C87C60]();
}

uint64_t os_workgroup_attr_set_flags_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_attr_set_flags_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_workgroup_attr_set_interval_type_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_attr_set_interval_type_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_workgroup_attr_set_telemetry_flavor_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_attr_set_telemetry_flavor_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void os_workgroup_cancel_0(os_workgroup_t wg)
{
  ((void (*)(OS_os_workgroup *))os_workgroup_cancel_ptr)(wg);
}

int os_workgroup_copy_port_0(os_workgroup_t wg, mach_port_t *mach_port_out)
{
  return ((uint64_t (*)(OS_os_workgroup *, mach_port_t *))os_workgroup_copy_port_ptr)(wg, mach_port_out);
}

uint64_t os_workgroup_create_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_create_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

os_workgroup_t os_workgroup_create_with_port_0(const char *name, mach_port_t mach_port)
{
  return (os_workgroup_t)((uint64_t (*)(const char *, uint64_t))os_workgroup_create_with_port_ptr)(name, *(uint64_t *)&mach_port);
}

os_workgroup_t os_workgroup_create_with_workgroup_0(const char *name, os_workgroup_t wg)
{
  return (os_workgroup_t)((uint64_t (*)(const char *, OS_os_workgroup *))os_workgroup_create_with_workgroup_ptr)(name, wg);
}

uint64_t os_workgroup_create_with_workload_id_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_create_with_workload_id_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_workgroup_create_with_workload_id_and_port_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_create_with_workload_id_and_port_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_workgroup_create_with_workload_id_and_workgroup_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_create_with_workload_id_and_workgroup_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void *__cdecl os_workgroup_get_working_arena_0(os_workgroup_t wg, os_workgroup_index *index_out)
{
  return (void *)((uint64_t (*)(OS_os_workgroup *, os_workgroup_index *))os_workgroup_get_working_arena_ptr)(wg, index_out);
}

uint64_t os_workgroup_interval_copy_current_4AudioToolbox_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_interval_copy_current_4AudioToolbox_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_workgroup_interval_create_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_interval_create_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_workgroup_interval_create_with_workload_id_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_interval_create_with_workload_id_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_workgroup_interval_data_set_flags_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_interval_data_set_flags_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_workgroup_interval_data_set_telemetry_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_interval_data_set_telemetry_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

int os_workgroup_interval_finish_0(os_workgroup_interval_t wg, os_workgroup_interval_data_t data)
{
  return ((uint64_t (*)(OS_os_workgroup *, os_workgroup_interval_data_opaque_s *))os_workgroup_interval_finish_ptr)(wg, data);
}

int os_workgroup_interval_start_0(os_workgroup_interval_t wg, uint64_t start, uint64_t deadline, os_workgroup_interval_data_t data)
{
  return ((uint64_t (*)(OS_os_workgroup *, uint64_t, uint64_t, os_workgroup_interval_data_opaque_s *))os_workgroup_interval_start_ptr)(wg, start, deadline, data);
}

int os_workgroup_interval_update_0(os_workgroup_interval_t wg, uint64_t deadline, os_workgroup_interval_data_t data)
{
  return ((uint64_t (*)(OS_os_workgroup *, uint64_t, os_workgroup_interval_data_opaque_s *))os_workgroup_interval_update_ptr)(wg, deadline, data);
}

int os_workgroup_join_0(os_workgroup_t wg, os_workgroup_join_token_t token_out)
{
  return ((uint64_t (*)(OS_os_workgroup *, os_workgroup_join_token_opaque_s *))os_workgroup_join_ptr)(wg, token_out);
}

uint64_t os_workgroup_join_self_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_join_self_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void os_workgroup_leave_0(os_workgroup_t wg, os_workgroup_join_token_t token)
{
  ((void (*)(OS_os_workgroup *, os_workgroup_join_token_opaque_s *))os_workgroup_leave_ptr)(wg, token);
}

uint64_t os_workgroup_leave_self_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_workgroup_leave_self_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

int os_workgroup_max_parallel_threads_0(os_workgroup_t wg, os_workgroup_mpt_attr_t attr)
{
  return ((uint64_t (*)(OS_os_workgroup *, os_workgroup_max_parallel_threads_attr_s *))os_workgroup_max_parallel_threads_ptr)(wg, attr);
}

os_workgroup_parallel_t os_workgroup_parallel_create_0(const char *name, os_workgroup_attr_t attr)
{
  return (os_workgroup_parallel_t)((uint64_t (*)(const char *, os_workgroup_attr_opaque_s *))os_workgroup_parallel_create_ptr)(name, attr);
}

int os_workgroup_set_working_arena_0(os_workgroup_t wg, void *arena, uint32_t max_workers, os_workgroup_working_arena_destructor_t destructor)
{
  return ((uint64_t (*)(OS_os_workgroup *, void *, uint64_t, void (__cdecl *)(void *)))os_workgroup_set_working_arena_ptr)(wg, arena, *(uint64_t *)&max_workers, destructor);
}

BOOL os_workgroup_testcancel_0(os_workgroup_t wg)
{
  return ((uint64_t (*)(OS_os_workgroup *))os_workgroup_testcancel_ptr)(wg);
}

uint64_t pread_NOCANCEL()
{
  return MEMORY[0x1E0C885F8]();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C88608](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C88CA8](a1);
}

int pthread_attr_get_qos_class_np(pthread_attr_t *__attr, qos_class_t *__qos_class, int *__relative_priority)
{
  return MEMORY[0x1E0C88CB0](__attr, __qos_class, __relative_priority);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1E0C88CB8](a1, a2);
}

int pthread_attr_getschedpolicy(const pthread_attr_t *a1, int *a2)
{
  return MEMORY[0x1E0C88CC0](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C88CC8](a1);
}

uint64_t pthread_attr_setcpupercent_np()
{
  return MEMORY[0x1E0C88CD0]();
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C88CD8](a1, *(_QWORD *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1E0C88CE0](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C88CE8](a1, *(_QWORD *)&a2);
}

uint64_t pthread_attr_setworkinterval_np()
{
  return MEMORY[0x1E0C88CF0]();
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C88CF8](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
  MEMORY[0x1E0C88D08](a1);
}

void *__cdecl pthread_get_stackaddr_np(pthread_t a1)
{
  return (void *)MEMORY[0x1E0C88D18](a1);
}

uint64_t pthread_install_workgroup_functions_np()
{
  return MEMORY[0x1E0C88D30]();
}

uint64_t pthread_key_init_np()
{
  return MEMORY[0x1E0C88D48]();
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C88D58]();
}

uint64_t pthread_qos_max_parallelism()
{
  return MEMORY[0x1E0C88D90]();
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C88DB8]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1E0C88DC0](a1);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1E0C88DD0](*(_QWORD *)&a1, a2, a3);
}

uint64_t pthread_time_constraint_max_parallelism()
{
  return MEMORY[0x1E0C88DE8]();
}

uint64_t pthread_workqueue_setup()
{
  return MEMORY[0x1E0C88DF0]();
}

uint64_t pwrite_NOCANCEL()
{
  return MEMORY[0x1E0C88638]();
}

qos_class_t qos_class_main(void)
{
  return MEMORY[0x1E0C88DF8]();
}

uint64_t read_NOCANCEL()
{
  return MEMORY[0x1E0C88648]();
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x1E0C88678](*(_QWORD *)&task, semaphore, *(_QWORD *)&policy, *(_QWORD *)&value);
}

kern_return_t semaphore_destroy(task_t task, semaphore_t semaphore)
{
  return MEMORY[0x1E0C88680](*(_QWORD *)&task, *(_QWORD *)&semaphore);
}

kern_return_t semaphore_signal(semaphore_t semaphore)
{
  return MEMORY[0x1E0C88688](*(_QWORD *)&semaphore);
}

kern_return_t semaphore_timedwait(semaphore_t semaphore, mach_timespec_t wait_time)
{
  return ((uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0C88690])(*(_QWORD *)&semaphore, wait_time);
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return MEMORY[0x1E0C88698](*(_QWORD *)&semaphore);
}

uint64_t sigsuspend_NOCANCEL()
{
  return MEMORY[0x1E0C88720]();
}

uint64_t sleep_NOCANCEL()
{
  return MEMORY[0x1E0C87948]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C87950](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C88738](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C87970](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C87990](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C879B0](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C879D0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C87A90](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C87A98](a1, a2, a3, a4, a5);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1E0C88770](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

uint64_t thread_destruct_special_reply_port()
{
  return MEMORY[0x1E0C887A0]();
}

uint64_t thread_get_special_reply_port()
{
  return MEMORY[0x1E0C887A8]();
}

kern_return_t thread_switch(mach_port_name_t thread_name, int option, mach_msg_timeout_t option_time)
{
  return MEMORY[0x1E0C887C0](*(_QWORD *)&thread_name, *(_QWORD *)&option, *(_QWORD *)&option_time);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C87B20](a1, a2, a3);
}

uint64_t voucher_activity_create_with_data_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_activity_create_with_data_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_activity_create_with_data_2_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_activity_create_with_data_2_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_activity_create_with_location_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_activity_create_with_location_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_activity_flush_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_activity_flush_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_activity_get_logging_preferences_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_activity_get_logging_preferences_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_activity_get_metadata_buffer_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_activity_get_metadata_buffer_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_activity_id_allocate_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_activity_id_allocate_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_activity_initialize_4libtrace_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_activity_initialize_4libtrace_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_activity_should_send_strings_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_activity_should_send_strings_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_activity_trace_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_activity_trace_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_activity_trace_v_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_activity_trace_v_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_activity_trace_v_2_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_activity_trace_v_2_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_adopt_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_adopt_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_copy_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_copy_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_copy_with_persona_mach_voucher_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_copy_with_persona_mach_voucher_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_copy_without_importance_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_copy_without_importance_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_create_with_mach_msg_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_create_with_mach_msg_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_decrement_importance_count4CF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_decrement_importance_count4CF_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_get_activity_id_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_get_activity_id_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_get_activity_id_and_creator_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_get_activity_id_and_creator_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_get_current_persona_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_get_current_persona_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_get_current_persona_originator_info_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_get_current_persona_originator_info_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_get_current_persona_proximate_info_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_get_current_persona_proximate_info_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_kvoucher_debug_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_kvoucher_debug_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_process_can_use_arbitrary_personas_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_process_can_use_arbitrary_personas_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_release_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_release_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_replace_default_voucher_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_replace_default_voucher_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t voucher_retain_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return voucher_retain_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C87B30](__str, __size, __format, a4);
}

uint64_t work_interval_copy_port()
{
  return MEMORY[0x1E0C88850]();
}

uint64_t work_interval_create()
{
  return MEMORY[0x1E0C88858]();
}

uint64_t work_interval_destroy()
{
  return MEMORY[0x1E0C88860]();
}

uint64_t work_interval_get_flags_from_port()
{
  return MEMORY[0x1E0C88868]();
}

uint64_t work_interval_instance_alloc()
{
  return MEMORY[0x1E0C88870]();
}

uint64_t work_interval_instance_clear()
{
  return MEMORY[0x1E0C88878]();
}

uint64_t work_interval_instance_finish()
{
  return MEMORY[0x1E0C88880]();
}

uint64_t work_interval_instance_free()
{
  return MEMORY[0x1E0C88888]();
}

uint64_t work_interval_instance_get_telemetry_data()
{
  return MEMORY[0x1E0C88890]();
}

uint64_t work_interval_instance_set_complexity()
{
  return MEMORY[0x1E0C88898]();
}

uint64_t work_interval_instance_set_deadline()
{
  return MEMORY[0x1E0C888A0]();
}

uint64_t work_interval_instance_set_finish()
{
  return MEMORY[0x1E0C888A8]();
}

uint64_t work_interval_instance_set_start()
{
  return MEMORY[0x1E0C888B0]();
}

uint64_t work_interval_instance_start()
{
  return MEMORY[0x1E0C888B8]();
}

uint64_t work_interval_instance_update()
{
  return MEMORY[0x1E0C888C0]();
}

uint64_t work_interval_join()
{
  return MEMORY[0x1E0C888C8]();
}

uint64_t work_interval_join_port()
{
  return MEMORY[0x1E0C888D0]();
}

uint64_t work_interval_leave()
{
  return MEMORY[0x1E0C888D8]();
}

uint64_t write_NOCANCEL()
{
  return MEMORY[0x1E0C888E8]();
}

uint64_t sub_18A05F098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_block_invoke_direct_ptr[0] = (uint64_t (*)())_dispatch_block_invoke_direct();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_block_invoke_direct_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F0FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_channel_debug_ptr[0] = (uint64_t (*)())_dispatch_channel_debug();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_channel_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_channel_dispose_ptr[0] = (uint64_t (*)())_dispatch_channel_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_channel_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F1C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_channel_invoke_ptr[0] = (uint64_t (*)())_dispatch_channel_invoke();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_channel_invoke_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_channel_wakeup_ptr[0] = (uint64_t (*)())_dispatch_channel_wakeup();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_channel_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_channel_xref_dispose_ptr[0] = (uint64_t (*)())_dispatch_channel_xref_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_channel_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F2F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_data_debug_ptr[0] = (uint64_t (*)())_dispatch_data_debug();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_data_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_data_dispose_ptr[0] = (uint64_t (*)())_dispatch_data_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_data_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F3B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_data_init_with_bytes_ptr[0] = (uint64_t (*)())_dispatch_data_init_with_bytes();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_data_init_with_bytes_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F41C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_data_set_target_queue_ptr[0] = (uint64_t (*)())_dispatch_data_set_target_queue();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_data_set_target_queue_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_disk_dispose_ptr[0] = (uint64_t (*)())_dispatch_disk_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_disk_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F4E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_dispose_ptr[0] = (uint64_t (*)())_dispatch_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_event_loop_atfork_child_ptr[0] = (uint64_t (*)())_dispatch_event_loop_atfork_child();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_event_loop_atfork_child_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F5AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_group_create_and_enter_ptr[0] = _dispatch_group_create_and_enter();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_group_create_and_enter_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_group_debug_ptr[0] = (uint64_t (*)())_dispatch_group_debug();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_group_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_group_dispose_ptr[0] = (uint64_t (*)())_dispatch_group_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_group_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F6D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_io_debug_ptr[0] = (uint64_t (*)())_dispatch_io_debug();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_io_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F73C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_io_dispose_ptr[0] = (uint64_t (*)())_dispatch_io_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_io_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F7A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_lane_activate_ptr[0] = (uint64_t (*)())_dispatch_lane_activate();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_lane_activate_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_lane_concurrent_push_ptr[0] = (uint64_t (*)())_dispatch_lane_concurrent_push();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_lane_concurrent_push_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_lane_dispose_ptr[0] = _dispatch_lane_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_lane_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F8CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_lane_invoke_ptr[0] = (uint64_t (*)())_dispatch_lane_invoke();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_lane_invoke_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_lane_push_ptr[0] = (uint64_t (*)())_dispatch_lane_push();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_lane_push_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_lane_wakeup_ptr[0] = (uint64_t (*)())_dispatch_lane_wakeup();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_lane_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05F9F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mach_activate_ptr[0] = (uint64_t (*)())_dispatch_mach_activate();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_activate_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FA5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mach_debug_ptr[0] = (uint64_t (*)())_dispatch_mach_debug();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FAC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mach_dispose_ptr[0] = (uint64_t (*)())_dispatch_mach_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FB24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mach_invoke_ptr[0] = (uint64_t (*)())_dispatch_mach_invoke();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_invoke_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FB88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mach_msg_debug_ptr[0] = (uint64_t (*)())_dispatch_mach_msg_debug();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_msg_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FBEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mach_msg_dispose_ptr[0] = (uint64_t (*)())_dispatch_mach_msg_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_msg_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FC50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mach_msg_invoke_ptr[0] = (uint64_t (*)())_dispatch_mach_msg_invoke();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_msg_invoke_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FCB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mach_notify_dead_name_ptr[0] = (uint64_t (*)())_dispatch_mach_notify_dead_name();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_notify_dead_name_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FD18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mach_notify_port_deleted_ptr[0] = (uint64_t (*)())_dispatch_mach_notify_port_deleted();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_notify_port_deleted_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FD7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mach_notify_send_possible_ptr[0] = (uint64_t (*)())_dispatch_mach_notify_send_possible();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_notify_send_possible_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FDE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mach_wakeup_ptr[0] = (uint64_t (*)())_dispatch_mach_wakeup();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FE44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_main_queue_push_ptr[0] = (uint64_t (*)())_dispatch_main_queue_push();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_main_queue_push_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FEA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_main_queue_wakeup_ptr[0] = (uint64_t (*)())_dispatch_main_queue_wakeup();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_main_queue_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FF0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mgr_queue_push_ptr[0] = (uint64_t (*)())_dispatch_mgr_queue_push();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mgr_queue_push_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FF70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mgr_queue_wakeup_ptr[0] = (uint64_t (*)())_dispatch_mgr_queue_wakeup();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mgr_queue_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A05FFD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_operation_debug_ptr[0] = (uint64_t (*)())_dispatch_operation_debug();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_operation_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_operation_dispose_ptr[0] = (uint64_t (*)())_dispatch_operation_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_operation_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06009C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_pthread_root_queue_dispose_ptr[0] = (uint64_t (*)())_dispatch_pthread_root_queue_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_pthread_root_queue_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_queue_atfork_child_ptr[0] = (uint64_t (*)())_dispatch_queue_atfork_child();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_queue_atfork_child_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_queue_debug_ptr[0] = (uint64_t (*)())_dispatch_queue_debug();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_queue_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0601C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_queue_xref_dispose_ptr[0] = (uint64_t (*)())_dispatch_queue_xref_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_queue_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06022C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_root_queue_push_ptr[0] = (uint64_t (*)())_dispatch_root_queue_push();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_root_queue_push_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_root_queue_wakeup_ptr[0] = (uint64_t (*)())_dispatch_root_queue_wakeup();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_root_queue_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0602F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_runloop_queue_dispose_ptr[0] = (uint64_t (*)())_dispatch_runloop_queue_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_queue_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_runloop_queue_wakeup_ptr[0] = (uint64_t (*)())_dispatch_runloop_queue_wakeup();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_queue_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0603BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_runloop_queue_xref_dispose_ptr[0] = (uint64_t (*)())_dispatch_runloop_queue_xref_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_queue_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_semaphore_debug_ptr[0] = (uint64_t (*)())_dispatch_semaphore_debug();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_semaphore_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_semaphore_dispose_ptr[0] = (uint64_t (*)())_dispatch_semaphore_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_semaphore_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0604E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_source_activate_ptr[0] = (uint64_t (*)())_dispatch_source_activate();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_activate_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06054C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_source_debug_ptr[0] = (uint64_t (*)())_dispatch_source_debug();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0605B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_source_dispose_ptr[0] = (uint64_t (*)())_dispatch_source_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_source_invoke_ptr[0] = (uint64_t (*)())_dispatch_source_invoke();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_invoke_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_source_wakeup_ptr[0] = (uint64_t (*)())_dispatch_source_wakeup();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0606DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_source_xref_dispose_ptr[0] = (uint64_t (*)())_dispatch_source_xref_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_workloop_dispose_ptr[0] = (uint64_t (*)())_dispatch_workloop_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_workloop_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0607A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_workloop_invoke_ptr[0] = (uint64_t (*)())_dispatch_workloop_invoke();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_workloop_invoke_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_workloop_push_ptr[0] = (uint64_t (*)())_dispatch_workloop_push();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_workloop_push_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06086C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_workloop_wakeup_ptr[0] = (uint64_t (*)())_dispatch_workloop_wakeup();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_workloop_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0608D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_eventlink_dispose_ptr[0] = (uint64_t (*)())_os_eventlink_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_eventlink_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_object_allows_weak_reference_ptr[0] = (uint64_t (*)())_os_object_allows_weak_reference();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_allows_weak_reference_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_object_retain_count_ptr[0] = (uint64_t (*)())_os_object_retain_count();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_retain_count_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0609FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_object_retain_weak_ptr[0] = (uint64_t (*)())_os_object_retain_weak();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_retain_weak_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_workgroup_debug_ptr[0] = (uint64_t (*)())_os_workgroup_debug();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_workgroup_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_workgroup_dispose_ptr[0] = (uint64_t (*)())_os_workgroup_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_workgroup_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_workgroup_interval_xref_dispose_ptr[0] = (uint64_t (*)())_os_workgroup_interval_xref_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_workgroup_interval_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_workgroup_interval_dispose_ptr[0] = _os_workgroup_interval_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_workgroup_interval_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_workgroup_xref_dispose_ptr[0] = (uint64_t (*)())_os_workgroup_xref_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_workgroup_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _voucher_atfork_child_ptr[0] = (uint64_t (*)())_voucher_atfork_child();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_voucher_atfork_child_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _voucher_atfork_parent_ptr[0] = _voucher_atfork_parent();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_voucher_atfork_parent_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _voucher_atfork_prepare_ptr[0] = _voucher_atfork_prepare();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_voucher_atfork_prepare_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _voucher_debug_ptr[0] = (uint64_t (*)())_voucher_debug();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_voucher_debug_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _voucher_dispose_ptr[0] = (uint64_t (*)())_voucher_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_voucher_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _voucher_xref_dispose_ptr[0] = (uint64_t (*)())_voucher_xref_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_voucher_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  firehose_client_push_notify_async_ptr = (uint64_t (*)())firehose_client_push_notify_async();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))firehose_client_push_notify_async_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  firehose_client_push_reply_ptr = (uint64_t (*)())firehose_client_push_reply();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))firehose_client_push_reply_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060F74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_get_main_queue_handle_4CF_ptr[0] = _dispatch_get_main_queue_handle_4CF();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_get_main_queue_handle_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A060FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_get_main_queue_port_4CF_ptr[0] = _dispatch_get_main_queue_port_4CF();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_get_main_queue_port_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06103C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_iocntl_ptr[0] = (uint64_t (*)())_dispatch_iocntl();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_iocntl_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0610A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_mach_hooks_install_default_ptr[0] = (uint64_t (*)())_dispatch_mach_hooks_install_default();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_mach_hooks_install_default_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_main_queue_callback_4CF_ptr[0] = (uint64_t (*)())_dispatch_main_queue_callback_4CF();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_main_queue_callback_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_poll_for_events_4launchd_ptr[0] = _dispatch_poll_for_events_4launchd();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_poll_for_events_4launchd_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0611CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_prohibit_transition_to_multithreaded_ptr[0] = (uint64_t (*)())_dispatch_prohibit_transition_to_multithreaded();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_prohibit_transition_to_multithreaded_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_pthread_root_queue_create_with_observer_hooks_4IOHID_ptr[0] = (uint64_t (*)())_dispatch_pthread_root_queue_create_with_observer_hooks_4IOHID();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_pthread_root_queue_create_with_observer_hooks_4IOHID_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_queue_is_exclusively_owned_by_current_thread_4IOHID_ptr[0] = (uint64_t (*)())_dispatch_queue_is_exclusively_owned_by_current_thread_4IOHID();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_queue_is_exclusively_owned_by_current_thread_4IOHID_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0612F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_runloop_root_queue_create_4CF_ptr[0] = (uint64_t (*)())_dispatch_runloop_root_queue_create_4CF();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_root_queue_create_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06135C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_runloop_root_queue_get_port_4CF_ptr[0] = (uint64_t (*)())_dispatch_runloop_root_queue_get_port_4CF();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_root_queue_get_port_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0613C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_runloop_root_queue_perform_4CF_ptr[0] = (uint64_t (*)())_dispatch_runloop_root_queue_perform_4CF();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_root_queue_perform_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_runloop_root_queue_wakeup_4CF_ptr[0] = (uint64_t (*)())_dispatch_runloop_root_queue_wakeup_4CF();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_runloop_root_queue_wakeup_4CF_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_source_will_reenable_kevent_4NW_ptr[0] = (uint64_t (*)())_dispatch_source_will_reenable_kevent_4NW();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_source_will_reenable_kevent_4NW_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0614EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_workloop_set_observer_hooks_4IOHID_ptr[0] = (uint64_t (*)())_dispatch_workloop_set_observer_hooks_4IOHID();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_workloop_set_observer_hooks_4IOHID_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _dispatch_workloop_should_yield_4NW_ptr[0] = (uint64_t (*)())_dispatch_workloop_should_yield_4NW();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_workloop_should_yield_4NW_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0615B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_object_release_ptr[0] = (uint64_t (*)())_os_object_release();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_release_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_object_release_internal_ptr[0] = (uint64_t (*)())_os_object_release_internal();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_release_internal_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06167C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_object_release_internal_n_ptr[0] = (uint64_t (*)())_os_object_release_internal_n();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_release_internal_n_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0616E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_object_release_without_xref_dispose_ptr[0] = (uint64_t (*)())_os_object_release_without_xref_dispose();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_release_without_xref_dispose_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_object_retain_ptr[0] = (uint64_t (*)())_os_object_retain();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_retain_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0617A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_object_retain_internal_ptr[0] = (uint64_t (*)())_os_object_retain_internal();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_retain_internal_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06180C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_object_retain_internal_n_ptr[0] = (uint64_t (*)())_os_object_retain_internal_n();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_retain_internal_n_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_object_retain_with_resurrect_ptr[0] = (uint64_t (*)())_os_object_retain_with_resurrect();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_object_retain_with_resurrect_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0618D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_activate(a1);
  dispatch_activate_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061938(dispatch_time_t a1, NSObject *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_after(a1, a2, a3);
  dispatch_after_ptr[0] = v8;
  return ((uint64_t (*)(dispatch_time_t, NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06199C(dispatch_time_t a1, NSObject *a2, void *a3, void (__cdecl *a4)(void *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_after_f(a1, a2, a3, a4);
  dispatch_after_f_ptr[0] = v8;
  return ((uint64_t (*)(dispatch_time_t, NSObject *, void *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061A00(size_t a1, NSObject *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_apply(a1, a2, a3);
  dispatch_apply_ptr[0] = v8;
  return ((uint64_t (*)(size_t, NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_apply_attr_destroy_ptr[0] = (uint64_t (*)())dispatch_apply_attr_destroy();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_apply_attr_destroy_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_apply_attr_init_ptr[0] = (uint64_t (*)())dispatch_apply_attr_init();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_apply_attr_init_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_apply_attr_set_parallelism_ptr[0] = (uint64_t (*)())dispatch_apply_attr_set_parallelism();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_apply_attr_set_parallelism_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061B90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_apply_attr_query_ptr[0] = (uint64_t (*)())dispatch_apply_attr_query();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_apply_attr_query_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_apply_with_attr_ptr[0] = (uint64_t (*)())dispatch_apply_with_attr();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_apply_with_attr_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_apply_with_attr_f_ptr[0] = (uint64_t (*)())dispatch_apply_with_attr_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_apply_with_attr_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061CBC(size_t a1, NSObject *a2, void *a3, void (__cdecl *a4)(void *, size_t), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_apply_f(a1, a2, a3, a4);
  dispatch_apply_f_ptr[0] = v8;
  return ((uint64_t (*)(size_t, NSObject *, void *, void (__cdecl *)(void *, size_t), uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061D20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_assert_queue_V2(a1);
  dispatch_assert_queue_V2_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061D84(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_assert_queue_barrier(a1);
  dispatch_assert_queue_barrier_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061DE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_assert_queue_not_V2(a1);
  dispatch_assert_queue_not_V2_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_allow_send_signals_ptr[0] = dispatch_allow_send_signals();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_allow_send_signals_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061EB0(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_channel_async(a1, a2);
  dispatch_async_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061F14(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_async_and_wait(a1, a2);
  dispatch_async_and_wait_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061F78(NSObject *a1, void *a2, void (__cdecl *a3)(void *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_async_and_wait_f(a1, a2, a3);
  dispatch_async_and_wait_f_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, void *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A061FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_async_enforce_qos_class_f_ptr[0] = (uint64_t (*)())dispatch_async_enforce_qos_class_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_async_enforce_qos_class_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062040(NSObject *a1, void *a2, void (__cdecl *a3)(void *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_channel_async_f(a1, a2, a3);
  dispatch_async_f_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, void *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0620A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_async_swift_job_ptr[0] = (uint64_t (*)())dispatch_async_swift_job();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_async_swift_job_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062108(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_barrier_async(a1, a2);
  dispatch_barrier_async_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06216C(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_barrier_async_and_wait(a1, a2);
  dispatch_barrier_async_and_wait_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0621D0(NSObject *a1, void *a2, void (__cdecl *a3)(void *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_barrier_async_and_wait_f(a1, a2, a3);
  dispatch_barrier_async_and_wait_f_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, void *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062234(NSObject *a1, void *a2, void (__cdecl *a3)(void *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_barrier_async_f(a1, a2, a3);
  dispatch_barrier_async_f_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, void *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062298(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_barrier_sync(a1, a2);
  dispatch_barrier_sync_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0622FC(NSObject *a1, void *a2, void (__cdecl *a3)(void *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_barrier_sync_f(a1, a2, a3);
  dispatch_barrier_sync_f_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, void *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062360(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_block_cancel(a1);
  dispatch_block_cancel_ptr[0] = v8;
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0623C4(dispatch_block_flags_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_block_create_ptr[0] = (uint64_t (*)())dispatch_block_create(a1, a2);
  return ((uint64_t (*)(dispatch_block_flags_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_block_create_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062428(dispatch_block_flags_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_block_create_with_qos_class_ptr[0] = (uint64_t (*)())dispatch_block_create_with_qos_class(a1, (dispatch_qos_class_t)a2, a3, a4);
  return ((uint64_t (*)(dispatch_block_flags_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_block_create_with_qos_class_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06248C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_block_create_with_voucher_ptr[0] = (uint64_t (*)())dispatch_block_create_with_voucher();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_block_create_with_voucher_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0624F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_block_create_with_voucher_and_qos_class_ptr[0] = (uint64_t (*)())dispatch_block_create_with_voucher_and_qos_class();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_block_create_with_voucher_and_qos_class_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062554(void *a1, NSObject *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_block_notify(a1, a2, a3);
  dispatch_block_notify_ptr[0] = v8;
  return ((uint64_t (*)(void *, NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0625B8(dispatch_block_flags_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_block_perform(a1, a2);
  dispatch_block_perform_ptr[0] = v8;
  return ((uint64_t (*)(dispatch_block_flags_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06261C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_block_testcancel_ptr[0] = (uint64_t (*)())dispatch_block_testcancel(a1);
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_block_testcancel_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062680(void *a1, dispatch_time_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_block_wait_ptr[0] = (uint64_t (*)())dispatch_block_wait(a1, a2);
  return ((uint64_t (*)(void *, dispatch_time_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_block_wait_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0626E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_channel_create_ptr[0] = (uint64_t (*)())dispatch_channel_create();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_create_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_channel_drain_ptr[0] = (uint64_t (*)())dispatch_channel_drain();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_drain_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0627AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_channel_drain_f_ptr[0] = (uint64_t (*)())dispatch_channel_drain_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_drain_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_channel_enqueue_ptr[0] = (uint64_t (*)())dispatch_channel_enqueue();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_enqueue_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_channel_foreach_work_item_peek_ptr[0] = (uint64_t (*)())dispatch_channel_foreach_work_item_peek();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_foreach_work_item_peek_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0628D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_channel_foreach_work_item_peek_f_ptr[0] = (uint64_t (*)())dispatch_channel_foreach_work_item_peek_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_foreach_work_item_peek_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06293C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_channel_wakeup_ptr[0] = (uint64_t (*)())dispatch_channel_wakeup();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_wakeup_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0629A0(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_data_apply_ptr[0] = (uint64_t (*)())dispatch_data_apply(a1, a2);
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_apply_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062A04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_data_apply_f_ptr[0] = (uint64_t (*)())dispatch_data_apply_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_apply_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062A68(NSObject *a1, size_t a2, size_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_data_copy_region_ptr[0] = (uint64_t (*)())dispatch_data_copy_region(a1, a2, a3);
  return ((uint64_t (*)(NSObject *, size_t, size_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_copy_region_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062ACC(const void *a1, size_t a2, NSObject *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_data_create_ptr[0] = (uint64_t (*)())dispatch_data_create(a1, a2, a3, a4);
  return ((uint64_t (*)(const void *, size_t, NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_create_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_data_create_alloc_ptr[0] = (uint64_t (*)())dispatch_data_create_alloc();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_create_alloc_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062B94(NSObject *a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_data_create_concat_ptr[0] = (uint64_t (*)())dispatch_data_create_concat(a1, a2);
  return ((uint64_t (*)(NSObject *, NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_create_concat_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_data_create_f_ptr[0] = (uint64_t (*)())dispatch_data_create_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_create_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062C5C(NSObject *a1, const void **a2, size_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_data_create_map_ptr[0] = (uint64_t (*)())dispatch_data_create_map(a1, a2, a3);
  return ((uint64_t (*)(NSObject *, const void **, size_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_create_map_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062CC0(NSObject *a1, size_t a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_data_create_subrange_ptr[0] = (uint64_t (*)())dispatch_data_create_subrange(a1, a2, a3);
  return ((uint64_t (*)(NSObject *, size_t, size_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_create_subrange_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_data_get_flattened_bytes_4libxpc_ptr[0] = (uint64_t (*)())dispatch_data_get_flattened_bytes_4libxpc();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_get_flattened_bytes_4libxpc_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062D88(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_data_get_size_ptr[0] = (uint64_t (*)())dispatch_data_get_size(a1);
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_get_size_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_data_make_memory_entry_ptr[0] = (uint64_t (*)())dispatch_data_make_memory_entry();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_data_make_memory_entry_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062E50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_get_context_ptr[0] = (uint64_t (*)())dispatch_get_context(a1);
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_get_context_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062EB4(intptr_t a1, uintptr_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_get_global_queue_ptr[0] = (uint64_t (*)())dispatch_get_global_queue(a1, a2);
  return ((uint64_t (*)(intptr_t, uintptr_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_get_global_queue_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062F18(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_get_specific_ptr[0] = (uint64_t (*)())dispatch_get_specific(a1);
  return ((uint64_t (*)(const void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_get_specific_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062F7C(NSObject *a1, NSObject *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_group_async(a1, a2, a3);
  dispatch_group_async_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A062FE0(NSObject *a1, NSObject *a2, void *a3, void (__cdecl *a4)(void *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_group_async_f(a1, a2, a3, a4);
  dispatch_group_async_f_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, NSObject *, void *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_group_create_ptr[0] = (uint64_t (*)())dispatch_group_create();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_group_create_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0630A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_group_enter(a1);
  dispatch_group_enter_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06310C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_group_leave(a1);
  dispatch_group_leave_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063170(NSObject *a1, NSObject *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_group_notify(a1, a2, a3);
  dispatch_group_notify_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0631D4(NSObject *a1, NSObject *a2, void *a3, void (__cdecl *a4)(void *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_group_notify_f(a1, a2, a3, a4);
  dispatch_group_notify_f_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, NSObject *, void *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063238(NSObject *a1, dispatch_time_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_group_wait_ptr[0] = (uint64_t (*)())dispatch_group_wait(a1, a2);
  return ((uint64_t (*)(NSObject *, dispatch_time_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_group_wait_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06329C(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_io_barrier(a1, a2);
  dispatch_io_barrier_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_io_barrier_f_ptr[0] = (uint64_t (*)())dispatch_io_barrier_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_barrier_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063364(NSObject *a1, dispatch_io_close_flags_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_io_close(a1, a2);
  dispatch_io_close_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, dispatch_io_close_flags_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0633C8(dispatch_io_type_t a1, uint64_t a2, NSObject *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_io_create_ptr[0] = (uint64_t (*)())dispatch_io_create(a1, a2, a3, a4);
  return ((uint64_t (*)(dispatch_io_type_t, uint64_t, NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_create_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06342C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_io_create_f_ptr[0] = (uint64_t (*)())dispatch_io_create_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_create_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063490(dispatch_io_type_t a1, NSObject *a2, NSObject *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_io_create_with_io_ptr[0] = (uint64_t (*)())dispatch_io_create_with_io(a1, a2, a3, a4);
  return ((uint64_t (*)(dispatch_io_type_t, NSObject *, NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_create_with_io_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0634F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_io_create_with_io_f_ptr[0] = (uint64_t (*)())dispatch_io_create_with_io_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_create_with_io_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063558(dispatch_io_type_t a1, const char *a2, uint64_t a3, uint64_t a4, NSObject *a5, void *a6, uint64_t a7, uint64_t a8)
{
  dispatch_io_create_with_path_ptr[0] = (uint64_t (*)())dispatch_io_create_with_path(a1, a2, a3, a4, a5, a6);
  return ((uint64_t (*)(dispatch_io_type_t, const char *, uint64_t, uint64_t, NSObject *, void *, uint64_t, uint64_t))dispatch_io_create_with_path_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0635BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_io_create_with_path_f_ptr[0] = (uint64_t (*)())dispatch_io_create_with_path_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_create_with_path_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063620(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_io_get_descriptor_ptr[0] = (uint64_t (*)())dispatch_io_get_descriptor(a1);
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_get_descriptor_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063684(NSObject *a1, off_t a2, size_t a3, NSObject *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_io_read(a1, a2, a3, a4, a5);
  dispatch_io_read_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, off_t, size_t, NSObject *, void *, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0636E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_io_read_f_ptr[0] = (uint64_t (*)())dispatch_io_read_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_read_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06374C(NSObject *a1, size_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_io_set_high_water(a1, a2);
  dispatch_io_set_high_water_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, size_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0637B0(NSObject *a1, uint64_t a2, dispatch_io_interval_flags_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_io_set_interval(a1, a2, a3);
  dispatch_io_set_interval_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, dispatch_io_interval_flags_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063814(NSObject *a1, size_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_io_set_low_water(a1, a2);
  dispatch_io_set_low_water_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, size_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063878(NSObject *a1, off_t a2, NSObject *a3, NSObject *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_io_write(a1, a2, a3, a4, a5);
  dispatch_io_write_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, off_t, NSObject *, NSObject *, void *, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0638DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_io_write_f_ptr[0] = (uint64_t (*)())dispatch_io_write_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_io_write_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_lock_override_start_with_debounce_ptr[0] = dispatch_lock_override_start_with_debounce();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_lock_override_start_with_debounce_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0639A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_lock_override_end_ptr[0] = (uint64_t (*)())dispatch_lock_override_end();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_lock_override_end_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_can_handoff_4libxpc_ptr[0] = (uint64_t (*)())dispatch_mach_can_handoff_4libxpc();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_can_handoff_4libxpc_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063A6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_cancel_ptr[0] = (uint64_t (*)())dispatch_mach_cancel();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_cancel_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063AD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_connect_ptr[0] = (uint64_t (*)())dispatch_mach_connect();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_connect_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_create_ptr[0] = (uint64_t (*)())dispatch_mach_create();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_create_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063B98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_create_4libxpc_ptr[0] = (uint64_t (*)())dispatch_mach_create_4libxpc();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_create_4libxpc_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_create_f_ptr[0] = (uint64_t (*)())dispatch_mach_create_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_create_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_get_checkin_port_ptr[0] = (uint64_t (*)())dispatch_mach_get_checkin_port();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_get_checkin_port_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_handoff_reply_ptr[0] = (uint64_t (*)())dispatch_mach_handoff_reply();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_handoff_reply_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_handoff_reply_f_ptr[0] = (uint64_t (*)())dispatch_mach_handoff_reply_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_handoff_reply_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063D8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_hooks_install_4libxpc_ptr[0] = (uint64_t (*)())dispatch_mach_hooks_install_4libxpc();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_hooks_install_4libxpc_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_mig_demux_ptr[0] = (uint64_t (*)())dispatch_mach_mig_demux();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_mig_demux_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_mig_demux_get_context_ptr[0] = dispatch_mach_mig_demux_get_context();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_mig_demux_get_context_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063EB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_msg_create_ptr[0] = (uint64_t (*)())dispatch_mach_msg_create();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_msg_create_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_msg_get_filter_policy_id_ptr[0] = (uint64_t (*)())dispatch_mach_msg_get_filter_policy_id();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_msg_get_filter_policy_id_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_msg_get_msg_ptr[0] = (uint64_t (*)())dispatch_mach_msg_get_msg();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_msg_get_msg_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A063FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_notify_no_senders_ptr[0] = (uint64_t (*)())dispatch_mach_notify_no_senders();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_notify_no_senders_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_receive_barrier_ptr[0] = (uint64_t (*)())dispatch_mach_receive_barrier();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_receive_barrier_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0640AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_receive_barrier_f_ptr[0] = (uint64_t (*)())dispatch_mach_receive_barrier_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_receive_barrier_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_reconnect_ptr[0] = (uint64_t (*)())dispatch_mach_reconnect();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_reconnect_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_request_no_senders_ptr[0] = (uint64_t (*)())dispatch_mach_request_no_senders();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_request_no_senders_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0641D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_send_ptr[0] = (uint64_t (*)())dispatch_mach_send();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06423C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_send_and_wait_for_reply_ptr[0] = (uint64_t (*)())dispatch_mach_send_and_wait_for_reply();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_and_wait_for_reply_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0642A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_send_barrier_ptr[0] = (uint64_t (*)())dispatch_mach_send_barrier();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_barrier_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_send_barrier_f_ptr[0] = (uint64_t (*)())dispatch_mach_send_barrier_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_barrier_f_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_send_with_result_ptr[0] = (uint64_t (*)())dispatch_mach_send_with_result();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_with_result_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0643CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_send_with_result_and_async_reply_4libxpc_ptr[0] = (uint64_t (*)())dispatch_mach_send_with_result_and_async_reply_4libxpc();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_with_result_and_async_reply_4libxpc_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_send_with_result_and_wait_for_reply_ptr[0] = (uint64_t (*)())dispatch_mach_send_with_result_and_wait_for_reply();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_send_with_result_and_wait_for_reply_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mach_set_flags_ptr = (uint64_t (*)())dispatch_mach_set_flags();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mach_set_flags_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_18A0644F8()
{
  dispatch_main();
}

uint64_t sub_18A064524(void (*a1)())
{
  dispatch_main_ptr = a1;
  return ((uint64_t (*)())a1)();
}

uint64_t sub_18A06455C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_mig_server_ptr = (uint64_t (*)())dispatch_mig_server();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_mig_server_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0645C0(dispatch_once_t *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_once(a1, a2);
  dispatch_once_ptr = v8;
  return ((uint64_t (*)(dispatch_once_t *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064624(dispatch_once_t *a1, void *a2, void (__cdecl *a3)(void *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_once_f(a1, a2, a3);
  dispatch_once_f_ptr = v8;
  return ((uint64_t (*)(dispatch_once_t *, void *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_pthread_root_queue_copy_current_ptr = dispatch_pthread_root_queue_copy_current();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_pthread_root_queue_copy_current_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0646EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_pthread_root_queue_create_ptr = (uint64_t (*)())dispatch_pthread_root_queue_create();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_pthread_root_queue_create_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064750(const char *a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_queue_create_ptr = (uint64_t (*)())dispatch_queue_create(a1, a2);
  return ((uint64_t (*)(const char *, NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_queue_create_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0647B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_queue_create_with_accounting_override_voucher_ptr = (uint64_t (*)())dispatch_queue_create_with_accounting_override_voucher();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_queue_create_with_accounting_override_voucher_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064818(const char *a1, NSObject *a2, NSObject *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_queue_create_with_target_V2_ptr = (uint64_t (*)())dispatch_queue_create_with_target_V2(a1, a2, a3);
  return ((uint64_t (*)(const char *, NSObject *, NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_queue_create_with_target_V2_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06487C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_queue_get_label_ptr = (uint64_t (*)())dispatch_queue_get_label(a1);
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_queue_get_label_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0648E0(NSObject *a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_queue_get_qos_class_ptr = (uint64_t (*)())dispatch_queue_get_qos_class(a1, a2);
  return ((uint64_t (*)(NSObject *, int *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_queue_get_qos_class_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064944(NSObject *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_queue_get_specific_ptr = (uint64_t (*)())dispatch_queue_get_specific(a1, a2);
  return ((uint64_t (*)(NSObject *, const void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_queue_get_specific_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0649A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_queue_set_label_nocopy_ptr = (uint64_t (*)())dispatch_queue_set_label_nocopy();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_queue_set_label_nocopy_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064A0C(NSObject *a1, const void *a2, void *a3, void (__cdecl *a4)(void *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_queue_set_specific(a1, a2, a3, a4);
  dispatch_queue_set_specific_ptr = v8;
  return ((uint64_t (*)(NSObject *, const void *, void *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_queue_set_width_ptr = (uint64_t (*)())dispatch_queue_set_width();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_queue_set_width_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064AD4(uint64_t a1, size_t a2, NSObject *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_read(a1, a2, a3, a4);
  dispatch_read_ptr = v8;
  return ((uint64_t (*)(uint64_t, size_t, NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_read_f_ptr = (uint64_t (*)())dispatch_read_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_read_f_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064B9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_release(a1);
  dispatch_release_ptr = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064C00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_resume(a1);
  dispatch_resume_ptr = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064C64(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_retain(a1);
  dispatch_retain_ptr = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064CC8(intptr_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_semaphore_create_ptr = (uint64_t (*)())dispatch_semaphore_create(a1);
  return ((uint64_t (*)(intptr_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_semaphore_create_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064D2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_semaphore_signal_ptr = (uint64_t (*)())dispatch_semaphore_signal(a1);
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_semaphore_signal_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064D90(NSObject *a1, dispatch_time_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_semaphore_wait_ptr = (uint64_t (*)())dispatch_semaphore_wait(a1, a2);
  return ((uint64_t (*)(NSObject *, dispatch_time_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_semaphore_wait_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064DF4(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_set_context(a1, a2);
  dispatch_set_context_ptr = v8;
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064E58(NSObject *a1, void (__cdecl *a2)(void *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_set_finalizer_f(a1, a2);
  dispatch_set_finalizer_f_ptr = v8;
  return ((uint64_t (*)(NSObject *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_set_qos_class_ptr = (uint64_t (*)())dispatch_set_qos_class();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_set_qos_class_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_set_qos_class_fallback_ptr = (uint64_t (*)())dispatch_set_qos_class_fallback();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_set_qos_class_fallback_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064F84(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_set_qos_class_floor(a1, (dispatch_qos_class_t)a2, a3);
  dispatch_set_qos_class_floor_ptr = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A064FE8(NSObject *a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_set_target_queue(a1, a2);
  dispatch_set_target_queue_ptr = v8;
  return ((uint64_t (*)(NSObject *, NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06504C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_source_cancel(a1);
  dispatch_source_cancel_ptr = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0650B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_source_cancel_and_wait_ptr = (uint64_t (*)())dispatch_source_cancel_and_wait();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_source_cancel_and_wait_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065114(const dispatch_source_type_s *a1, uintptr_t a2, uintptr_t a3, NSObject *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_source_create_ptr = (uint64_t (*)())dispatch_source_create(a1, a2, a3, a4);
  return ((uint64_t (*)(const dispatch_source_type_s *, uintptr_t, uintptr_t, NSObject *, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_source_create_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065178(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_source_get_data_ptr = (uint64_t (*)())dispatch_source_get_data(a1);
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_source_get_data_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0651DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_source_get_extended_data_ptr = (uint64_t (*)())dispatch_source_get_extended_data();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_source_get_extended_data_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065240(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_source_get_handle_ptr = (uint64_t (*)())dispatch_source_get_handle(a1);
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_source_get_handle_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0652A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_source_get_mask_ptr = (uint64_t (*)())dispatch_source_get_mask(a1);
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_source_get_mask_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065308(NSObject *a1, uintptr_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_source_merge_data(a1, a2);
  dispatch_source_merge_data_ptr = v8;
  return ((uint64_t (*)(NSObject *, uintptr_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06536C(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_source_set_cancel_handler(a1, a2);
  dispatch_source_set_cancel_handler_ptr = v8;
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0653D0(NSObject *a1, void (__cdecl *a2)(void *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_source_set_cancel_handler_f(a1, a2);
  dispatch_source_set_cancel_handler_f_ptr = v8;
  return ((uint64_t (*)(NSObject *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065434(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_source_set_event_handler(a1, a2);
  dispatch_source_set_event_handler_ptr = v8;
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065498(NSObject *a1, void (__cdecl *a2)(void *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_source_set_event_handler_f(a1, a2);
  dispatch_source_set_event_handler_f_ptr = v8;
  return ((uint64_t (*)(NSObject *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0654FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_source_set_mandatory_cancel_handler_ptr = (uint64_t (*)())dispatch_source_set_mandatory_cancel_handler();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_source_set_mandatory_cancel_handler_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_source_set_mandatory_cancel_handler_f_ptr = (uint64_t (*)())dispatch_source_set_mandatory_cancel_handler_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_source_set_mandatory_cancel_handler_f_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0655C4(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_source_set_registration_handler(a1, a2);
  dispatch_source_set_registration_handler_ptr = v8;
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065628(NSObject *a1, void (__cdecl *a2)(void *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_source_set_registration_handler_f(a1, a2);
  dispatch_source_set_registration_handler_f_ptr = v8;
  return ((uint64_t (*)(NSObject *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06568C(NSObject *a1, dispatch_time_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_source_set_timer(a1, a2, a3, a4);
  dispatch_source_set_timer_ptr = v8;
  return ((uint64_t (*)(NSObject *, dispatch_time_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0656F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_source_testcancel_ptr = (uint64_t (*)())dispatch_source_testcancel(a1);
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_source_testcancel_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065754(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_suspend(a1);
  dispatch_suspend_ptr = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0657B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_swift_job_should_yield_ptr = (uint64_t (*)())dispatch_swift_job_should_yield();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_swift_job_should_yield_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06581C(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_sync(a1, a2);
  dispatch_sync_ptr = v8;
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065880(NSObject *a1, void *a2, void (__cdecl *a3)(void *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_sync_f(a1, a2, a3);
  dispatch_sync_f_ptr = v8;
  return ((uint64_t (*)(NSObject *, void *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0658E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_thread_get_current_override_qos_floor_ptr = dispatch_thread_get_current_override_qos_floor();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_thread_get_current_override_qos_floor_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_thread_override_self_ptr = (uint64_t (*)())dispatch_thread_override_self();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_thread_override_self_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0659AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_workloop_copy_current_ptr = dispatch_workloop_copy_current();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_workloop_copy_current_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065A10(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_workloop_create_ptr = (uint64_t (*)())dispatch_workloop_create(a1);
  return ((uint64_t (*)(const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_workloop_create_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065A74(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_workloop_create_inactive_ptr = (uint64_t (*)())dispatch_workloop_create_inactive(a1);
  return ((uint64_t (*)(const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_workloop_create_inactive_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_workloop_is_current_ptr = (uint64_t (*)())dispatch_workloop_is_current();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_workloop_is_current_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065B3C(NSObject *a1, dispatch_autorelease_frequency_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_workloop_set_autorelease_frequency(a1, a2);
  dispatch_workloop_set_autorelease_frequency_ptr = v8;
  return ((uint64_t (*)(NSObject *, dispatch_autorelease_frequency_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_workloop_set_cpupercent_ptr = (uint64_t (*)())dispatch_workloop_set_cpupercent();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_workloop_set_cpupercent_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065C04(NSObject *a1, OS_os_workgroup *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_workloop_set_os_workgroup(a1, a2);
  dispatch_workloop_set_os_workgroup_ptr = v8;
  return ((uint64_t (*)(NSObject *, OS_os_workgroup *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_workloop_set_qos_class_ptr = (uint64_t (*)())dispatch_workloop_set_qos_class();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_workloop_set_qos_class_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_workloop_set_qos_class_floor_ptr = (uint64_t (*)())dispatch_workloop_set_qos_class_floor();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_workloop_set_qos_class_floor_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_workloop_set_scheduler_priority_ptr = (uint64_t (*)())dispatch_workloop_set_scheduler_priority();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_workloop_set_scheduler_priority_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065D94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_workloop_set_uses_bound_thread_ptr = (uint64_t (*)())dispatch_workloop_set_uses_bound_thread();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_workloop_set_uses_bound_thread_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065DF8(uint64_t a1, NSObject *a2, NSObject *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_write(a1, a2, a3, a4);
  dispatch_write_ptr = v8;
  return ((uint64_t (*)(uint64_t, NSObject *, NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_write_f_ptr = (uint64_t (*)())dispatch_write_f();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_write_f_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  libdispatch_init_ptr = libdispatch_init();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))libdispatch_init_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065F24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  mach_voucher_persona_self_ptr = (uint64_t (*)())mach_voucher_persona_self();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))mach_voucher_persona_self_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  mach_voucher_persona_for_originator_ptr = (uint64_t (*)())mach_voucher_persona_for_originator();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))mach_voucher_persona_for_originator_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A065FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_eventlink_create_ptr = (uint64_t (*)())os_eventlink_create();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_eventlink_create_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_eventlink_cancel_ptr = (uint64_t (*)())os_eventlink_cancel();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_eventlink_cancel_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0660B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_eventlink_activate_ptr = (uint64_t (*)())os_eventlink_activate();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_eventlink_activate_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_eventlink_extract_remote_port_ptr = (uint64_t (*)())os_eventlink_extract_remote_port();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_eventlink_extract_remote_port_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06617C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_eventlink_create_with_port_ptr = (uint64_t (*)())os_eventlink_create_with_port();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_eventlink_create_with_port_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0661E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_eventlink_create_remote_with_eventlink_ptr = (uint64_t (*)())os_eventlink_create_remote_with_eventlink();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_eventlink_create_remote_with_eventlink_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_eventlink_associate_ptr = (uint64_t (*)())os_eventlink_associate();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_eventlink_associate_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0662A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_eventlink_disassociate_ptr = (uint64_t (*)())os_eventlink_disassociate();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_eventlink_disassociate_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06630C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_eventlink_wait_ptr = (uint64_t (*)())os_eventlink_wait();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_eventlink_wait_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_eventlink_wait_until_ptr = (uint64_t (*)())os_eventlink_wait_until();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_eventlink_wait_until_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0663D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_eventlink_signal_ptr = (uint64_t (*)())os_eventlink_signal();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_eventlink_signal_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_eventlink_signal_and_wait_ptr = (uint64_t (*)())os_eventlink_signal_and_wait();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_eventlink_signal_and_wait_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06649C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_eventlink_signal_and_wait_until_ptr = (uint64_t (*)())os_eventlink_signal_and_wait_until();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_eventlink_signal_and_wait_until_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_attr_set_flags_ptr = (uint64_t (*)())os_workgroup_attr_set_flags();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_attr_set_flags_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_attr_set_interval_type_ptr = (uint64_t (*)())os_workgroup_attr_set_interval_type();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_attr_set_interval_type_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0665C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_attr_set_telemetry_flavor_ptr = (uint64_t (*)())os_workgroup_attr_set_telemetry_flavor();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_attr_set_telemetry_flavor_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06662C(OS_os_workgroup *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  os_workgroup_cancel(a1);
  os_workgroup_cancel_ptr = v8;
  return ((uint64_t (*)(OS_os_workgroup *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066690(OS_os_workgroup *a1, mach_port_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_copy_port_ptr = (uint64_t (*)())os_workgroup_copy_port(a1, a2);
  return ((uint64_t (*)(OS_os_workgroup *, mach_port_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_copy_port_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0666F4(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_create_with_port_ptr = (uint64_t (*)())os_workgroup_create_with_port(a1, a2);
  return ((uint64_t (*)(const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_create_with_port_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066758(const char *a1, OS_os_workgroup *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_create_with_workgroup_ptr = (uint64_t (*)())os_workgroup_create_with_workgroup(a1, a2);
  return ((uint64_t (*)(const char *, OS_os_workgroup *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_create_with_workgroup_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0667BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_create_with_workload_id_and_port_ptr = (uint64_t (*)())os_workgroup_create_with_workload_id_and_port();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_create_with_workload_id_and_port_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_create_with_workload_id_and_workgroup_ptr = (uint64_t (*)())os_workgroup_create_with_workload_id_and_workgroup();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_create_with_workload_id_and_workgroup_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_create_with_workload_id_ptr = (uint64_t (*)())os_workgroup_create_with_workload_id();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_create_with_workload_id_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0668E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_create_ptr = (uint64_t (*)())os_workgroup_create();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_create_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06694C(OS_os_workgroup *a1, os_workgroup_index *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_get_working_arena_ptr = (uint64_t (*)())os_workgroup_get_working_arena(a1, a2);
  return ((uint64_t (*)(OS_os_workgroup *, os_workgroup_index *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_get_working_arena_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0669B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_interval_copy_current_4AudioToolbox_ptr = (uint64_t (*)())os_workgroup_interval_copy_current_4AudioToolbox();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_interval_copy_current_4AudioToolbox_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066A14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_interval_create_with_workload_id_ptr = (uint64_t (*)())os_workgroup_interval_create_with_workload_id();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_interval_create_with_workload_id_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_interval_create_ptr = (uint64_t (*)())os_workgroup_interval_create();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_interval_create_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_interval_data_set_flags_ptr = (uint64_t (*)())os_workgroup_interval_data_set_flags();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_interval_data_set_flags_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_interval_data_set_telemetry_ptr = (uint64_t (*)())os_workgroup_interval_data_set_telemetry();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_interval_data_set_telemetry_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066BA4(OS_os_workgroup *a1, os_workgroup_interval_data_opaque_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_interval_finish_ptr = (uint64_t (*)())os_workgroup_interval_finish(a1, a2);
  return ((uint64_t (*)(OS_os_workgroup *, os_workgroup_interval_data_opaque_s *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_interval_finish_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066C08(OS_os_workgroup *a1, uint64_t a2, uint64_t a3, os_workgroup_interval_data_opaque_s *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_interval_start_ptr = (uint64_t (*)())os_workgroup_interval_start(a1, a2, a3, a4);
  return ((uint64_t (*)(OS_os_workgroup *, uint64_t, uint64_t, os_workgroup_interval_data_opaque_s *, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_interval_start_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066C6C(OS_os_workgroup *a1, uint64_t a2, os_workgroup_interval_data_opaque_s *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_interval_update_ptr = (uint64_t (*)())os_workgroup_interval_update(a1, a2, a3);
  return ((uint64_t (*)(OS_os_workgroup *, uint64_t, os_workgroup_interval_data_opaque_s *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_interval_update_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_join_self_ptr = os_workgroup_join_self();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_join_self_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066D34(OS_os_workgroup *a1, os_workgroup_join_token_opaque_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_join_ptr = (uint64_t (*)())os_workgroup_join(a1, a2);
  return ((uint64_t (*)(OS_os_workgroup *, os_workgroup_join_token_opaque_s *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_join_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_leave_self_ptr = os_workgroup_leave_self();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_leave_self_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066DFC(OS_os_workgroup *a1, os_workgroup_join_token_opaque_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  os_workgroup_leave(a1, a2);
  os_workgroup_leave_ptr = v8;
  return ((uint64_t (*)(OS_os_workgroup *, os_workgroup_join_token_opaque_s *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066E60(OS_os_workgroup *a1, os_workgroup_max_parallel_threads_attr_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_max_parallel_threads_ptr = (uint64_t (*)())os_workgroup_max_parallel_threads(a1, a2);
  return ((uint64_t (*)(OS_os_workgroup *, os_workgroup_max_parallel_threads_attr_s *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_max_parallel_threads_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066EC4(const char *a1, os_workgroup_attr_opaque_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_parallel_create_ptr = (uint64_t (*)())os_workgroup_parallel_create(a1, a2);
  return ((uint64_t (*)(const char *, os_workgroup_attr_opaque_s *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_parallel_create_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066F28(OS_os_workgroup *a1, void *a2, uint64_t a3, void (__cdecl *a4)(void *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_set_working_arena_ptr = (uint64_t (*)())os_workgroup_set_working_arena(a1, a2, a3, a4);
  return ((uint64_t (*)(OS_os_workgroup *, void *, uint64_t, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_set_working_arena_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066F8C(OS_os_workgroup *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_workgroup_testcancel_ptr = (uint64_t (*)())os_workgroup_testcancel(a1);
  return ((uint64_t (*)(OS_os_workgroup *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_workgroup_testcancel_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A066FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_activity_create_with_data_ptr = (uint64_t (*)())voucher_activity_create_with_data();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_activity_create_with_data_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_activity_create_with_data_2_ptr = (uint64_t (*)())voucher_activity_create_with_data_2();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_activity_create_with_data_2_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0670B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_activity_create_with_location_ptr = (uint64_t (*)())voucher_activity_create_with_location();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_activity_create_with_location_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06711C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_activity_flush_ptr = (uint64_t (*)())voucher_activity_flush();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_activity_flush_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_activity_get_logging_preferences_ptr = (uint64_t (*)())voucher_activity_get_logging_preferences();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_activity_get_logging_preferences_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0671E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_activity_get_metadata_buffer_ptr = (uint64_t (*)())voucher_activity_get_metadata_buffer();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_activity_get_metadata_buffer_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_activity_id_allocate_ptr = (uint64_t (*)())voucher_activity_id_allocate();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_activity_id_allocate_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0672AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_activity_initialize_4libtrace_ptr = (uint64_t (*)())voucher_activity_initialize_4libtrace();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_activity_initialize_4libtrace_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_activity_should_send_strings_ptr = (uint64_t (*)())voucher_activity_should_send_strings();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_activity_should_send_strings_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_activity_trace_ptr = (uint64_t (*)())voucher_activity_trace();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_activity_trace_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0673D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_activity_trace_v_ptr = (uint64_t (*)())voucher_activity_trace_v();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_activity_trace_v_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06743C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_activity_trace_v_2_ptr = (uint64_t (*)())voucher_activity_trace_v_2();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_activity_trace_v_2_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0674A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_adopt_ptr = (uint64_t (*)())voucher_adopt();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_adopt_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_copy_ptr = voucher_copy();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_copy_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_copy_without_importance_ptr = voucher_copy_without_importance();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_copy_without_importance_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0675CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_copy_with_persona_mach_voucher_ptr = (uint64_t (*)())voucher_copy_with_persona_mach_voucher();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_copy_with_persona_mach_voucher_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_create_with_mach_msg_ptr = (uint64_t (*)())voucher_create_with_mach_msg();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_create_with_mach_msg_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_decrement_importance_count4CF_ptr = (uint64_t (*)())voucher_decrement_importance_count4CF();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_decrement_importance_count4CF_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0676F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_get_activity_id_ptr = (uint64_t (*)())voucher_get_activity_id();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_get_activity_id_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A06775C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_get_activity_id_and_creator_ptr = (uint64_t (*)())voucher_get_activity_id_and_creator();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_get_activity_id_and_creator_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0677C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_get_current_persona_ptr = voucher_get_current_persona();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_get_current_persona_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_get_current_persona_originator_info_ptr = (uint64_t (*)())voucher_get_current_persona_originator_info();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_get_current_persona_originator_info_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_get_current_persona_proximate_info_ptr = (uint64_t (*)())voucher_get_current_persona_proximate_info();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_get_current_persona_proximate_info_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0678EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_kvoucher_debug_ptr = (uint64_t (*)())voucher_kvoucher_debug();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_kvoucher_debug_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_process_can_use_arbitrary_personas_ptr = voucher_process_can_use_arbitrary_personas();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_process_can_use_arbitrary_personas_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A0679B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_replace_default_voucher_ptr = (uint64_t (*)())voucher_replace_default_voucher();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_replace_default_voucher_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067A18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_release_ptr = (uint64_t (*)())voucher_release();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_release_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  voucher_retain_ptr = (uint64_t (*)())voucher_retain();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))voucher_retain_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067AE0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_assert_queue_V2(a1);
  dispatch_assert_queue_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067B44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_assert_queue_not_V2(a1);
  dispatch_assert_queue_not_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067BA8(NSObject *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_channel_async(a1, a2);
  dispatch_channel_async_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067C0C(NSObject *a1, void *a2, void (__cdecl *a3)(void *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_channel_async_f(a1, a2, a3);
  dispatch_channel_async_f_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, void *, void (__cdecl *)(void *), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067C70(const char *a1, NSObject *a2, NSObject *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_queue_create_with_target_ptr = (uint64_t (*)())dispatch_queue_create_with_target_V2(a1, a2, a3);
  return ((uint64_t (*)(const char *, NSObject *, NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_queue_create_with_target_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067CD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_source_cancel(a1);
  dispatch_channel_cancel_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067D38(NSObject *a1, dispatch_time_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  dispatch_source_set_timer(a1, a2, a3, a4);
  _dispatch_source_set_runloop_timer_4CF_ptr[0] = v8;
  return ((uint64_t (*)(NSObject *, dispatch_time_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_18A067D9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_channel_testcancel_ptr[0] = (uint64_t (*)())dispatch_source_testcancel(a1);
  return ((uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch_channel_testcancel_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

