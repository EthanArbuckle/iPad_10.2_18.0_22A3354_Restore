@implementation TUCall(TCSClientServer)

- (void)tc_setUseUnderlyingRemoteUplinkMuted:()TCSClientServer
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_tc_useUnderlyingRemoteUplinkMuted, v2, (void *)3);

}

- (uint64_t)tc_useUnderlyingRemoteUplinkMuted
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_tc_useUnderlyingRemoteUplinkMuted);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
