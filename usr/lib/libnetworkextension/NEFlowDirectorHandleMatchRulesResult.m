@implementation NEFlowDirectorHandleMatchRulesResult

void __NEFlowDirectorHandleMatchRulesResult_block_invoke(uint64_t a1)
{
  os_unfair_lock_s *node;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  const void *v5;
  const __CFString *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  os_unfair_lock_s *v10;
  NSObject *v11;
  uint32_t os_unfair_lock_opaque;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  _DWORD v17[2];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  node = (os_unfair_lock_s *)rb_tree_find_node((rb_tree_t *)(*(_QWORD *)(a1 + 32) + 56), (const void *)(a1 + 48));
  if (node)
  {
    v3 = node;
    v4 = node + 30;
    os_unfair_lock_lock(node + 30);
    v5 = *(const void **)(a1 + 40);
    if (!v5)
    {
      v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        os_unfair_lock_opaque = v3[6]._os_unfair_lock_opaque;
        v17[0] = 67109378;
        v17[1] = os_unfair_lock_opaque;
        v18 = 2080;
        v19 = "Failed validation, aborting";
        _os_log_error_impl(&dword_208439000, v11, OS_LOG_TYPE_ERROR, "(%u): %s", (uint8_t *)v17, 0x12u);
      }
      goto LABEL_22;
    }
    *(_QWORD *)&v3[18]._os_unfair_lock_opaque = CFRetain(v5);
    v6 = *(const __CFString **)&v3[92]._os_unfair_lock_opaque;
    if (v6)
    {
      if (CFStringCompare(v6, *(CFStringRef *)(a1 + 40), 0) == kCFCompareEqualTo)
      {
        v13 = *(const void **)&v3[20]._os_unfair_lock_opaque;
        if (v13)
          CFRelease(v13);
        *(_QWORD *)&v3[20]._os_unfair_lock_opaque = *(_QWORD *)&v3[92]._os_unfair_lock_opaque;
        *(_QWORD *)&v3[92]._os_unfair_lock_opaque = 0;
        v14 = *(const void **)&v3[22]._os_unfair_lock_opaque;
        if (v14)
          CFRelease(v14);
        *(_QWORD *)&v3[22]._os_unfair_lock_opaque = *(_QWORD *)&v3[94]._os_unfair_lock_opaque;
        *(_QWORD *)&v3[94]._os_unfair_lock_opaque = 0;
        v15 = *(const void **)&v3[90]._os_unfair_lock_opaque;
        if (v15)
          CFRelease(v15);
        v10 = v3 + 96;
        *(_QWORD *)&v3[90]._os_unfair_lock_opaque = *(_QWORD *)&v3[96]._os_unfair_lock_opaque;
        goto LABEL_20;
      }
      v7 = *(const void **)&v3[92]._os_unfair_lock_opaque;
      if (v7)
      {
        CFRelease(v7);
        *(_QWORD *)&v3[92]._os_unfair_lock_opaque = 0;
      }
    }
    v8 = *(const void **)&v3[94]._os_unfair_lock_opaque;
    if (v8)
    {
      CFRelease(v8);
      *(_QWORD *)&v3[94]._os_unfair_lock_opaque = 0;
    }
    v9 = *(const void **)&v3[96]._os_unfair_lock_opaque;
    if (!v9)
      goto LABEL_21;
    v10 = v3 + 96;
    CFRelease(v9);
LABEL_20:
    *(_QWORD *)&v10->_os_unfair_lock_opaque = 0;
LABEL_21:
    v3[25]._os_unfair_lock_opaque |= 0x20u;
LABEL_22:
    flow_startup(v3, *(_QWORD *)(a1 + 32), (v3[25]._os_unfair_lock_opaque & 0x20) == 0);
    os_unfair_lock_unlock(v4);
    v16 = *(const void **)(a1 + 40);
    if (v16)
      CFRelease(v16);
  }
}

@end
