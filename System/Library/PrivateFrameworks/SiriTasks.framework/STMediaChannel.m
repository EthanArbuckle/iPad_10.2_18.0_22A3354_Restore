@implementation STMediaChannel

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STMediaChannel;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_callSign, CFSTR("_callSign"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_channelIdentifier, CFSTR("_channelIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_streamUrl, CFSTR("_streamUrl"));

}

- (STMediaChannel)initWithCoder:(id)a3
{
  id v4;
  STMediaChannel *v5;
  uint64_t v6;
  NSString *callSign;
  uint64_t v8;
  NSString *channelIdentifier;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSURL *streamUrl;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STMediaChannel;
  v5 = -[STSiriModelObject initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_callSign"));
    v6 = objc_claimAutoreleasedReturnValue();
    callSign = v5->_callSign;
    v5->_callSign = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_channelIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    channelIdentifier = v5->_channelIdentifier;
    v5->_channelIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_streamUrl"));
    v12 = objc_claimAutoreleasedReturnValue();
    streamUrl = v5->_streamUrl;
    v5->_streamUrl = (NSURL *)v12;

  }
  return v5;
}

- (NSString)callSign
{
  return self->_callSign;
}

- (void)setCallSign:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (void)setChannelIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)streamUrl
{
  return self->_streamUrl;
}

- (void)setStreamUrl:(id)a3
{
  objc_storeStrong((id *)&self->_streamUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamUrl, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
  objc_storeStrong((id *)&self->_callSign, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
