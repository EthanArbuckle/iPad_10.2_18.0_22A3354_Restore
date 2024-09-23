@implementation PKSharingMessageExtensionRelayServerMessage

- (PKSharingMessageExtensionRelayServerMessage)init
{
  PKSharingMessageExtensionRelayServerMessage *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKSharingMessageExtensionRelayServerMessage;
  v2 = -[PKSharingMessageExtensionCommonMessage init](&v8, sel_init);
  if (v2)
  {
    v3 = PKSharingUseCommonIMessageExtensionPayloadFormat();
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Using common imessage extension payload format.", v7, 2u);
      }

      v2->_useLegacyMessageFormat = 0;
      -[PKSharingMessageExtensionCommonMessage setMessageType:](v2, "setMessageType:", CFSTR("pkrelayservermessage"));
    }
    else
    {
      if (v5)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Using legacy imessage extension payload format.", v7, 2u);
      }

    }
  }
  return v2;
}

- (id)_initWithCommonMessage:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  void *v18;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKSharingMessageExtensionRelayServerMessage;
  v7 = -[PKSharingMessageExtensionCommonMessage _initWithCommonMessage:url:](&v19, sel__initWithCommonMessage_url_, a3, v6);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "messageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (objc_msgSend(v8, "_messageDataWithDataURL:", v6), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67518]), "initWithData:", v9);
      v11 = (void *)*((_QWORD *)v8 + 3);
      *((_QWORD *)v8 + 3) = v10;

    }
    else
    {
      v17 = objc_alloc_init(MEMORY[0x1E0D67518]);
      v18 = (void *)*((_QWORD *)v8 + 3);
      *((_QWORD *)v8 + 3) = v17;

      objc_msgSend(*((id *)v8 + 3), "setVersion:", 1);
    }
    objc_msgSend(v8, "messageType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v8 + 32) = v12 == 0;

    if (*((_BYTE *)v8 + 32))
    {
      objc_msgSend(v8, "setMessageType:", CFSTR("pkrelayservermessage"));
      objc_msgSend(*((id *)v8 + 3), "thumbnailImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRawThumbnailData:", v13);

      objc_msgSend(*((id *)v8 + 3), "setThumbnailImage:", 0);
      objc_msgSend(*((id *)v8 + 3), "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v14);

      objc_msgSend(*((id *)v8 + 3), "setTitle:", 0);
      objc_msgSend(*((id *)v8 + 3), "subtitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSubtitle:", v15);

      objc_msgSend(*((id *)v8 + 3), "setSubtitle:", 0);
    }
  }

  return v8;
}

- (id)urlRepresentation
{
  NSURL *overrideURL;
  NSURL *v3;
  _BOOL4 useLegacyMessageFormat;
  PKProtobufRelaySharingMessage *message;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  overrideURL = self->_overrideURL;
  if (overrideURL)
  {
    v3 = overrideURL;
    return v3;
  }
  useLegacyMessageFormat = self->_useLegacyMessageFormat;
  message = self->_message;
  if (!useLegacyMessageFormat)
  {
    -[PKProtobufRelaySharingMessage data](message, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharingMessageExtensionCommonMessage setMessageData:](self, "setMessageData:", v14);

    v15.receiver = self;
    v15.super_class = (Class)PKSharingMessageExtensionRelayServerMessage;
    -[PKSharingMessageExtensionCommonMessage urlRepresentation](&v15, sel_urlRepresentation);
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v8 = (void *)-[PKProtobufRelaySharingMessage copy](message, "copy");
  -[PKSharingMessageExtensionCommonMessage rawThumbnailData](self, "rawThumbnailData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setThumbnailImage:", v9);

  -[PKSharingMessageExtensionCommonMessage title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v10);

  -[PKSharingMessageExtensionCommonMessage subtitle](self, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSubtitle:", v11);

  objc_msgSend(v8, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionRelayServerMessage _messageDataURLWithData:](self, "_messageDataURLWithData:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)status
{
  void *v2;
  unint64_t v3;

  -[PKProtobufRelaySharingMessage status](self->_message, "status");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKShareStatusFromString();

  return v3;
}

- (void)setStatus:(unint64_t)a3
{
  PKProtobufRelaySharingMessage *message;
  id v4;

  message = self->_message;
  PKShareStatusToString();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRelaySharingMessage setStatus:](message, "setStatus:", v4);

}

- (NSURL)phoneMailboxURL
{
  void *v3;
  void *v4;
  void *v5;

  if (-[PKProtobufRelaySharingMessage mailboxURLsCount](self->_message, "mailboxURLsCount"))
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    -[PKProtobufRelaySharingMessage mailboxURLsAtIndex:](self->_message, "mailboxURLsAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSURL *)v5;
}

- (NSURL)watchMailboxURL
{
  void *v3;
  void *v4;
  void *v5;

  if ((unint64_t)-[PKProtobufRelaySharingMessage mailboxURLsCount](self->_message, "mailboxURLsCount") < 2)
  {
    v5 = 0;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    -[PKProtobufRelaySharingMessage mailboxURLsAtIndex:](self->_message, "mailboxURLsAtIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v5;
}

- (void)setMailboxURLS:(id)a3
{
  PKProtobufRelaySharingMessage *message;
  void *v4;
  id v5;

  message = self->_message;
  objc_msgSend(a3, "pk_arrayByApplyingBlock:", &__block_literal_global_205);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v5, "mutableCopy");
  -[PKProtobufRelaySharingMessage setMailboxURLs:](message, "setMailboxURLs:", v4);

}

uint64_t __62__PKSharingMessageExtensionRelayServerMessage_setMailboxURLS___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "absoluteString");
}

- (PKSharingMessageExtensionRelayServerLocalProperties)localProperties
{
  void *v2;
  void *v3;

  -[PKProtobufRelaySharingMessage localData](self->_message, "localData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (PKSharingMessageExtensionRelayServerLocalProperties *)v3;
}

- (void)setLocalProperties:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRelaySharingMessage setLocalData:](self->_message, "setLocalData:", v4);

}

- (NSString)provisioningCredentialHash
{
  return (NSString *)-[PKProtobufRelaySharingMessage provisioningCredentialHash](self->_message, "provisioningCredentialHash");
}

- (void)setProvisioningCredentialHash:(id)a3
{
  -[PKProtobufRelaySharingMessage setProvisioningCredentialHash:](self->_message, "setProvisioningCredentialHash:", a3);
}

- (NSString)carKeyReaderIdentifier
{
  return (NSString *)-[PKProtobufRelaySharingMessage carKeyReaderIdentifier](self->_message, "carKeyReaderIdentifier");
}

- (void)setCarKeyReaderIdentifier:(id)a3
{
  -[PKProtobufRelaySharingMessage setCarKeyReaderIdentifier:](self->_message, "setCarKeyReaderIdentifier:", a3);
}

- (id)_messageDataURLWithData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(CFSTR("data:application/vnd.apple.pkrelayservermessage;base64,"), "stringByAppendingString:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_messageDataWithDataURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isEqualToString:", CFSTR("data")))
    {
      v6 = objc_msgSend(v4, "hasPrefix:", CFSTR("data:application/vnd.apple.pkrelayservermessage;base64,"));

      if (!v6)
      {
        v7 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("data:application/vnd.apple.pkrelayservermessage;base64,"), "length"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v5, 1);
    }
    else
    {
      v7 = 0;
    }

LABEL_9:
    return v7;
  }
  v7 = 0;
  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSharingMessageExtensionCommonMessage title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("title: '%@'; "), v7);

  -[PKSharingMessageExtensionCommonMessage subtitle](self, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("subtitle: '%@'; "), v8);

  -[PKSharingMessageExtensionRelayServerMessage status](self, "status");
  PKShareStatusToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("status: '%@'; "), v9);

  -[PKSharingMessageExtensionRelayServerMessage localProperties](self, "localProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("localProperties: '%@'; "), v10);

  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSURL)overrideURL
{
  return self->_overrideURL;
}

- (void)setOverrideURL:(id)a3
{
  self->_overrideURL = (NSURL *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
