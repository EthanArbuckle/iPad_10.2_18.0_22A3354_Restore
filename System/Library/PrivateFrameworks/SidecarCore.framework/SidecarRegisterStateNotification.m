@implementation SidecarRegisterStateNotification

void __SidecarRegisterStateNotification_block_invoke(uint64_t a1)
{
  uid_t v2;
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD handler[6];

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = getuid();
    asprintf((char **)(a1 + 40), "user.uid.%d.%s", v2, *(const char **)(a1 + 40));
  }
  v3 = *(const char **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __SidecarRegisterStateNotification_block_invoke_2;
  handler[3] = &unk_24E5E12F8;
  handler[4] = *(_QWORD *)(a1 + 32);
  handler[5] = v4;
  notify_register_dispatch(v3, (int *)(v4 + 16), v5, handler);

  if (*(_BYTE *)(a1 + 56))
    free(*(void **)(a1 + 40));
  SidecarUpdateStateNotification(*(_QWORD *)(a1 + 48), 0);
}

void __SidecarRegisterStateNotification_block_invoke_2(uint64_t a1)
{
  SidecarUpdateStateNotification(*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
}

@end
