@implementation PKSubcredentialInvitationMessage

- (PKSubcredentialInvitationMessage)init
{
  return -[PKSubcredentialInvitationMessage initWithURL:](self, "initWithURL:", 0);
}

- (PKSubcredentialInvitationMessage)initWithURL:(id)a3
{
  id v4;
  PKSubcredentialInvitationMessage *v5;
  PKSubcredentialInvitationMessage *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  PKProtobufSubcredentialInvitationMessage *protoMessage;
  PKProtobufSubcredentialInvitationMessage *v11;
  PKProtobufSubcredentialInvitationMessage *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKSubcredentialInvitationMessage;
  v5 = -[PKSubcredentialInvitationMessage init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      -[PKSubcredentialInvitationMessage _subcredentialInvitationMessageDataWithDataURL:](v5, "_subcredentialInvitationMessageDataWithDataURL:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67528]), "initWithData:", v7);
        protoMessage = v6->_protoMessage;
        v6->_protoMessage = (PKProtobufSubcredentialInvitationMessage *)v9;

      }
    }
    if (!v6->_protoMessage)
    {
      v11 = (PKProtobufSubcredentialInvitationMessage *)objc_alloc_init(MEMORY[0x1E0D67528]);
      v12 = v6->_protoMessage;
      v6->_protoMessage = v11;

      -[PKProtobufSubcredentialInvitationMessage setVersion:](v6->_protoMessage, "setVersion:", 1);
    }
  }

  return v6;
}

- (id)urlRepresentation
{
  void *v3;
  void *v4;

  -[PKProtobufSubcredentialInvitationMessage data](self->_protoMessage, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialInvitationMessage _subcredentialInvitationMessageDataURLWithData:](self, "_subcredentialInvitationMessageDataURLWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PKAppletSubcredentialSharingInvitation)phoneInvitation
{
  void *v2;
  void *v3;
  void *v4;

  -[PKProtobufSubcredentialInvitationMessage phoneInvitation](self->_protoMessage, "phoneInvitation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pk_decodeHexadecimal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKAppletSubcredentialSharingInvitation *)v4;
}

- (PKAppletSubcredentialSharingInvitation)watchInvitation
{
  void *v2;
  void *v3;
  void *v4;

  -[PKProtobufSubcredentialInvitationMessage watchInvitation](self->_protoMessage, "watchInvitation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pk_decodeHexadecimal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKAppletSubcredentialSharingInvitation *)v4;
}

- (NSString)dataString
{
  return (NSString *)-[PKProtobufSubcredentialInvitationMessage dataString](self->_protoMessage, "dataString");
}

- (unint64_t)status
{
  unsigned int v2;

  v2 = -[PKProtobufSubcredentialInvitationMessage status](self->_protoMessage, "status");
  if (v2 > 5)
    return 0;
  else
    return qword_19DF17BD8[v2];
}

- (NSString)uniqueIdentifier
{
  return (NSString *)-[PKProtobufSubcredentialInvitationMessage uniqueIdentifier](self->_protoMessage, "uniqueIdentifier");
}

- (UIImage)passThumbnailImage
{
  NSData *v2;
  NSData *v3;
  uint64_t v4;
  CGImage *v5;
  void *v6;

  -[PKProtobufSubcredentialInvitationMessage passThumbnailImage](self->_protoMessage, "passThumbnailImage");
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

- (void)setPhoneInvitation:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hexEncoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufSubcredentialInvitationMessage setPhoneInvitation:](self->_protoMessage, "setPhoneInvitation:", v4);

}

- (void)setWatchInvitation:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hexEncoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufSubcredentialInvitationMessage setWatchInvitation:](self->_protoMessage, "setWatchInvitation:", v4);

}

- (void)setDataString:(id)a3
{
  -[PKProtobufSubcredentialInvitationMessage setDataString:](self->_protoMessage, "setDataString:", a3);
}

- (void)setStatus:(unint64_t)a3
{
  uint64_t v3;

  if (a3 > 9)
    v3 = 0;
  else
    v3 = dword_19DF17C08[a3];
  -[PKProtobufSubcredentialInvitationMessage setStatus:](self->_protoMessage, "setStatus:", v3);
}

- (void)setUniqueIdentifier:(id)a3
{
  -[PKProtobufSubcredentialInvitationMessage setUniqueIdentifier:](self->_protoMessage, "setUniqueIdentifier:", a3);
}

- (void)setPassThumbnailImage:(id)a3
{
  PKProtobufSubcredentialInvitationMessage *protoMessage;
  id v4;

  protoMessage = self->_protoMessage;
  UIImagePNGRepresentation((UIImage *)a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKProtobufSubcredentialInvitationMessage setPassThumbnailImage:](protoMessage, "setPassThumbnailImage:", v4);

}

- (id)_subcredentialInvitationMessageDataURLWithData:(id)a3
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
      objc_msgSend(PKSubcredentialInvitationMessageAbsoluteDataURLPrefix, "stringByAppendingString:", v3);
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

- (id)_subcredentialInvitationMessageDataWithDataURL:(id)a3
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
      v6 = objc_msgSend(v4, "hasPrefix:", PKSubcredentialInvitationMessageAbsoluteDataURLPrefix);

      if (!v6)
      {
        v7 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(PKSubcredentialInvitationMessageAbsoluteDataURLPrefix, "length"));
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
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PKSubcredentialInvitationMessage phoneInvitation](self, "phoneInvitation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialInvitationMessage watchInvitation](self, "watchInvitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialInvitationMessage status](self, "status");
  PKShareStatusToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> phoneIdentifier: %@, watchIdentifier: %@, status: %@"), v4, self, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
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
  objc_storeStrong((id *)&self->_protoMessage, 0);
}

@end
