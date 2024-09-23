@implementation SFEndNetworkSearchFeedback

- (SFEndNetworkSearchFeedback)initWithStartSearch:(id)a3 responseSize:(int64_t)a4 statusCode:(int64_t)a5 networkTimingData:(id)a6
{
  id v10;
  SFEndNetworkSearchFeedback *v11;
  SFEndNetworkSearchFeedback *v12;
  uint64_t v13;
  NSDictionary *networkTimingData;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SFEndNetworkSearchFeedback;
  v11 = -[SFEndSearchFeedback initWithStartSearch:](&v16, sel_initWithStartSearch_, a3);
  v12 = v11;
  if (v11)
  {
    v11->_responseSize = a4;
    v11->_statusCode = a5;
    v13 = objc_msgSend(v10, "copy");
    networkTimingData = v12->_networkTimingData;
    v12->_networkTimingData = (NSDictionary *)v13;

  }
  return v12;
}

- (SFEndNetworkSearchFeedback)initWithCoder:(id)a3
{
  id v4;
  SFEndNetworkSearchFeedback *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *networkTimingData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFEndNetworkSearchFeedback;
  v5 = -[SFEndSearchFeedback initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_responseSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("response_size"));
    v5->_statusCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status_code"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("network_timing_data"));
    v10 = objc_claimAutoreleasedReturnValue();
    networkTimingData = v5->_networkTimingData;
    v5->_networkTimingData = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFEndNetworkSearchFeedback;
  v4 = a3;
  -[SFEndSearchFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_responseSize, CFSTR("response_size"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_statusCode, CFSTR("status_code"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_networkTimingData, CFSTR("network_timing_data"));

}

- (int64_t)responseSize
{
  return self->_responseSize;
}

- (void)setResponseSize:(int64_t)a3
{
  self->_responseSize = a3;
}

- (unint64_t)rawResponseSize
{
  return self->_rawResponseSize;
}

- (void)setRawResponseSize:(unint64_t)a3
{
  self->_rawResponseSize = a3;
}

- (unint64_t)decompressedResponseSize
{
  return self->_decompressedResponseSize;
}

- (void)setDecompressedResponseSize:(unint64_t)a3
{
  self->_decompressedResponseSize = a3;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (NSDictionary)networkTimingData
{
  return self->_networkTimingData;
}

- (void)setNetworkTimingData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkTimingData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
