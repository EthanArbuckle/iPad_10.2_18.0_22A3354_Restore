@implementation ICMusicSubscriptionCarrierBundlingEligibilityResponse

- (ICMusicSubscriptionCarrierBundlingEligibilityResponse)initWithEligibilityDictionary:(id)a3 cellularProviderName:(id)a4 phoneNumber:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICMusicSubscriptionCarrierBundlingEligibilityResponse *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __CFString **v15;
  id v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  NSError *error;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSString *headerEnrichmentMessage;
  void *v30;
  uint64_t v31;
  NSString *headerEnrichmentSessionIdentifier;
  uint64_t v33;
  uint64_t v34;
  NSURL *headerEnrichmentURL;
  void *v36;
  uint64_t v37;
  NSString *silentSMSMessage;
  void *v39;
  uint64_t v40;
  NSString *silentSMSNumber;
  void *v42;
  uint64_t v43;
  NSString *SMSSessionIdentifier;
  void *v45;
  double v46;
  void *v47;
  uint64_t v48;
  NSString *cellularProviderName;
  uint64_t v50;
  NSString *phoneNumber;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  __CFString *v60;
  objc_super v61;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v61.receiver = self;
  v61.super_class = (Class)ICMusicSubscriptionCarrierBundlingEligibilityResponse;
  v11 = -[ICMusicSubscriptionCarrierBundlingEligibilityResponse init](&v61, sel_init);
  if (!v11)
    goto LABEL_55;
  objc_msgSend(v8, "objectForKey:", CFSTR("failureType"));
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("status"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("errorCode"));
  v14 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v14;
  v56 = v13;
  v58 = v10;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v13, "integerValue"))
  {
    v15 = &ICStoreServerErrorDomain;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = &ICStoreServerErrorDomain;
    v13 = (void *)v12;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v17 = 0;
      goto LABEL_12;
    }
    v15 = &ICMusicSubscriptionCarrierBundlingServerErrorDomain;
    v13 = (void *)v14;
  }
  v16 = v13;
  v17 = *v15;
  if (!v16)
  {
LABEL_12:
    objc_msgSend(v8, "objectForKey:", CFSTR("fuseCarrierBundleStatus"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v21 = objc_msgSend(v16, "integerValue");
    }
    else
    {
      v59 = v17;
      objc_msgSend(v8, "objectForKey:", CFSTR("checkBack"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("startFuseHeaderEnrichment"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("startFuseManualSms"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("hasFuseCarrierBundleSubscription"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v22, "BOOLValue") & 1) != 0)
      {
        v21 = 6;
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v25, "BOOLValue") & 1) != 0)
      {
        v21 = 1;
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v24, "BOOLValue") & 1) != 0)
      {
        v21 = 5;
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (objc_msgSend(v23, "BOOLValue"))
          v21 = 4;
        else
          v21 = 2;
      }
      else
      {
        v21 = 2;
      }

      v17 = v59;
    }
    switch(v21)
    {
      case 1:
        v26 = 1;
        goto LABEL_35;
      case 2:
        v26 = 3;
        goto LABEL_35;
      case 3:
        v11->_carrierBundlingStatusType = 0;
        goto LABEL_38;
      case 4:
        v11->_carrierBundlingStatusType = 0;
        v11->_needsHeaderEnrichment = 1;
        goto LABEL_38;
      case 5:
        v26 = 4;
LABEL_35:
        v11->_carrierBundlingStatusType = v26;
        break;
      case 6:
        v11->_carrierBundlingStatusType = 0;
        v11->_wantsDelayedRetry = 1;
        break;
      case 7:
        v11->_carrierBundlingStatusType = 0;
        v11->_needsSilentSMS = 1;
        break;
      default:
        goto LABEL_38;
    }
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v17, objc_msgSend(v16, "integerValue"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7601, v18, CFSTR("Eligibility response not valid %@"), v8);
  v19 = objc_claimAutoreleasedReturnValue();
  error = v11->_error;
  v11->_error = (NSError *)v19;

LABEL_38:
  objc_msgSend(v8, "objectForKey:", CFSTR("fuseHeaderEnrichmentMessage"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v28 = objc_msgSend(v27, "copy");
    headerEnrichmentMessage = v11->_headerEnrichmentMessage;
    v11->_headerEnrichmentMessage = (NSString *)v28;

  }
  objc_msgSend(v8, "objectForKey:", CFSTR("fuseHeaderEnrichmentSessionId"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v31 = objc_msgSend(v30, "copy");
    headerEnrichmentSessionIdentifier = v11->_headerEnrichmentSessionIdentifier;
    v11->_headerEnrichmentSessionIdentifier = (NSString *)v31;

  }
  objc_msgSend(v8, "objectForKey:", CFSTR("fuseHeaderEnrichmentUrl"));
  v33 = objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    headerEnrichmentURL = v11->_headerEnrichmentURL;
    v11->_headerEnrichmentURL = (NSURL *)v34;

  }
  v53 = (void *)v33;
  objc_msgSend(v8, "objectForKey:", CFSTR("fuseSilentSMSMessage"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v37 = objc_msgSend(v36, "copy");
    silentSMSMessage = v11->_silentSMSMessage;
    v11->_silentSMSMessage = (NSString *)v37;

  }
  v60 = v17;
  objc_msgSend(v8, "objectForKey:", CFSTR("fuseSilentSMSNumber"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v40 = objc_msgSend(v39, "copy");
    silentSMSNumber = v11->_silentSMSNumber;
    v11->_silentSMSNumber = (NSString *)v40;

  }
  v54 = v27;
  objc_msgSend(v8, "objectForKey:", CFSTR("fuseSmsSessionId"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v43 = objc_msgSend(v42, "copy");
    SMSSessionIdentifier = v11->_SMSSessionIdentifier;
    v11->_SMSSessionIdentifier = (NSString *)v43;

  }
  v57 = (void *)v12;
  objc_msgSend(v8, "objectForKey:", CFSTR("waitTime"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v45, "doubleValue");
    v11->_delayInterval = v46 / 1000.0;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("isFamily"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11->_familySubscription = objc_msgSend(v47, "BOOLValue");
  v48 = objc_msgSend(v9, "copy");
  cellularProviderName = v11->_cellularProviderName;
  v11->_cellularProviderName = (NSString *)v48;

  v10 = v58;
  v50 = objc_msgSend(v58, "copy");
  phoneNumber = v11->_phoneNumber;
  v11->_phoneNumber = (NSString *)v50;

LABEL_55:
  return v11;
}

- (int64_t)carrierBundlingStatusType
{
  return self->_carrierBundlingStatusType;
}

- (BOOL)isFamilySubscription
{
  return self->_familySubscription;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)SMSSessionIdentifier
{
  return self->_SMSSessionIdentifier;
}

- (double)delayInterval
{
  return self->_delayInterval;
}

- (BOOL)wantsDelayedRetry
{
  return self->_wantsDelayedRetry;
}

- (NSString)headerEnrichmentMessage
{
  return self->_headerEnrichmentMessage;
}

- (NSString)headerEnrichmentSessionIdentifier
{
  return self->_headerEnrichmentSessionIdentifier;
}

- (NSURL)headerEnrichmentURL
{
  return self->_headerEnrichmentURL;
}

- (BOOL)needsHeaderEnrichment
{
  return self->_needsHeaderEnrichment;
}

- (BOOL)needsSilentSMS
{
  return self->_needsSilentSMS;
}

- (NSString)silentSMSMessage
{
  return self->_silentSMSMessage;
}

- (NSString)silentSMSNumber
{
  return self->_silentSMSNumber;
}

- (NSString)cellularProviderName
{
  return self->_cellularProviderName;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_cellularProviderName, 0);
  objc_storeStrong((id *)&self->_silentSMSNumber, 0);
  objc_storeStrong((id *)&self->_silentSMSMessage, 0);
  objc_storeStrong((id *)&self->_headerEnrichmentURL, 0);
  objc_storeStrong((id *)&self->_headerEnrichmentSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_headerEnrichmentMessage, 0);
  objc_storeStrong((id *)&self->_SMSSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
