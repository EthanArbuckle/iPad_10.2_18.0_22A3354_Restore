@implementation ISDialog(SUDialogAdditions)

+ (id)ITunesStoreNotAvailableDialog
{
  id v1;

  v1 = objc_alloc_init(a1);
  objc_msgSend(v1, "setButtons:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", objc_msgSend(MEMORY[0x24BEC8B98], "buttonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24DE83F60, 0))));
  objc_msgSend(v1, "setMessage:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "localizedStringForKey:value:table:", CFSTR("NO_STORE_SUPPORTED_ALERT_BODY"), &stru_24DE83F60, 0));
  objc_msgSend(v1, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "localizedStringForKey:value:table:", CFSTR("NO_STORE_SUPPORTED_ALERT_TITLE"), &stru_24DE83F60, 0));
  return v1;
}

@end
