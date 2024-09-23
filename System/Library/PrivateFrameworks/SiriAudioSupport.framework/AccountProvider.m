@implementation AccountProvider

- (uint64_t)handleActiveAccountDidChangeNotificationWithNotification:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_2297DCB54();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58C08 != -1)
    swift_once();
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_2297DCB3C();
  v6 = sub_2297DD160();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_22960C000, v5, v6, "AccountProvider#handleActiveAccountDidChangeNotification clearing the account cache", v7, 2u);
    MEMORY[0x22E2D0294](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_255A58A10 != -1)
    swift_once();
  return (*(uint64_t (**)(void))(*(_QWORD *)off_255A5AE20 + 200))();
}

@end
