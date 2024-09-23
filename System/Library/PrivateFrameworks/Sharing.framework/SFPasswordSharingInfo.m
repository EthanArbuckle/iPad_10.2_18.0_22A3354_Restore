@implementation SFPasswordSharingInfo

- (SFPasswordSharingInfo)initWithCoder:(id)a3
{
  id v4;
  SFPasswordSharingInfo *v5;
  void *v6;
  uint64_t v7;
  NSNumber *channel;
  void *v9;
  uint64_t v10;
  NSString *psk;
  void *v12;
  uint64_t v13;
  NSString *networkName;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFPasswordSharingInfo;
  v5 = -[SFPasswordSharingInfo init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ch"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    channel = v5->_channel;
    v5->_channel = (NSNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("psk"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    psk = v5->_psk;
    v5->_psk = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nwName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    networkName = v5->_networkName;
    v5->_networkName = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *channel;
  id v5;

  channel = self->_channel;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", channel, CFSTR("ch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_networkName, CFSTR("nwName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_psk, CFSTR("psk"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_networkName, a3);
}

- (NSString)psk
{
  return self->_psk;
}

- (void)setPsk:(id)a3
{
  objc_storeStrong((id *)&self->_psk, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psk, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_channel, 0);
}

@end
