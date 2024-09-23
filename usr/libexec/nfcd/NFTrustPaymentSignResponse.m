@implementation NFTrustPaymentSignResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustPaymentSignResponse)initWithCoder:(id)a3
{
  id v4;
  NFTrustPaymentSignResponse *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFTrustPaymentSignResponse;
  v5 = -[NFTrustObject initWithCoder:](&v11, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NFTrustSignResponse), CFSTR("signResponse"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NFTrustPaymentSignResponse setValue:forKey:](v5, "setValue:forKey:", v7, CFSTR("signResponse"));

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NFECommercePaymentResponse), CFSTR("paymentResponse"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NFTrustPaymentSignResponse setValue:forKey:](v5, "setValue:forKey:", v9, CFSTR("paymentResponse"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustPaymentSignResponse signResponse](self, "signResponse"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("signResponse"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[NFTrustPaymentSignResponse paymentResponse](self, "paymentResponse"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("paymentResponse"));

}

+ (id)paymentSignResponseWithSignResponse:(id)a3 paymentResponse:(id)a4
{
  id v7;
  id v8;
  NFTrustPaymentSignResponse *v9;
  NFTrustPaymentSignResponse *v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *Name;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = [NFTrustPaymentSignResponse alloc];
    v10 = v9;
    if (v9)
    {
      -[NFTrustPaymentSignResponse setSignResponse:](v9, "setSignResponse:", v7);
      -[NFTrustPaymentSignResponse setPaymentResponse:](v10, "setPaymentResponse:", v8);
    }
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v13(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustPaymentSignResponse with nil NFTrustSignResponse", v17, ClassName, Name, 458);
    }
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(a1);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      *(_DWORD *)buf = 67109890;
      v26 = v22;
      v27 = 2082;
      v28 = object_getClassName(a1);
      v29 = 2082;
      v30 = sel_getName(a2);
      v31 = 1024;
      v32 = 458;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create NFTrustPaymentSignResponse with nil NFTrustSignResponse", buf, 0x22u);
    }

    v10 = 0;
  }

  return v10;
}

- (NFTrustSignResponse)signResponse
{
  return self->_signResponse;
}

- (void)setSignResponse:(id)a3
{
  objc_storeStrong((id *)&self->_signResponse, a3);
}

- (NFECommercePaymentResponse)paymentResponse
{
  return self->_paymentResponse;
}

- (void)setPaymentResponse:(id)a3
{
  objc_storeStrong((id *)&self->_paymentResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentResponse, 0);
  objc_storeStrong((id *)&self->_signResponse, 0);
}

@end
