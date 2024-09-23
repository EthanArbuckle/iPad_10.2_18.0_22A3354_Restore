@implementation _ICQUpgradeCompletePageSpecification

+ (id)upgradeCompletePageSpecificationSampleForLevel:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTitle:", CFSTR("Storage Upgraded"));
  objc_msgSend(v3, "setMessage:", CFSTR("You now have 50 GB of total storage.\niCloud will continue to backup your iPhone and keep your photos, documents, contacts and more up to date across all your devices.\n[ENG: LOCAL SAMPLE UI]"));
  +[ICQLink linkWithText:action:parameters:](ICQLink, "linkWithText:action:parameters:", CFSTR("Done"), 5, MEMORY[0x1E0C9AA70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDoneLink:", v4);

  return v3;
}

- (id)pageIdentifier
{
  return CFSTR("ICQUpgradeComplete");
}

- (BOOL)hasCancelButtonForBack
{
  return 0;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (ICQLink)doneLink
{
  return self->_doneLink;
}

- (void)setDoneLink:(id)a3
{
  objc_storeStrong((id *)&self->_doneLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneLink, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
