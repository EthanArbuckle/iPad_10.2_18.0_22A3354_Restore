@implementation HVConsumerReply

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfExtractions, 0);
  objc_storeStrong((id *)&self->_contentWasProcessed, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (HVConsumerReply)initWithSuccess:(BOOL)a3 contentWasProcessed:(id)a4 numberOfExtractions:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  HVConsumerReply *v14;
  HVConsumerReply *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HVConsumerReply;
  v14 = -[HVConsumerReply init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_success = a3;
    objc_storeStrong((id *)&v14->_contentWasProcessed, a4);
    objc_storeStrong((id *)&v15->_numberOfExtractions, a5);
    objc_storeStrong((id *)&v15->_error, a6);
  }

  return v15;
}

+ (id)ignored
{
  HVConsumerReply *v2;

  v2 = [HVConsumerReply alloc];
  return -[HVConsumerReply initWithSuccess:contentWasProcessed:numberOfExtractions:error:](v2, "initWithSuccess:contentWasProcessed:numberOfExtractions:error:", 1, MEMORY[0x24BDBD1C0], 0, 0);
}

+ (id)successWithNumberOfExtractions:(id)a3
{
  id v3;
  HVConsumerReply *v4;
  HVConsumerReply *v5;

  v3 = a3;
  v4 = [HVConsumerReply alloc];
  v5 = -[HVConsumerReply initWithSuccess:contentWasProcessed:numberOfExtractions:error:](v4, "initWithSuccess:contentWasProcessed:numberOfExtractions:error:", 1, MEMORY[0x24BDBD1C8], v3, 0);

  return v5;
}

- (BOOL)success
{
  return self->_success;
}

- (NSNumber)contentWasProcessed
{
  return self->_contentWasProcessed;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setContentWasProcessed:(id)a3
{
  objc_storeStrong((id *)&self->_contentWasProcessed, a3);
}

- (NSNumber)numberOfExtractions
{
  return self->_numberOfExtractions;
}

- (void)setNumberOfExtractions:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfExtractions, a3);
}

+ (id)interrupted
{
  HVConsumerReply *v2;
  void *v3;
  HVConsumerReply *v4;

  v2 = [HVConsumerReply alloc];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kHVConsumerErrorDomain"), 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HVConsumerReply initWithSuccess:contentWasProcessed:numberOfExtractions:error:](v2, "initWithSuccess:contentWasProcessed:numberOfExtractions:error:", 0, MEMORY[0x24BDBD1C0], 0, v3);

  return v4;
}

+ (id)failedWithError:(id)a3
{
  id v3;
  HVConsumerReply *v4;
  HVConsumerReply *v5;

  v3 = a3;
  v4 = [HVConsumerReply alloc];
  v5 = -[HVConsumerReply initWithSuccess:contentWasProcessed:numberOfExtractions:error:](v4, "initWithSuccess:contentWasProcessed:numberOfExtractions:error:", 0, MEMORY[0x24BDBD1C0], 0, v3);

  return v5;
}

@end
