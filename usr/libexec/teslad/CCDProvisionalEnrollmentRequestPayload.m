@implementation CCDProvisionalEnrollmentRequestPayload

- (id)dictionary
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCDProvisionalEnrollmentRequestPayload;
  v3 = -[CCDRequestPayload dictionary](&v8, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CCDProvisionalEnrollmentRequestPayload nonce](self, "nonce"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("nonce"));

  return v5;
}

- (id)action
{
  return CFSTR("RequestProvisionalEnrollment");
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end
