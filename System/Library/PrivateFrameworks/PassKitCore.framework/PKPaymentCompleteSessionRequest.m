@implementation PKPaymentCompleteSessionRequest

- (id)endpointComponents
{
  id v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[PKPaymentRewrapRequestBase type](self, "type");
  v5 = CFSTR("completeSession");
  switch(v4)
  {
    case 0:
      goto LABEL_6;
    case 1:
      objc_msgSend(v3, "addObject:", CFSTR("completeSession"));
      v5 = CFSTR("payLater");
      goto LABEL_6;
    case 2:
      v5 = CFSTR("issueVirtualCardNumber");
      goto LABEL_6;
    case 4:
      objc_msgSend(v3, "addObject:", CFSTR("completeSession"));
      v5 = CFSTR("issuerInstallment");
      goto LABEL_6;
    case 5:
      objc_msgSend(v3, "addObject:", CFSTR("completeSession"));
      v5 = CFSTR("rewards");
LABEL_6:
      objc_msgSend(v3, "addObject:", v5);
      break;
    default:
      break;
  }
  v6 = (void *)objc_msgSend(v3, "copy", v5);

  return v6;
}

- (id)bodyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKPaymentMerchantSession *merchantSession;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMerchantSession merchantSessionIdentifier](self->_merchantSession, "merchantSessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("merchantSessionId"));

  -[PKPaymentMerchantSession merchantIdentifier](self->_merchantSession, "merchantIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("merchantId"));

  -[PKPaymentMerchantSession initiative](self->_merchantSession, "initiative");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  merchantSession = self->_merchantSession;
  if (v6)
  {
    -[PKPaymentMerchantSession initiative](merchantSession, "initiative");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("initiative"));

    -[PKPaymentMerchantSession initiativeContext](self->_merchantSession, "initiativeContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
    -[PKPaymentMerchantSession initiativeContext](self->_merchantSession, "initiativeContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("initiativeContext");
  }
  else
  {
    -[PKPaymentMerchantSession domain](merchantSession, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("domainName");
  }
  objc_msgSend(v3, "setObject:forKey:", v10, v11);

LABEL_6:
  -[PKPaymentRewrapRequestBase wrappedPayment](self, "wrappedPayment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "enrollmentSignature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "hexEncoding");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("enrollmentSignature"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentCompleteSessionRequest;
  -[PKPaymentRewrapRequestBase bodyDictionary](&v18, sel_bodyDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v15);

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
}

- (PKPaymentMerchantSession)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
  objc_storeStrong((id *)&self->_merchantSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantSession, 0);
}

@end
