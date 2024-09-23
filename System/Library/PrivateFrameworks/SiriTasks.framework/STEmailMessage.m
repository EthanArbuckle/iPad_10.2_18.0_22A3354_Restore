@implementation STEmailMessage

- (id)_aceContextObjectValue
{
  id v3;
  unint64_t type;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE81250]);
  objc_msgSend(v3, "setMessage:", self->_messageBody);
  objc_msgSend(v3, "setSubject:", self->_subject);
  type = self->_type;
  if (type > 3)
    v5 = 0;
  else
    v5 = **((id **)&unk_24DB76828 + type);
  objc_msgSend(v3, "setType:", v5);
  objc_msgSend(v3, "setIdentifier:", self->_messageIdentifier);
  objc_msgSend(v3, "setReceivingAddresses:", self->_receivingAddresses);
  -[STEmailMessage _personAttributesForRecipients:](self, "_personAttributesForRecipients:", self->_toRecipients);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRecipientsTo:", v6);

  -[STEmailMessage _personAttributesForRecipients:](self, "_personAttributesForRecipients:", self->_ccRecipients);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRecipientsCc:", v7);

  -[STEmailMessage _personAttributesForRecipients:](self, "_personAttributesForRecipients:", self->_bccRecipients);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRecipientsBcc:", v8);

  if (self->_sender)
  {
    v13[0] = self->_sender;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STEmailMessage _personAttributesForRecipients:](self, "_personAttributesForRecipients:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFromEmail:", v11);

  }
  return v3;
}

- (id)_personAttributesForRecipients:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v3;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v6 = objc_alloc_init(MEMORY[0x24BE814B0]);
        v7 = objc_alloc_init(MEMORY[0x24BE814A8]);
        objc_msgSend(v5, "fullName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v7;
        objc_msgSend(v7, "setFullName:", v8);

        objc_msgSend(v5, "fullName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v6;
        objc_msgSend(v6, "setDisplayText:", v9);

        v10 = (void *)MEMORY[0x24BDBCEB8];
        objc_msgSend(v5, "contactHandles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v5, "contactHandles");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v32 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
              if (!objc_msgSend(v18, "type"))
              {
                v19 = objc_alloc_init(MEMORY[0x24BE81248]);
                objc_msgSend(v18, "handle");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setEmailAddress:", v20);

                objc_msgSend(v18, "label");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setLabel:", v21);

                if (v19)
                  objc_msgSend(v12, "addObject:", v19);

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v15);
        }

        objc_msgSend(v29, "setEmails:", v12);
        objc_msgSend(v12, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "emailAddress");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setData:", v23);

        objc_msgSend(v30, "setObject:", v29);
        if (v30)
          objc_msgSend(v26, "addObject:", v30);

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v28);
  }

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STEmailMessage;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_messageBody, CFSTR("_messageBody"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_subject, CFSTR("_subject"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_messageIdentifier, CFSTR("_messageIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sender, CFSTR("_sender"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_toRecipients, CFSTR("_toRecipients"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_ccRecipients, CFSTR("_ccRecipients"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bccRecipients, CFSTR("_bccRecipients"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_receivingAddresses, CFSTR("_receivingAddresses"));

}

- (STEmailMessage)initWithCoder:(id)a3
{
  id v4;
  STEmailMessage *v5;
  uint64_t v6;
  NSString *messageBody;
  uint64_t v8;
  NSString *subject;
  uint64_t v10;
  NSURL *messageIdentifier;
  uint64_t v12;
  STPerson *sender;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *toRecipients;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *ccRecipients;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *bccRecipients;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *receivingAddresses;
  objc_super v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)STEmailMessage;
  v5 = -[STSiriModelObject initWithCoder:](&v35, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_messageBody"));
    v6 = objc_claimAutoreleasedReturnValue();
    messageBody = v5->_messageBody;
    v5->_messageBody = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_subject"));
    v8 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_messageIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    messageIdentifier = v5->_messageIdentifier;
    v5->_messageIdentifier = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sender"));
    v12 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (STPerson *)v12;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    v14 = (void *)MEMORY[0x24BDBCF20];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_toRecipients"));
    v17 = objc_claimAutoreleasedReturnValue();
    toRecipients = v5->_toRecipients;
    v5->_toRecipients = (NSArray *)v17;

    v19 = (void *)MEMORY[0x24BDBCF20];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("_ccRecipients"));
    v22 = objc_claimAutoreleasedReturnValue();
    ccRecipients = v5->_ccRecipients;
    v5->_ccRecipients = (NSArray *)v22;

    v24 = (void *)MEMORY[0x24BDBCF20];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("_bccRecipients"));
    v27 = objc_claimAutoreleasedReturnValue();
    bccRecipients = v5->_bccRecipients;
    v5->_bccRecipients = (NSArray *)v27;

    v29 = (void *)MEMORY[0x24BDBCF20];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setWithArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("_receivingAddresses"));
    v32 = objc_claimAutoreleasedReturnValue();
    receivingAddresses = v5->_receivingAddresses;
    v5->_receivingAddresses = (NSArray *)v32;

  }
  return v5;
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (void)setMessageBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_messageIdentifier, a3);
}

- (STPerson)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (void)setToRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_toRecipients, a3);
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (void)setCcRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_ccRecipients, a3);
}

- (NSArray)bccRecipients
{
  return self->_bccRecipients;
}

- (void)setBccRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_bccRecipients, a3);
}

- (NSArray)receivingAddresses
{
  return self->_receivingAddresses;
}

- (void)setReceivingAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_receivingAddresses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivingAddresses, 0);
  objc_storeStrong((id *)&self->_bccRecipients, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);
  objc_storeStrong((id *)&self->_toRecipients, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
