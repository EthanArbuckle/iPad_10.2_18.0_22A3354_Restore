@implementation PKAccountPhysicalCardExpirationMessagingInfo

- (PKAccountPhysicalCardExpirationMessagingInfo)initWithDictionary:(id)a3
{
  id v4;
  PKAccountPhysicalCardExpirationMessagingInfo *v5;
  uint64_t v6;
  NSString *physicalCardIdentifier;
  void *v8;
  uint64_t v9;
  NSString *v10;
  PKAccountPhysicalCardExpirationMessagingInfo *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKAccountPhysicalCardExpirationMessagingInfo;
  v5 = -[PKAccountPhysicalCardExpirationMessagingInfo init](&v14, sel_init);
  if (!v5)
    goto LABEL_8;
  v5->_scatterInterval = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("scatterInterval"));
  objc_msgSend(v4, "PKStringForKey:", CFSTR("physicalCardIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  physicalCardIdentifier = v5->_physicalCardIdentifier;
  v5->_physicalCardIdentifier = (NSString *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("messagingType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = PKAccountPhysicalCardExpirationMessagingTypeFromString(v8);
  v5->_messagingType = v9;
  v10 = v5->_physicalCardIdentifier;

  if (!v10 || v9 == 0)
    v12 = 0;
  else
LABEL_8:
    v12 = v5;

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t scatterInterval;
  id v5;

  scatterInterval = self->_scatterInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", scatterInterval, CFSTR("scatterInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_physicalCardIdentifier, CFSTR("physicalCardIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_messagingType, CFSTR("messagingType"));

}

- (PKAccountPhysicalCardExpirationMessagingInfo)initWithCoder:(id)a3
{
  id v4;
  PKAccountPhysicalCardExpirationMessagingInfo *v5;
  uint64_t v6;
  NSString *physicalCardIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountPhysicalCardExpirationMessagingInfo;
  v5 = -[PKAccountPhysicalCardExpirationMessagingInfo init](&v9, sel_init);
  if (v5)
  {
    v5->_scatterInterval = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scatterInterval"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("physicalCardIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    physicalCardIdentifier = v5->_physicalCardIdentifier;
    v5->_physicalCardIdentifier = (NSString *)v6;

    v5->_messagingType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("messagingType"));
  }

  return v5;
}

- (int64_t)scatterInterval
{
  return self->_scatterInterval;
}

- (NSString)physicalCardIdentifier
{
  return self->_physicalCardIdentifier;
}

- (unint64_t)messagingType
{
  return self->_messagingType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalCardIdentifier, 0);
}

@end
