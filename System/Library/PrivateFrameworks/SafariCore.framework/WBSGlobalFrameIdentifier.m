@implementation WBSGlobalFrameIdentifier

- (WBSGlobalFrameIdentifier)initWithPageID:(id)a3 frameID:(id)a4
{
  id v7;
  id v8;
  WBSGlobalFrameIdentifier *v9;
  WBSGlobalFrameIdentifier *v10;
  WBSGlobalFrameIdentifier *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSGlobalFrameIdentifier;
  v9 = -[WBSGlobalFrameIdentifier init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webPageID, a3);
    objc_storeStrong((id *)&v10->_webFrameID, a4);
    v11 = v10;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[WBSGlobalFrameIdentifier initWithPageID:frameID:](+[WBSGlobalFrameIdentifier allocWithZone:](WBSGlobalFrameIdentifier, "allocWithZone:", a3), "initWithPageID:frameID:", self->_webPageID, self->_webFrameID);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSNumber *webPageID;
  void *v7;
  NSNumber *webFrameID;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    webPageID = self->_webPageID;
    objc_msgSend(v5, "webPageID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSNumber isEqual:](webPageID, "isEqual:", v7))
    {
      webFrameID = self->_webFrameID;
      objc_msgSend(v5, "webFrameID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSNumber isEqual:](webFrameID, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSNumber unsignedIntegerValue](self->_webPageID, "unsignedIntegerValue");
  return -[NSNumber unsignedIntegerValue](self->_webFrameID, "unsignedIntegerValue") ^ v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FrameIdentifier (%p): { pageID: %@, frameID: %@ }"), self, self->_webPageID, self->_webFrameID);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSGlobalFrameIdentifier)initWithCoder:(id)a3
{
  id v4;
  WBSGlobalFrameIdentifier *v5;
  uint64_t v6;
  NSNumber *webPageID;
  uint64_t v8;
  NSNumber *webFrameID;
  WBSGlobalFrameIdentifier *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSGlobalFrameIdentifier;
  v5 = -[WBSGlobalFrameIdentifier init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webPageID"));
    v6 = objc_claimAutoreleasedReturnValue();
    webPageID = v5->_webPageID;
    v5->_webPageID = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webFrameID"));
    v8 = objc_claimAutoreleasedReturnValue();
    webFrameID = v5->_webFrameID;
    v5->_webFrameID = (NSNumber *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *webPageID;
  id v5;

  webPageID = self->_webPageID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", webPageID, CFSTR("webPageID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webFrameID, CFSTR("webFrameID"));

}

- (NSNumber)webPageID
{
  return self->_webPageID;
}

- (NSNumber)webFrameID
{
  return self->_webFrameID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webFrameID, 0);
  objc_storeStrong((id *)&self->_webPageID, 0);
}

@end
