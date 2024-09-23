@implementation VSVoiceSubscription

- (VSVoiceSubscription)initWithClient:(id)a3 accessory:(id)a4 voice:(id)a5
{
  id v9;
  id v10;
  id v11;
  VSVoiceSubscription *v12;
  VSVoiceSubscription *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VSVoiceSubscription;
  v12 = -[VSVoiceSubscription init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientID, a3);
    objc_storeStrong((id *)&v13->_accessoryID, a4);
    objc_storeStrong((id *)&v13->_voice, a5);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientID;
  id v5;

  clientID = self->_clientID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clientID, CFSTR("_clientID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryID, CFSTR("_accessoryID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voice, CFSTR("_voice"));

}

- (VSVoiceSubscription)initWithCoder:(id)a3
{
  id v4;
  VSVoiceSubscription *v5;
  uint64_t v6;
  NSString *clientID;
  uint64_t v8;
  NSString *accessoryID;
  uint64_t v10;
  VSVoiceAsset *voice;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSVoiceSubscription;
  v5 = -[VSVoiceSubscription init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientID"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accessoryID"));
    v8 = objc_claimAutoreleasedReturnValue();
    accessoryID = v5->_accessoryID;
    v5->_accessoryID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_voice"));
    v10 = objc_claimAutoreleasedReturnValue();
    voice = v5->_voice;
    v5->_voice = (VSVoiceAsset *)v10;

  }
  return v5;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_storeStrong((id *)&self->_clientID, a3);
}

- (NSString)accessoryID
{
  return self->_accessoryID;
}

- (void)setAccessoryID:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryID, a3);
}

- (VSVoiceAsset)voice
{
  return self->_voice;
}

- (void)setVoice:(id)a3
{
  objc_storeStrong((id *)&self->_voice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voice, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
