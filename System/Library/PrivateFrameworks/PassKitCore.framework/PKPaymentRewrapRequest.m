@implementation PKPaymentRewrapRequest

- (id)endpointComponents
{
  id v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[PKPaymentRewrapRequestBase type](self, "type");
  v5 = CFSTR("rewrap");
  switch(v4)
  {
    case 0:
      goto LABEL_7;
    case 1:
      objc_msgSend(v3, "addObject:", CFSTR("rewrap"));
      v5 = CFSTR("payLater");
      goto LABEL_7;
    case 2:
      v5 = CFSTR("issueVirtualCardNumber");
      goto LABEL_7;
    case 3:
      v5 = CFSTR("secureVirtualCardRefresh");
      goto LABEL_7;
    case 4:
      objc_msgSend(v3, "addObject:", CFSTR("rewrap"));
      v5 = CFSTR("issuerInstallment");
      goto LABEL_7;
    case 5:
      objc_msgSend(v3, "addObject:", CFSTR("rewrap"));
      v5 = CFSTR("rewards");
LABEL_7:
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
  NSString *hostApplicationIdentifier;
  NSString *merchantDisplayName;
  void *v9;
  void *v10;
  objc_super v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString dataUsingEncoding:](self->_merchantIdentifier, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SHA256Hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hexEncoding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("merchantId"));
  hostApplicationIdentifier = self->_hostApplicationIdentifier;
  if (hostApplicationIdentifier)
    objc_msgSend(v3, "setObject:forKey:", hostApplicationIdentifier, CFSTR("applicationId"));
  merchantDisplayName = self->_merchantDisplayName;
  if (merchantDisplayName)
    objc_msgSend(v3, "setObject:forKey:", merchantDisplayName, CFSTR("displayName"));
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentRewrapRequest;
  -[PKPaymentRewrapRequestBase bodyDictionary](&v12, sel_bodyDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v9);

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)merchantDisplayName
{
  return self->_merchantDisplayName;
}

- (void)setMerchantDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantDisplayName, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end
