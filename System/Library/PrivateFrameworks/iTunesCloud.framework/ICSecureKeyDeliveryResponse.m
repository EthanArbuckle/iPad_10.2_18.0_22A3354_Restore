@implementation ICSecureKeyDeliveryResponse

- (ICSecureKeyDeliveryResponse)initWithResponseDictionary:(id)a3 serverPlaybackContextData:(id)a4
{
  id v6;
  id v7;
  ICSecureKeyDeliveryResponse *v8;
  ICSecureKeyDeliveryResponse *v9;
  uint64_t v10;
  void *v11;
  ICStoreDialogResponse *v12;
  ICStoreDialogResponse *dialog;
  uint64_t v14;
  uint64_t v15;
  NSError *serverError;
  NSData *v17;
  NSData *contentKeyContextData;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  NSDate *renewalDate;
  double v27;
  uint64_t v28;
  NSDate *rentalExpirationDate;
  double v30;
  uint64_t v31;
  NSDate *rentalPlaybackStartDate;
  int v34;
  ICSecureKeyDeliveryResponse *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[ICSecureKeyDeliveryResponse init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serverPlaybackContextData, a4);
    v10 = objc_msgSend(v6, "ic_integerValueForKey:", CFSTR("status"));
    v9->_status = v10;
    if (v10)
    {
      objc_msgSend(v6, "ic_dictionaryValueForKey:", CFSTR("dialog"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = -[ICStoreDialogResponse initWithResponseDictionary:]([ICStoreDialogResponse alloc], "initWithResponseDictionary:", v11);
        dialog = v9->_dialog;
        v9->_dialog = v12;

      }
      v14 = objc_msgSend(v6, "ic_integerValueForKey:", CFSTR("failureType"));
      v9->_failureType = v14;
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICStoreServerError"), v14, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        serverError = v9->_serverError;
        v9->_serverError = (NSError *)v15;

      }
      v9->_bulkRefreshWaitInterval = (int)objc_msgSend(v6, "ic_intValueForKey:", CFSTR("download-repair-wait"));
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("ckc"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v17 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v11, 0);
    }
    else
    {
      if (!_NSIsNSData())
        goto LABEL_13;
      v17 = v11;
    }
    contentKeyContextData = v9->_contentKeyContextData;
    v9->_contentKeyContextData = v17;

LABEL_13:
    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "secureKeyRenewalTimeOverride");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "longLongValue"))
    {
      v21 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v34 = 138543618;
        v35 = v9;
        v36 = 2114;
        v37 = v20;
        _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]: [SKD] - using secure key renewalTime override: %{public}@", (uint8_t *)&v34, 0x16u);
      }

      v22 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v20, "doubleValue");
      v23 = v22;
    }
    else
    {
      objc_msgSend(v6, "ic_doubleValueForKey:", CFSTR("renew-after"));
      if (v24 == 0.0)
      {
LABEL_20:
        objc_msgSend(v6, "ic_doubleValueForKey:", CFSTR("expiration-time"));
        if (v27 != 0.0)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v27 / 1000.0);
          v28 = objc_claimAutoreleasedReturnValue();
          rentalExpirationDate = v9->_rentalExpirationDate;
          v9->_rentalExpirationDate = (NSDate *)v28;

        }
        objc_msgSend(v6, "ic_doubleValueForKey:", CFSTR("playback-start-time"));
        if (v30 != 0.0)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v30 / 1000.0);
          v31 = objc_claimAutoreleasedReturnValue();
          rentalPlaybackStartDate = v9->_rentalPlaybackStartDate;
          v9->_rentalPlaybackStartDate = (NSDate *)v31;

        }
        v9->_bulkRefreshWaitInterval = (int)objc_msgSend(v6, "ic_intValueForKey:", CFSTR("download-repair-wait"));

        goto LABEL_25;
      }
      v23 = (void *)MEMORY[0x1E0C99D68];
    }
    objc_msgSend(v23, "dateWithTimeIntervalSinceNow:");
    v25 = objc_claimAutoreleasedReturnValue();
    renewalDate = v9->_renewalDate;
    v9->_renewalDate = (NSDate *)v25;

    goto LABEL_20;
  }
LABEL_26:

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternalBuild");
  if (v6)
  {
    -[ICSecureKeyDeliveryResponse contentKeyContextData](self, "contentKeyContextData");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("<redacted>");
  }
  -[ICSecureKeyDeliveryResponse renewalDate](self, "renewalDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p (ckc:%@, renewalDate:%@)>"), v4, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  return v9;
}

- (void)finishAssetResourceLoadingRequest:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[ICSecureKeyDeliveryResponse renewalDate](self, "renewalDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v12, "contentInformationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRenewalDate:", v7);

  }
  objc_msgSend(v12, "dataRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSecureKeyDeliveryResponse contentKeyContextData](self, "contentKeyContextData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "respondWithData:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "respondWithData:", v11);

  }
  if (v6)
    objc_msgSend(v12, "finishLoadingWithError:", v6);
  else
    objc_msgSend(v12, "finishLoading");

}

- (ICStoreDialogResponse)dialog
{
  return self->_dialog;
}

- (void)setDialog:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSError)serverError
{
  return self->_serverError;
}

- (void)setServerError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)bulkRefreshWaitInterval
{
  return self->_bulkRefreshWaitInterval;
}

- (void)setBulkRefreshWaitInterval:(unint64_t)a3
{
  self->_bulkRefreshWaitInterval = a3;
}

- (NSDate)rentalExpirationDate
{
  return self->_rentalExpirationDate;
}

- (void)setRentalExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)rentalPlaybackStartDate
{
  return self->_rentalPlaybackStartDate;
}

- (void)setRentalPlaybackStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)renewalDate
{
  return self->_renewalDate;
}

- (void)setRenewalDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)serverPlaybackContextData
{
  return self->_serverPlaybackContextData;
}

- (void)setServerPlaybackContextData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)contentKeyContextData
{
  return self->_contentKeyContextData;
}

- (void)setContentKeyContextData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)failureType
{
  return self->_failureType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentKeyContextData, 0);
  objc_storeStrong((id *)&self->_serverPlaybackContextData, 0);
  objc_storeStrong((id *)&self->_renewalDate, 0);
  objc_storeStrong((id *)&self->_rentalPlaybackStartDate, 0);
  objc_storeStrong((id *)&self->_rentalExpirationDate, 0);
  objc_storeStrong((id *)&self->_serverError, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
}

@end
