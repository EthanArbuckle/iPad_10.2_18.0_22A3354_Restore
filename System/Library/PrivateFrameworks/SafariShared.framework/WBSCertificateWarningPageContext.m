@implementation WBSCertificateWarningPageContext

+ (BOOL)certificateWarningCannotBeBypassedForTrust:(__SecTrust *)a3
{
  OSStatus TrustResult;
  int v4;
  NSObject *v5;
  SecTrustResultType result;

  result = kSecTrustResultInvalid;
  TrustResult = SecTrustGetTrustResult(a3, &result);
  if (!TrustResult)
    return result == kSecTrustResultFatalTrustFailure || result == kSecTrustResultDeny;
  v4 = TrustResult;
  v5 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[WBSCertificateWarningPageContext certificateWarningCannotBeBypassedForTrust:].cold.1(v4, v5);
  return 1;
}

+ (id)permanentAcceptanceConfirmationTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)permanentAcceptanceConfirmationButtonTitle
{
  return (id)_WBSLocalizedString();
}

+ (int64_t)certificateWarningCategoryForError:(id)a3 trustIncludesRevokedCertificate:(BOOL)a4 clockSkew:(double)a5
{
  id v7;
  void *v8;
  int v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D471A0]);

  v10 = 2;
  if (v9 != 2 && !a4)
  {
    v11 = objc_msgSend(v7, "code");
    objc_msgSend(v7, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_numberForKey:", *MEMORY[0x1E0C93028]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if (v11 == -1201 || v14 == -9814)
    {
      v10 = 4 * (fabs(a5) >= 86400.0);
    }
    else if (v14 == -9843)
    {
      v10 = 3;
    }
    else
    {
      v10 = 1;
    }
  }

  return v10;
}

+ (int64_t)numberOfDaysBetweenCertificateValidityRangeAndNow:(id)a3
{
  id v3;
  double Current;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  int64_t v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v5);
      if ((SecCertificateIsValid() & 1) == 0)
      {
        SecCertificateNotValidAfter();
        if (Current > v9)
        {
          v12 = (Current - v9) / 86400.0;
          if (v12 < 1.0)
            v12 = 1.0;
          goto LABEL_17;
        }
        SecCertificateNotValidBefore();
        if (Current < v10)
        {
          v12 = (Current - v10) / 86400.0;
          if (v12 > -1.0)
            v12 = -1.0;
LABEL_17:
          v11 = (uint64_t)v12;
          goto LABEL_18;
        }
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (WBSCertificateWarningPageContext)init
{

  return 0;
}

- (WBSCertificateWarningPageContext)initWithWarningCategory:(int64_t)a3 failingURL:(id)a4 numberOfDaysInvalid:(int64_t)a5 canGoBack:(BOOL)a6 clockSkew:(double)a7
{
  id v13;
  WBSCertificateWarningPageContext *v14;
  WBSCertificateWarningPageContext *v15;
  WBSCertificateWarningPageContext *v16;
  objc_super v18;

  v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WBSCertificateWarningPageContext;
  v14 = -[WBSCertificateWarningPageContext init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_warningCategory = a3;
    objc_storeStrong((id *)&v14->_failingURL, a4);
    v15->_canGoBack = a6;
    v15->_numberOfDaysInvalid = a5;
    v15->_clockSkew = a7;
    v16 = v15;
  }

  return v15;
}

- (id)initLegacyTLSWarningWithFailingURL:(id)a3 canGoBack:(BOOL)a4
{
  return -[WBSCertificateWarningPageContext initWithWarningCategory:failingURL:numberOfDaysInvalid:canGoBack:clockSkew:](self, "initWithWarningCategory:failingURL:numberOfDaysInvalid:canGoBack:clockSkew:", 5, a3, 0, a4, 0.0);
}

- (id)initPrivateRelayFailClosedNavigationWarningWithFailingURL:(id)a3 isPrivateRelaySetToTrackersAndWebsites:(BOOL)a4 canGoBack:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  WBSCertificateWarningPageContext *v11;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  if (a4)
  {
    v10 = 7;
  }
  else if (objc_msgSend(v8, "safari_isHTTPURL"))
  {
    v10 = 8;
  }
  else
  {
    v10 = 7;
  }
  v11 = -[WBSCertificateWarningPageContext initWithWarningCategory:failingURL:numberOfDaysInvalid:canGoBack:clockSkew:](self, "initWithWarningCategory:failingURL:numberOfDaysInvalid:canGoBack:clockSkew:", v10, v9, 0, v5, 0.0);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCertificateWarningPageContext)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  WBSCertificateWarningPageContext *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WarningCategory"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FailingURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CanGoBack"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NumberOfDaysInvalid"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ClockSkew"));
  v9 = -[WBSCertificateWarningPageContext initWithWarningCategory:failingURL:numberOfDaysInvalid:canGoBack:clockSkew:](self, "initWithWarningCategory:failingURL:numberOfDaysInvalid:canGoBack:clockSkew:", v5, v6, v8, v7);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_warningCategory, CFSTR("WarningCategory"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_failingURL, CFSTR("FailingURL"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_canGoBack, CFSTR("CanGoBack"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_numberOfDaysInvalid, CFSTR("NumberOfDaysInvalid"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ClockSkew"), self->_clockSkew);

}

- (NSString)expiredCerticateDescription
{
  NSString *expiredCertificateDescription;
  NSString *v3;
  void *v6;
  void *v7;
  NSString *v8;
  int64_t numberOfDaysInvalid;
  NSString *v10;

  expiredCertificateDescription = self->_expiredCertificateDescription;
  if (!expiredCertificateDescription)
  {
    if (self->_warningCategory)
    {
      v3 = 0;
      return v3;
    }
    v6 = (void *)MEMORY[0x1E0CB3940];
    if (self->_numberOfDaysInvalid < 1)
    {
      _WBSLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      numberOfDaysInvalid = self->_numberOfDaysInvalid;
      if (numberOfDaysInvalid < 0)
        numberOfDaysInvalid = -numberOfDaysInvalid;
      objc_msgSend(v6, "localizedStringWithFormat:", v7, numberOfDaysInvalid);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _WBSLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringWithFormat:", v7, self->_numberOfDaysInvalid);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v10 = self->_expiredCertificateDescription;
    self->_expiredCertificateDescription = v8;

    expiredCertificateDescription = self->_expiredCertificateDescription;
  }
  v3 = expiredCertificateDescription;
  return v3;
}

- (NSURL)failingURL
{
  return self->_failingURL;
}

- (int64_t)warningCategory
{
  return self->_warningCategory;
}

- (BOOL)canGoBack
{
  return self->_canGoBack;
}

- (int64_t)numberOfDaysInvalid
{
  return self->_numberOfDaysInvalid;
}

- (double)clockSkew
{
  return self->_clockSkew;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failingURL, 0);
  objc_storeStrong((id *)&self->_expiredCertificateDescription, 0);
}

+ (void)certificateWarningCannotBeBypassedForTrust:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "SecTrustGetTrustResult failed with error %d", (uint8_t *)v2, 8u);
}

@end
