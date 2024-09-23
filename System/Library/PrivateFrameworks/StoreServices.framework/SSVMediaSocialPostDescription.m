@implementation SSVMediaSocialPostDescription

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAccountIdentifier:", self->_accountIdentifier);
  objc_msgSend(v4, "setAttachments:", self->_attachments);
  objc_msgSend(v4, "setAttributed:", self->_attributed);
  objc_msgSend(v4, "setAuthorIdentifier:", self->_authorIdentifier);
  objc_msgSend(v4, "setAuthorType:", self->_authorType);
  objc_msgSend(v4, "setContentItems:", self->_contentItems);
  objc_msgSend(v4, "setExternalServiceDestinations:", self->_externalServiceDestinations);
  objc_msgSend(v4, "setSourceApplicationIdentifier:", self->_sourceApplicationIdentifier);
  objc_msgSend(v4, "setText:", self->_text);
  return v4;
}

- (SSVMediaSocialPostDescription)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVMediaSocialPostDescription *v6;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSArray *attachments;
  CFArrayRef v13;
  NSNumber *accountIdentifier;
  CFArrayRef v15;
  NSString *authorIdentifier;
  CFArrayRef v17;
  NSString *authorType;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  NSArray *contentItems;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *externalServiceDestinations;
  CFArrayRef v28;
  NSString *sourceApplicationIdentifier;
  CFArrayRef v30;
  NSString *text;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v6 = -[SSVMediaSocialPostDescription init](self, "init");
    if (!v6)
      goto LABEL_5;
    xpc_dictionary_get_value(v5, "1");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    v10 = SSXPCCreateNSArrayFromXPCEncodedArray(v8, v9);

    v11 = objc_msgSend(v10, "copy");
    attachments = v6->_attachments;
    v6->_attachments = (NSArray *)v11;

    v6->_attributed = xpc_dictionary_get_BOOL(v5, "8");
    objc_opt_class();
    v13 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
    accountIdentifier = v6->_accountIdentifier;
    v6->_accountIdentifier = (NSNumber *)v13;

    objc_opt_class();
    v15 = SSXPCDictionaryCopyCFObjectWithClass(v5, "2");
    authorIdentifier = v6->_authorIdentifier;
    v6->_authorIdentifier = (NSString *)v15;

    objc_opt_class();
    v17 = SSXPCDictionaryCopyCFObjectWithClass(v5, "3");
    authorType = v6->_authorType;
    v6->_authorType = (NSString *)v17;

    xpc_dictionary_get_value(v5, "4");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_class();
    v21 = SSXPCCreateNSArrayFromXPCEncodedArray(v19, v20);

    v22 = objc_msgSend(v21, "copy");
    contentItems = v6->_contentItems;
    v6->_contentItems = (NSArray *)v22;

    xpc_dictionary_get_value(v5, "5");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_class();
    self = (SSVMediaSocialPostDescription *)SSXPCCreateNSArrayFromXPCEncodedArray(v24, v25);

    v26 = -[SSVMediaSocialPostDescription copy](self, "copy");
    externalServiceDestinations = v6->_externalServiceDestinations;
    v6->_externalServiceDestinations = (NSArray *)v26;

    objc_opt_class();
    v28 = SSXPCDictionaryCopyCFObjectWithClass(v5, "6");
    sourceApplicationIdentifier = v6->_sourceApplicationIdentifier;
    v6->_sourceApplicationIdentifier = (NSString *)v28;

    objc_opt_class();
    v30 = SSXPCDictionaryCopyCFObjectWithClass(v5, "7");
    text = v6->_text;
    v6->_text = (NSString *)v30;

  }
  else
  {
    v6 = 0;
  }

LABEL_5:
  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_accountIdentifier);
  SSXPCDictionarySetObject(v3, "1", self->_attachments);
  xpc_dictionary_set_BOOL(v3, "8", self->_attributed);
  SSXPCDictionarySetObject(v3, "2", self->_authorIdentifier);
  SSXPCDictionarySetObject(v3, "3", self->_authorType);
  SSXPCDictionarySetObject(v3, "4", self->_contentItems);
  SSXPCDictionarySetObject(v3, "5", self->_externalServiceDestinations);
  SSXPCDictionarySetObject(v3, "6", self->_sourceApplicationIdentifier);
  SSXPCDictionarySetObject(v3, "7", self->_text);
  return v3;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isAttributed
{
  return self->_attributed;
}

- (void)setAttributed:(BOOL)a3
{
  self->_attributed = a3;
}

- (NSString)authorIdentifier
{
  return self->_authorIdentifier;
}

- (void)setAuthorIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)authorType
{
  return self->_authorType;
}

- (void)setAuthorType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (void)setContentItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)externalServiceDestinations
{
  return self->_externalServiceDestinations;
}

- (void)setExternalServiceDestinations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)sourceApplicationIdentifier
{
  return self->_sourceApplicationIdentifier;
}

- (void)setSourceApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_sourceApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_externalServiceDestinations, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_authorType, 0);
  objc_storeStrong((id *)&self->_authorIdentifier, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
