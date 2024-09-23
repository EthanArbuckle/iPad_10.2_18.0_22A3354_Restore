@implementation ICInAppMessageEventEntry

- (ICInAppMessageEventEntry)initWithMessageIdentifier:(id)a3 params:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  ICInAppMessageEventEntry *v11;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICInAppMessageEventEntry initWithMessageIdentifier:params:eventIdentifier:](self, "initWithMessageIdentifier:params:eventIdentifier:", v8, v7, v10);

  return v11;
}

- (ICInAppMessageEventEntry)initWithMessageIdentifier:(id)a3 params:(id)a4 eventIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICInAppMessageEventEntry *v11;
  uint64_t v12;
  NSString *messageIdentifier;
  uint64_t v14;
  NSDictionary *params;
  uint64_t v16;
  NSString *eventIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICInAppMessageEventEntry;
  v11 = -[ICInAppMessageEventEntry init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    messageIdentifier = v11->_messageIdentifier;
    v11->_messageIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    params = v11->_params;
    v11->_params = (NSDictionary *)v14;

    v16 = objc_msgSend(v10, "copy");
    eventIdentifier = v11->_eventIdentifier;
    v11->_eventIdentifier = (NSString *)v16;

  }
  return v11;
}

- (ICInAppMessageEventEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ICInAppMessageEventEntry *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("params"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ICInAppMessageEventEntry initWithMessageIdentifier:params:eventIdentifier:](self, "initWithMessageIdentifier:params:eventIdentifier:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *messageIdentifier;
  id v5;

  messageIdentifier = self->_messageIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", messageIdentifier, CFSTR("messageID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_params, CFSTR("params"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventIdentifier, CFSTR("eventID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  ICInAppMessageEventEntry *v8;

  v5 = (void *)-[NSString copyWithZone:](self->_messageIdentifier, "copyWithZone:");
  v6 = (void *)-[NSString copyWithZone:](self->_eventIdentifier, "copyWithZone:", a3);
  v7 = (void *)-[NSDictionary copyWithZone:](self->_params, "copyWithZone:", a3);
  v8 = -[ICInAppMessageEventEntry initWithMessageIdentifier:params:eventIdentifier:](+[ICInAppMessageEventEntry allocWithZone:](ICInAppMessageEventEntry, "allocWithZone:", a3), "initWithMessageIdentifier:params:eventIdentifier:", v5, v7, v6);

  return v8;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (NSDictionary)params
{
  return self->_params;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
