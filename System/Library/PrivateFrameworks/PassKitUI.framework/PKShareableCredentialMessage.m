@implementation PKShareableCredentialMessage

- (PKShareableCredentialMessage)init
{
  return -[PKShareableCredentialMessage initWithURL:](self, "initWithURL:", 0);
}

- (PKShareableCredentialMessage)initWithURL:(id)a3
{
  id v4;
  PKShareableCredentialMessage *v5;
  PKShareableCredentialMessage *v6;
  void *v7;
  uint64_t v8;
  PKProtobufShareableCredentialMessage *protoMessage;
  PKProtobufShareableCredentialMessage *v10;
  PKProtobufShareableCredentialMessage *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKShareableCredentialMessage;
  v5 = -[PKShareableCredentialMessage init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKShareableCredentialMessage _shareableCredentialMessageDataWithDataURL:](v5, "_shareableCredentialMessageDataWithDataURL:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67520]), "initWithData:", v7);
      protoMessage = v6->_protoMessage;
      v6->_protoMessage = (PKProtobufShareableCredentialMessage *)v8;

    }
    if (!v6->_protoMessage)
    {
      v10 = (PKProtobufShareableCredentialMessage *)objc_alloc_init(MEMORY[0x1E0D67520]);
      v11 = v6->_protoMessage;
      v6->_protoMessage = v10;

      -[PKProtobufShareableCredentialMessage setVersion:](v6->_protoMessage, "setVersion:", 1);
    }

  }
  return v6;
}

- (id)urlRepresentation
{
  void *v3;
  void *v4;

  -[PKProtobufShareableCredentialMessage data](self->_protoMessage, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShareableCredentialMessage _shareableCredentialMessageDataURLWithData:](self, "_shareableCredentialMessageDataURLWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShareableCredentialMessage caption](self, "caption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("caption: '%@'; "), v4);

  -[PKShareableCredentialMessage policyIdentifier](self, "policyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("policy identifier: '%@'; "), v5);

  -[PKShareableCredentialMessage shareableCredentials](self, "shareableCredentials");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("credentials: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v7;
}

- (NSArray)shareableCredentials
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PKProtobufShareableCredentialMessage shareableCredentials](self->_protoMessage, "shareableCredentials", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67678]), "initWithProtoCredential:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSString)dataString
{
  return (NSString *)-[PKProtobufShareableCredentialMessage dataString](self->_protoMessage, "dataString");
}

- (NSString)caption
{
  return (NSString *)-[PKProtobufShareableCredentialMessage messageCaption](self->_protoMessage, "messageCaption");
}

- (NSString)policyIdentifier
{
  return (NSString *)-[PKProtobufShareableCredentialMessage policyIdentifier](self->_protoMessage, "policyIdentifier");
}

- (UIImage)passThumbnailImage
{
  NSData *v2;
  NSData *v3;
  uint64_t v4;
  CGImage *v5;
  void *v6;

  -[PKProtobufShareableCredentialMessage passThumbnailImage](self->_protoMessage, "passThumbnailImage");
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

- (BOOL)isShareAcceptable
{
  void *v3;
  void *v4;
  unint64_t v5;
  BOOL v6;

  -[PKShareableCredentialMessage shareableCredentials](self, "shareableCredentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "status");

  v6 = self->_isFromMe || v5 >= 2;
  return !v6;
}

- (BOOL)isPassInLibrary
{
  return -[PKProtobufShareableCredentialMessage isPassInLibrary](self->_protoMessage, "isPassInLibrary");
}

- (void)setDataString:(id)a3
{
  -[PKProtobufShareableCredentialMessage setDataString:](self->_protoMessage, "setDataString:", a3);
}

- (void)setShareableCredentials:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PKProtobufShareableCredentialMessage *protoMessage;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKProtobufShareableCredentialMessage clearShareableCredentials](self->_protoMessage, "clearShareableCredentials");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        protoMessage = self->_protoMessage;
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "protoCredential", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKProtobufShareableCredentialMessage addShareableCredentials:](protoMessage, "addShareableCredentials:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)setCaption:(id)a3
{
  -[PKProtobufShareableCredentialMessage setMessageCaption:](self->_protoMessage, "setMessageCaption:", a3);
}

- (void)setPolicyIdentifier:(id)a3
{
  -[PKProtobufShareableCredentialMessage setPolicyIdentifier:](self->_protoMessage, "setPolicyIdentifier:", a3);
}

- (void)setPassThumbnailImage:(id)a3
{
  PKProtobufShareableCredentialMessage *protoMessage;
  id v4;

  protoMessage = self->_protoMessage;
  UIImagePNGRepresentation((UIImage *)a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKProtobufShareableCredentialMessage setPassThumbnailImage:](protoMessage, "setPassThumbnailImage:", v4);

}

- (void)setIsPassInLibrary:(BOOL)a3
{
  -[PKProtobufShareableCredentialMessage setIsPassInLibrary:](self->_protoMessage, "setIsPassInLibrary:", a3);
}

- (id)_shareableCredentialMessageDataURLWithData:(id)a3
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
      objc_msgSend(CFSTR("data:application/vnd.apple.pkshareablecredential;base64,"), "stringByAppendingString:", v3);
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

- (id)_shareableCredentialMessageDataWithDataURL:(id)a3
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
      v6 = objc_msgSend(v4, "hasPrefix:", CFSTR("data:application/vnd.apple.pkshareablecredential;base64,"));

      if (!v6)
      {
        v7 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("data:application/vnd.apple.pkshareablecredential;base64,"), "length"));
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
