@implementation WFContactComposeRecipient

- (WFContactComposeRecipient)initWithWFContact:(id)a3
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  WFContactComposeRecipient *v31;
  WFContactComposeRecipient *v32;
  WFContactComposeRecipient *v33;
  objc_super v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = objc_msgSend(v6, "propertyID");
    v8 = objc_msgSend(v6, "multivalueIndex");
    if (v7 == -1 || v8 == -1)
    {
      objc_msgSend(v6, "contact");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isKeyAvailable:", *MEMORY[0x24BDBA348]);

      if (!v17)
      {
        objc_msgSend(v6, "contact");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isKeyAvailable:", *MEMORY[0x24BDBA288]);

        if (!v22)
        {
          getWFWFContactComposeRecipientLogObject();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v37 = "WFCNContactRepresentedHandle";
            _os_log_impl(&dword_226666000, v29, OS_LOG_TYPE_ERROR, "%s Invalid recipient contact found. Contact doesn't have required contact information and the proceess is not authorized to access contact database", buf, 0xCu);
          }

          goto LABEL_25;
        }
LABEL_20:
        objc_msgSend(v6, "emailAddresses");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "value");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "address");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = 0;
        goto LABEL_26;
      }
    }
    else if (v7 != 3)
    {
      if (v7 == 13)
      {
        objc_msgSend(v6, "instantMessageAddresses");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "value");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "username");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = 2;
        goto LABEL_26;
      }
      if (v7 != 4)
      {
LABEL_25:
        v14 = 0;
        v13 = 5;
LABEL_26:

        objc_msgSend(v6, "contact");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          goto LABEL_28;
        goto LABEL_27;
      }
      goto LABEL_20;
    }
    objc_msgSend(v6, "phoneNumbers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 1;
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = 0;
LABEL_27:
    v14 = 0;
    v13 = 5;
    goto LABEL_28;
  }
  objc_msgSend(v5, "person");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "type");
  v12 = 5;
  if (v11 == 2)
    v12 = 1;
  if (v11 == 1)
    v13 = 0;
  else
    v13 = v12;
  objc_msgSend(v10, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if (!v14)
    goto LABEL_27;
LABEL_28:
  getWFWFContactComposeRecipientLogObject();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v37 = "-[WFContactComposeRecipient initWithWFContact:]";
    v38 = 2112;
    v39 = v5;
    v40 = 2112;
    v41 = v14;
    _os_log_impl(&dword_226666000, v30, OS_LOG_TYPE_INFO, "%s Initializing with contact %@; identified handle %@",
      buf,
      0x20u);
  }

  v35.receiver = self;
  v35.super_class = (Class)WFContactComposeRecipient;
  v31 = -[WFContactComposeRecipient initWithContact:address:kind:](&v35, sel_initWithContact_address_kind_, v15, v14, v13);
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_wfContact, a3);
    v33 = v32;
  }

  return v32;
}

- (id)displayString
{
  void *v2;
  void *v3;

  -[WFContactComposeRecipient wfContact](self, "wfContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wfName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)wf_contactFieldEntry
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  getWFWFContactComposeRecipientLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[WFContactComposeRecipient wfContact](self, "wfContact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[WFContactComposeRecipient wf_contactFieldEntry]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_226666000, v3, OS_LOG_TYPE_INFO, "%s Returning underlying contact: %@", (uint8_t *)&v9, 0x16u);

  }
  v5 = objc_alloc(MEMORY[0x24BE19418]);
  -[WFContactComposeRecipient wfContact](self, "wfContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithContact:", v6);

  return v7;
}

- (WFContact)wfContact
{
  return self->_wfContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wfContact, 0);
}

@end
