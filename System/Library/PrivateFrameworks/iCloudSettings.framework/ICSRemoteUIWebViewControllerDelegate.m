@implementation ICSRemoteUIWebViewControllerDelegate

- (void)remoteUIWebViewController:(id)a3 dismissWithPayload:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _OWORD v11[2];

  if (a4)
  {
    v5 = a3;
    swift_retain();
    swift_unknownObjectRetain();
    sub_24B5E4638();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v6 = a3;
    swift_retain();
  }
  if (qword_2544D8D50 != -1)
    swift_once();
  v7 = sub_24B5E32C4();
  __swift_project_value_buffer(v7, (uint64_t)qword_2544D8DC8);
  v8 = sub_24B5E32AC();
  v9 = sub_24B5E453C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_24B4C1000, v8, v9, "ICSRemoteUIWebViewControllerDelegate dismissing", v10, 2u);
    MEMORY[0x24BD23834](v10, -1, -1);
  }

  sub_24B5E35E8();
  swift_release();
  sub_24B511914((uint64_t)v11, &qword_2544D8DB0);
}

@end
