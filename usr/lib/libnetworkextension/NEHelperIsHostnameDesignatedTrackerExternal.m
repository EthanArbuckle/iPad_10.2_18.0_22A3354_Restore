@implementation NEHelperIsHostnameDesignatedTrackerExternal

CFMutableDictionaryRef __NEHelperIsHostnameDesignatedTrackerExternal_block_invoke()
{
  pid_t v0;
  xpc_object_t v1;
  void *v2;
  NSObject *v3;
  const char *string_ptr;
  NSObject *v5;
  CFMutableDictionaryRef result;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v0 = getpid();
  v1 = ne_copy_signing_identifier_for_pid_with_audit_token(v0, 0);
  if (v1 && (v2 = v1, MEMORY[0x20BD087A4]() == MEMORY[0x24BDACFF0]))
  {
    string_ptr = xpc_string_get_string_ptr(v2);
    if (string_ptr)
    {
      NEHelperIsHostnameDesignatedTrackerExternal_skip_daemon = strcmp(string_ptr, "com.apple.cloudd") == 0;
    }
    else
    {
      v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v7[0]) = 0;
        _os_log_error_impl(&dword_208439000, v5, OS_LOG_TYPE_ERROR, "Failed to get a string pointer from the current signing identifier", (uint8_t *)v7, 2u);
      }
    }
    xpc_release(v2);
  }
  else
  {
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = getpid();
      _os_log_error_impl(&dword_208439000, v3, OS_LOG_TYPE_ERROR, "Failed to get the signing identifier for %d", (uint8_t *)v7, 8u);
    }
  }
  g_tracker_cache = 128;
  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 128, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  qword_253D8F590 = 0;
  unk_253D8F580 = result;
  unk_253D8F588 = 0;
  qword_253D8F598 = (uint64_t)&qword_253D8F590;
  return result;
}

@end
