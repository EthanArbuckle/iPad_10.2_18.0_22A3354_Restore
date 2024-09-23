@implementation STShowChannelRequest

- (id)_initWithChannel:(id)a3
{
  id v5;
  STShowChannelRequest *v6;
  STShowChannelRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STShowChannelRequest;
  v6 = -[AFSiriRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_channel, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STShowChannelRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_channel, CFSTR("_channel"), v5.receiver, v5.super_class);

}

- (STShowChannelRequest)initWithCoder:(id)a3
{
  id v4;
  STShowChannelRequest *v5;
  uint64_t v6;
  STMediaChannel *channel;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STShowChannelRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_channel"));
    v6 = objc_claimAutoreleasedReturnValue();
    channel = v5->_channel;
    v5->_channel = (STMediaChannel *)v6;

  }
  return v5;
}

- (STMediaChannel)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
