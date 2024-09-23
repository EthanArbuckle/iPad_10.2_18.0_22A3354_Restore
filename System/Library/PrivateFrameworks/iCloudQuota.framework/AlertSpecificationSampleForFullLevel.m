@implementation AlertSpecificationSampleForFullLevel

void __AlertSpecificationSampleForFullLevel_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setTitle:", CFSTR("iCloud Storage is Full"));
  objc_msgSend(v0, "setMessage:", CFSTR("iCloud Photo Library, iCloud Mail, and Backup are no longer updating. Add more storage to keep using iCloud.\n[ENG: LOCAL SAMPLE UI]"));
  v1 = MEMORY[0x1E0C9AA70];
  +[ICQLink linkWithText:action:parameters:](ICQLink, "linkWithText:action:parameters:", CFSTR("Add iCloud Storage"), 3, MEMORY[0x1E0C9AA70]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[ICQLink linkWithText:action:parameters:](ICQLink, "linkWithText:action:parameters:", CFSTR("Manage Storage"), 100, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQLink linkWithText:action:parameters:](ICQLink, "linkWithText:action:parameters:", CFSTR("Not Now"), 2, v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLink:forButtonIndex:", v5, 1);
  objc_msgSend(v0, "setLink:forButtonIndex:", v2, 2);
  objc_msgSend(v0, "setLink:forButtonIndex:", v3, 3);
  objc_msgSend(v0, "setDefaultButtonIndex:", 1);
  v4 = (void *)AlertSpecificationSampleForFullLevel_sAlertSpecification;
  AlertSpecificationSampleForFullLevel_sAlertSpecification = (uint64_t)v0;

}

@end
