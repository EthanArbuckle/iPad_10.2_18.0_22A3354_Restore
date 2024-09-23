@implementation ICUserVerificationRequest

- (ICUserVerificationRequest)initWithVerificationContext:(id)a3
{
  id v4;
  ICUserVerificationRequest *v5;
  ICUserVerificationRequest *v6;
  uint64_t v7;
  ICUserVerificationContext *verificationContext;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICUserVerificationRequest;
  v5 = -[ICUserVerificationRequest init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_qualityOfService = 25;
    v7 = objc_msgSend(v4, "copy");
    verificationContext = v6->_verificationContext;
    v6->_verificationContext = (ICUserVerificationContext *)v7;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithVerificationContext:", self->_verificationContext);
  v5 = (void *)v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 8) = self->_qualityOfService;
    objc_storeStrong((id *)(v4 + 16), self->_storeRequestContext);
  }
  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, _QWORD, void *);

  v7 = (void (**)(id, _QWORD, void *))a3;
  +[ICUserVerificationOperation operationWithVerificationRequest:](ICUserVerificationOperation, "operationWithVerificationRequest:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setResponseHandler:", v7);
    objc_msgSend(MEMORY[0x1E0CB3828], "ic_sharedRequestOperationQueueWithQualityOfService:", self->_qualityOfService);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addOperation:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v6);
  }

}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (ICStoreRequestContext)storeRequestContext
{
  return self->_storeRequestContext;
}

- (void)setStoreRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ICUserVerificationContext)verificationContext
{
  return self->_verificationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationContext, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

@end
