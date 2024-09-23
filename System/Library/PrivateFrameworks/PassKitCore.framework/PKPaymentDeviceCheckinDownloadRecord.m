@implementation PKPaymentDeviceCheckinDownloadRecord

- (PKPaymentDeviceCheckinDownloadRecord)initWithCoder:(id)a3
{
  id v4;
  PKPaymentDeviceCheckinDownloadRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentDeviceCheckinDownloadRecord;
  v5 = -[PKPaymentBackgroundDownloadRecord initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDeviceCheckinDownloadRecord setRegion:](v5, "setRegion:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDeviceCheckinDownloadRecord setIdentifier:](v5, "setIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDeviceCheckinDownloadRecord setResponseData:](v5, "setResponseData:", v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentDeviceCheckinDownloadRecord;
  v4 = a3;
  -[PKPaymentBackgroundDownloadRecord encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[PKPaymentDeviceCheckinDownloadRecord region](self, "region", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("region"));

  -[PKPaymentDeviceCheckinDownloadRecord identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[PKPaymentDeviceCheckinDownloadRecord responseData](self, "responseData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("responseData"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_responseData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
