@implementation ICSCDPWebAccessStatusUpdateHook

- (id)changeControllerForAction:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("webaccess:enable")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("webaccess:disable")))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = 2;
  }
  objc_msgSend(MEMORY[0x24BE1AA30], "controllerWithTargetWebAccessStatus:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v5;
}

@end
