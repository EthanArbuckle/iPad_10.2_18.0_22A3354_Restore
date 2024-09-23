@implementation CNComposeRecipient(CNContactFieldEntry)

- (id)wf_contactFieldEntry
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  id v28;
  NSObject *v29;
  _BYTE v31[24];
  void *v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(a1, "kind");
    objc_msgSend(a1, "valueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v7 = v5;
    if (v4 > 2)
      v8 = 0xFFFFFFFFLL;
    else
      v8 = dword_2268AB4F0[v4];
    CNContactPropertyKeyFromWFContactPropertyID();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isKeyAvailable:", v16))
    {
      objc_msgSend(v6, "valueForKey:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v31 = MEMORY[0x24BDAC760];
      *(_QWORD *)&v31[8] = 3221225472;
      *(_QWORD *)&v31[16] = __WFContactForSpecificHandle_block_invoke;
      v32 = &unk_24EE257E0;
      v33 = v7;
      v18 = objc_msgSend(v17, "indexOfObjectPassingTest:", v31);
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE193D0], "contactWithCNContact:propertyID:multivalueIndex:", v6, v8, v18, *(_QWORD *)v31, *(_QWORD *)&v31[8], *(_QWORD *)&v31[16], v32);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v12 = 0;
    }

    if (!v12)
    {
      v19 = (void *)MEMORY[0x24BE193D0];
      objc_msgSend(a1, "contact");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "contactWithCNContact:", v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    getWFWFContactFieldEntryLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v31 = 136315650;
      *(_QWORD *)&v31[4] = "-[CNComposeRecipient(CNContactFieldEntry) wf_contactFieldEntry]";
      *(_WORD *)&v31[12] = 2112;
      *(_QWORD *)&v31[14] = a1;
      *(_WORD *)&v31[22] = 2112;
      v32 = v12;
      _os_log_impl(&dword_226666000, v21, OS_LOG_TYPE_INFO, "%s Converting from CNComposeRecipient to WFContact: %@ -> %@", v31, 0x20u);
    }

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19418]), "initWithContact:", v12);
    goto LABEL_34;
  }
  v9 = objc_msgSend(a1, "kind");
  objc_msgSend(a1, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "controlCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v12, "length"))
  {
    getWFWFContactFieldEntryLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1, "address");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v31 = 136315650;
      *(_QWORD *)&v31[4] = "-[CNComposeRecipient(CNContactFieldEntry) wf_contactFieldEntry]";
      *(_WORD *)&v31[12] = 2112;
      *(_QWORD *)&v31[14] = a1;
      *(_WORD *)&v31[22] = 2112;
      v32 = v24;
      v25 = "%s Failed converting to WFContact from: %@ - reason: empty normalized address (source %@)";
      v26 = v23;
      v27 = OS_LOG_TYPE_INFO;
LABEL_32:
      _os_log_impl(&dword_226666000, v26, v27, v25, v31, 0x20u);

    }
LABEL_33:

    v22 = 0;
    goto LABEL_34;
  }
  switch(v9)
  {
    case 0:
      v28 = objc_alloc(MEMORY[0x24BE19418]);
      objc_msgSend(MEMORY[0x24BE194E8], "addressWithEmailAddress:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v28, "initWithEmailAddress:", v14);
      goto LABEL_24;
    case 2:
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19418]), "initWithCustomHandle:", v12);
      break;
    case 1:
      v13 = objc_alloc(MEMORY[0x24BE19418]);
      objc_msgSend(MEMORY[0x24BE195B0], "phoneNumberWithPhoneNumberString:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "initWithPhoneNumber:", v14);
LABEL_24:
      v22 = (void *)v15;

      break;
    default:
      v22 = 0;
      break;
  }
  getWFWFContactFieldEntryLogObject();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v31 = 136315650;
    *(_QWORD *)&v31[4] = "-[CNComposeRecipient(CNContactFieldEntry) wf_contactFieldEntry]";
    *(_WORD *)&v31[12] = 2112;
    *(_QWORD *)&v31[14] = a1;
    *(_WORD *)&v31[22] = 2112;
    v32 = v22;
    _os_log_impl(&dword_226666000, v29, OS_LOG_TYPE_INFO, "%s Converting from CNComposeRecipient to WFContactFieldEntry: %@ -> %@", v31, 0x20u);
  }

  if (!v22)
  {
    getWFWFContactFieldEntryLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "address");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v31 = 136315650;
      *(_QWORD *)&v31[4] = "-[CNComposeRecipient(CNContactFieldEntry) wf_contactFieldEntry]";
      *(_WORD *)&v31[12] = 2112;
      *(_QWORD *)&v31[14] = a1;
      *(_WORD *)&v31[22] = 2112;
      v32 = v24;
      v25 = "%s Failed converting to WFContact from: %@ - reason: no entry found for address: %@";
      v26 = v23;
      v27 = OS_LOG_TYPE_ERROR;
      goto LABEL_32;
    }
    goto LABEL_33;
  }
LABEL_34:

  return v22;
}

+ (WFContactComposeRecipient)wf_composeRecipientForContact:()CNContactFieldEntry
{
  id v3;
  WFContactComposeRecipient *v4;

  v3 = a3;
  v4 = -[WFContactComposeRecipient initWithWFContact:]([WFContactComposeRecipient alloc], "initWithWFContact:", v3);

  return v4;
}

@end
