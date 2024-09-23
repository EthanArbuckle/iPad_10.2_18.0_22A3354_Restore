@implementation WFContactFieldEntry(CNComposeRecipient)

- (id)composeRecipient
{
  id v1;
  WFContactComposeRecipient *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  switch(objc_msgSend(v1, "type"))
  {
    case 0:
      v2 = [WFContactComposeRecipient alloc];
      objc_msgSend(v1, "contact");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[WFContactComposeRecipient initWithWFContact:](v2, "initWithWFContact:", v3);
      goto LABEL_8;
    case 1:
      v6 = objc_alloc(MEMORY[0x24BE19158]);
      objc_msgSend(v1, "phoneNumber");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = 1;
      goto LABEL_6;
    case 2:
      v11 = objc_alloc(MEMORY[0x24BE19158]);
      objc_msgSend(v1, "emailAddress");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "address");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      v9 = v7;
      v10 = 0;
LABEL_6:
      v5 = (void *)objc_msgSend(v8, "initWithContact:address:kind:", 0, v9, v10);

      goto LABEL_9;
    case 3:
      v12 = objc_alloc(MEMORY[0x24BE19158]);
      objc_msgSend(v1, "customHandle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v12, "initWithContact:address:kind:", 0, v3, 2);
LABEL_8:
      v5 = (void *)v4;
LABEL_9:

      break;
    default:
      v5 = 0;
      break;
  }

  getWFWFContactFieldEntryLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = 136315650;
    v16 = "-[WFContactFieldEntry(CNComposeRecipient) composeRecipient]";
    v17 = 2112;
    v18 = v1;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_226666000, v13, OS_LOG_TYPE_INFO, "%s Converting from WFContactFieldEntry to CNComposeRecipient: %@ -> %@", (uint8_t *)&v15, 0x20u);
  }

  return v5;
}

@end
