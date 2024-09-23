@implementation PKSharingMessageExtensionCommonMessage

- (PKSharingMessageExtensionCommonMessage)init
{
  return -[PKSharingMessageExtensionCommonMessage initWithURL:](self, "initWithURL:", 0);
}

- (PKSharingMessageExtensionCommonMessage)initWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  PKSharingMessageExtensionCommonMessage *v13;

  v4 = a3;
  +[PKSharingMessageExtensionCommonMessage _messageDataWithDataURL:prefix:](PKSharingMessageExtensionCommonMessage, "_messageDataWithDataURL:prefix:", v4, CFSTR("data:application/vnd.apple.pksim;base64,"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = 0;
LABEL_14:
    self = (PKSharingMessageExtensionCommonMessage *)-[PKSharingMessageExtensionCommonMessage _initWithCommonMessage:url:](self, "_initWithCommonMessage:url:", v6, v4);
    v13 = self;
    goto LABEL_15;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67500]), "initWithData:", v5);
  objc_msgSend(v6, "messageType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    v10 = CFSTR("pkrelayservermessage");
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      if (!v10)
      {

LABEL_13:
        goto LABEL_14;
      }
      v12 = -[__CFString isEqualToString:](v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_13;
    }
    v13 = -[PKSharingMessageExtensionRelayServerMessage _initWithCommonMessage:url:]([PKSharingMessageExtensionRelayServerMessage alloc], "_initWithCommonMessage:url:", v6, v4);
  }
  else
  {
    v13 = 0;
  }

LABEL_15:
  return v13;
}

- (id)_initWithCommonMessage:(id)a3 url:(id)a4
{
  id v6;
  PKSharingMessageExtensionCommonMessage *v7;
  PKSharingMessageExtensionCommonMessage *v8;
  id *p_message;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKSharingMessageExtensionCommonMessage;
  v7 = -[PKSharingMessageExtensionCommonMessage init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    p_message = (id *)&v7->_message;
    objc_storeStrong((id *)&v7->_message, a3);
    if (!v8->_message)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0D67500]);
      v11 = *p_message;
      *p_message = v10;

      objc_msgSend(*p_message, "setVersion:", 1);
      objc_msgSend(*p_message, "setStatus:", 6);
      v12 = objc_alloc_init(MEMORY[0x1E0D66AA0]);
      objc_msgSend(v12, "setIdentifier:", CFSTR("identifier"));
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSharingSessionIdentifier:", v13);

      objc_msgSend(v12, "setPairedReaderIdentifier:", CFSTR("pairedReaderIdentifier"));
      objc_msgSend(v12, "setSupportedRadioTechnologies:", 0);
      objc_msgSend(v12, "setPartnerIdentifier:", CFSTR("partnerIdentifier"));
      objc_msgSend(v12, "setBrandIdentifier:", CFSTR("brandIdentifier"));
      objc_msgSend(v12, "setForWatch:", 1);
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hexEncoding");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_message, "setWatchInvitation:", v15);

    }
  }

  return v8;
}

- (id)urlRepresentation
{
  void *v3;
  void *v4;

  -[PKProtobufCommonSharingMessage data](self->_message, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionCommonMessage _messageDataURLWithData:prefix:](self, "_messageDataURLWithData:prefix:", v3, CFSTR("data:application/vnd.apple.pksim;base64,"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)messageTypeFromURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[PKSharingMessageExtensionCommonMessage _messageDataWithDataURL:prefix:](PKSharingMessageExtensionCommonMessage, "_messageDataWithDataURL:prefix:", a3, CFSTR("data:application/vnd.apple.pksim;base64,"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67508]), "initWithData:", v3);
    objc_msgSend(v4, "messageType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)messageType
{
  return (NSString *)-[PKProtobufCommonSharingMessage messageType](self->_message, "messageType");
}

- (void)setMessageType:(id)a3
{
  -[PKProtobufCommonSharingMessage setMessageType:](self->_message, "setMessageType:", a3);
}

- (NSData)messageData
{
  return (NSData *)-[PKProtobufCommonSharingMessage messageData](self->_message, "messageData");
}

- (void)setMessageData:(id)a3
{
  -[PKProtobufCommonSharingMessage setMessageData:](self->_message, "setMessageData:", a3);
}

- (NSString)title
{
  return (NSString *)-[PKProtobufCommonSharingMessage title](self->_message, "title");
}

- (void)setTitle:(id)a3
{
  -[PKProtobufCommonSharingMessage setTitle:](self->_message, "setTitle:", a3);
}

- (NSString)topLeftTitle
{
  return (NSString *)-[PKProtobufCommonSharingMessage topLeftTitle](self->_message, "topLeftTitle");
}

- (void)setTopLeftTitle:(id)a3
{
  -[PKProtobufCommonSharingMessage setTopLeftTitle:](self->_message, "setTopLeftTitle:", a3);
}

- (NSString)topRightTitle
{
  return (NSString *)-[PKProtobufCommonSharingMessage topRightTitle](self->_message, "topRightTitle");
}

- (void)setTopRightTitle:(id)a3
{
  -[PKProtobufCommonSharingMessage setTopRightTitle:](self->_message, "setTopRightTitle:", a3);
}

- (NSString)subtitle
{
  return (NSString *)-[PKProtobufCommonSharingMessage subtitle](self->_message, "subtitle");
}

- (void)setSubtitle:(id)a3
{
  -[PKProtobufCommonSharingMessage setSubtitle:](self->_message, "setSubtitle:", a3);
}

- (UIImage)thumbnail
{
  NSData *v2;
  NSData *v3;
  uint64_t v4;
  CGImage *v5;
  void *v6;

  -[PKProtobufCommonSharingMessage thumbnailImage](self->_message, "thumbnailImage");
  v2 = (NSData *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = PKCreateCGImage(v2)) != 0)
  {
    v5 = (CGImage *)v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v4);
    CGImageRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return (UIImage *)v6;
}

- (void)setThumbnail:(id)a3
{
  PKProtobufCommonSharingMessage *message;
  id v4;

  message = self->_message;
  UIImagePNGRepresentation((UIImage *)a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKProtobufCommonSharingMessage setThumbnailImage:](message, "setThumbnailImage:", v4);

}

- (NSData)rawThumbnailData
{
  return (NSData *)-[PKProtobufCommonSharingMessage thumbnailImage](self->_message, "thumbnailImage");
}

- (void)setRawThumbnailData:(id)a3
{
  -[PKProtobufCommonSharingMessage setThumbnailImage:](self->_message, "setThumbnailImage:", a3);
}

- (NSURL)actionURL
{
  void *v2;
  void *v3;

  -[PKProtobufCommonSharingMessage actionURL](self->_message, "actionURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v2);
  else
    v3 = 0;

  return (NSURL *)v3;
}

- (void)setActionURL:(id)a3
{
  PKProtobufCommonSharingMessage *message;
  id v4;

  message = self->_message;
  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKProtobufCommonSharingMessage setActionURL:](message, "setActionURL:", v4);

}

- (NSString)buttonTitle
{
  return (NSString *)-[PKProtobufCommonSharingMessage buttonTitle](self->_message, "buttonTitle");
}

- (void)setButtonTitle:(id)a3
{
  -[PKProtobufCommonSharingMessage setButtonTitle:](self->_message, "setButtonTitle:", a3);
}

- (id)_messageDataURLWithData:(id)a3 prefix:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (a3)
  {
    objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "stringByAppendingString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_messageDataWithDataURL:(id)a3 prefix:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v5 = a4;
  if (a3)
  {
    v6 = a3;
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isEqualToString:", CFSTR("data")))
    {
      v9 = objc_msgSend(v7, "hasPrefix:", v5);

      if (!v9)
      {
        v10 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v5, "length"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 1);
    }
    else
    {
      v10 = 0;
    }

LABEL_9:
    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:

  return v10;
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

  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (BOOL)isPending
{
  return self->_isPending;
}

- (void)setIsPending:(BOOL)a3
{
  self->_isPending = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
