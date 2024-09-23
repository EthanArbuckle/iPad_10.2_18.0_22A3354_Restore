@implementation SFPeopleSuggesterResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPeopleSuggesterResult)initWithCoder:(id)a3
{
  id v4;
  SFPeopleSuggesterResult *v5;
  id v6;
  id v7;
  SFPeopleSuggesterResult *v8;
  objc_super v10;
  uint64_t v11;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFPeopleSuggesterResult;
  v5 = -[SFPeopleSuggesterResult init](&v10, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v11 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_flags = v11;
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *contactID;
  uint64_t flags;
  NSArray *handles;
  NSString *sendersKnownAlias;
  id v9;

  v4 = a3;
  contactID = self->_contactID;
  v9 = v4;
  if (contactID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", contactID, CFSTR("cnID"));
    v4 = v9;
  }
  flags = self->_flags;
  if ((_DWORD)flags)
  {
    objc_msgSend(v9, "encodeInt64:forKey:", flags, CFSTR("flags"));
    v4 = v9;
  }
  handles = self->_handles;
  if (handles)
  {
    objc_msgSend(v9, "encodeObject:forKey:", handles, CFSTR("hnds"));
    v4 = v9;
  }
  sendersKnownAlias = self->_sendersKnownAlias;
  if (sendersKnownAlias)
  {
    objc_msgSend(v9, "encodeObject:forKey:", sendersKnownAlias, CFSTR("ska"));
    v4 = v9;
  }

}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sendersKnownAlias
{
  return self->_sendersKnownAlias;
}

- (void)setSendersKnownAlias:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendersKnownAlias, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
}

@end
