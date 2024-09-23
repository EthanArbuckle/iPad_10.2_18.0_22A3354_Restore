@implementation PKPeerPaymentPerformResponse

- (PKPeerPaymentPerformResponse)initWithData:(id)a3
{
  return -[PKPeerPaymentPerformResponse initWithData:deviceScoreIdentifier:](self, "initWithData:deviceScoreIdentifier:", a3, 0);
}

- (PKPeerPaymentPerformResponse)initWithData:(id)a3 deviceScoreIdentifier:(id)a4
{
  id v6;
  PKPeerPaymentPerformResponse *v7;
  uint64_t v8;
  NSUUID *deviceScoreIdentifier;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentPerformResponse;
  v7 = -[PKPeerPaymentStatusResponse initWithData:](&v11, sel_initWithData_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    deviceScoreIdentifier = v7->_deviceScoreIdentifier;
    v7->_deviceScoreIdentifier = (NSUUID *)v8;

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPerformResponse)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentPerformResponse *v5;
  void *v6;
  uint64_t v7;
  NSUUID *deviceScoreIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentPerformResponse;
  v5 = -[PKWebServiceResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceScoreIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    deviceScoreIdentifier = v5->_deviceScoreIdentifier;
    v5->_deviceScoreIdentifier = (NSUUID *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentPerformResponse;
  v4 = a3;
  -[PKWebServiceResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceScoreIdentifier, CFSTR("deviceScoreIdentifier"), v5.receiver, v5.super_class);

}

- (NSUUID)deviceScoreIdentifier
{
  return self->_deviceScoreIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceScoreIdentifier, 0);
}

@end
