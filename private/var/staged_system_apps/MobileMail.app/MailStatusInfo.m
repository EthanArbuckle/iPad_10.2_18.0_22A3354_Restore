@implementation MailStatusInfo

- (BOOL)isEqual:(id)a3
{
  MailStatusInfo *v4;
  uint64_t v5;
  MailStatusInfo *v6;
  id v7;
  unsigned int v8;
  id v9;
  id v10;
  unsigned int v11;
  char v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = (MailStatusInfo *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v5 = objc_opt_class(MailStatusInfo);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = -[MailStatusInfo state](self, "state");
      if (v7 == (id)-[MailStatusInfo state](v6, "state")
        && (v8 = -[MailStatusInfo shouldShowSubtitle](self, "shouldShowSubtitle"),
            v8 == -[MailStatusInfo shouldShowSubtitle](v6, "shouldShowSubtitle"))
        && (v9 = -[MailStatusInfo badgeCount](self, "badgeCount"),
            v9 == (id)-[MailStatusInfo badgeCount](v6, "badgeCount"))
        && (v10 = -[MailStatusInfo unsentCount](self, "unsentCount"),
            v10 == (id)-[MailStatusInfo unsentCount](v6, "unsentCount"))
        && (v11 = -[MailStatusInfo hasAccountError](self, "hasAccountError"),
            v11 == -[MailStatusInfo hasAccountError](v6, "hasAccountError")))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo status](self, "status"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo status](v6, "status"));
        if (EFObjectsAreEqual(v14, v15))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo lastUpdateTime](self, "lastUpdateTime"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo lastUpdateTime](v6, "lastUpdateTime"));
          if (EFObjectsAreEqual(v16, v17))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo progress](self, "progress"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo progress](v6, "progress"));
            if (EFObjectsAreEqual(v18, v19))
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo accountErrorTitle](self, "accountErrorTitle"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo accountErrorTitle](v6, "accountErrorTitle"));
              if (EFObjectsAreEqual(v35, v20))
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo failureReasonDescription](self, "failureReasonDescription"));
                v33 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo failureReasonDescription](v6, "failureReasonDescription"));
                if (EFObjectsAreEqual(v34, v33))
                {
                  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo error](self, "error"));
                  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo error](v6, "error"));
                  if (EFObjectsAreEqual(v32, v31))
                  {
                    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo accountErrorString](self, "accountErrorString"));
                    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo accountErrorString](v6, "accountErrorString"));
                    if (EFObjectsAreEqual(v30, v29))
                    {
                      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo networkingAccountErrorString](self, "networkingAccountErrorString"));
                      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo networkingAccountErrorString](v6, "networkingAccountErrorString"));
                      if (EFObjectsAreEqual(v28, v27))
                      {
                        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo iCloudQuotaOfferText](self, "iCloudQuotaOfferText"));
                        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo iCloudQuotaOfferText](v6, "iCloudQuotaOfferText"));
                        if (EFObjectsAreEqual(v26, v25))
                        {
                          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo iCloudQuotaOfferLink](self, "iCloudQuotaOfferLink"));
                          v23 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo iCloudQuotaOfferLink](v6, "iCloudQuotaOfferLink"));
                          if (EFObjectsAreEqual(v24, v23))
                          {
                            v22 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo showQuotaOfferInformationTimestamp](self, "showQuotaOfferInformationTimestamp"));
                            v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo showQuotaOfferInformationTimestamp](v6, "showQuotaOfferInformationTimestamp"));
                            v12 = EFObjectsAreEqual(v22, v21);

                          }
                          else
                          {
                            v12 = 0;
                          }

                        }
                        else
                        {
                          v12 = 0;
                        }

                      }
                      else
                      {
                        v12 = 0;
                      }

                    }
                    else
                    {
                      v12 = 0;
                    }

                  }
                  else
                  {
                    v12 = 0;
                  }

                }
                else
                {
                  v12 = 0;
                }

              }
              else
              {
                v12 = 0;
              }

            }
            else
            {
              v12 = 0;
            }

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showQuotaOfferInformationTimestamp, 0);
  objc_storeStrong((id *)&self->_iCloudQuotaOfferLink, 0);
  objc_storeStrong((id *)&self->_iCloudQuotaOfferText, 0);
  objc_storeStrong((id *)&self->_networkingAccountErrorString, 0);
  objc_storeStrong((id *)&self->_accountErrorString, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_failureReasonDescription, 0);
  objc_storeStrong((id *)&self->_accountErrorTitle, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (NSString)ef_publicDescription
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  _BOOL8 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v15 = objc_opt_class(self);
  v3 = -[MailStatusInfo state](self, "state");
  v4 = objc_claimAutoreleasedReturnValue(-[MailStatusInfo status](self, "status"));
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_100531B00;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo lastUpdateTime](self, "lastUpdateTime"));
  v8 = -[MailStatusInfo shouldShowSubtitle](self, "shouldShowSubtitle");
  v9 = +[EFPrivacy bucketMessageCount:](EFPrivacy, "bucketMessageCount:", -[MailStatusInfo badgeCount](self, "badgeCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo progress](self, "progress"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo accountErrorString](self, "accountErrorString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo networkingAccountErrorString](self, "networkingAccountErrorString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> state:%ld status:%@ lastUpdateTime:%@ shouldShowSubtitle:%d badgeCount:%u progress:%@ accountErrorString:%@ networkingErrorString:%@"), v15, self, v3, v6, v7, v8, v9, v10, v11, v12));

  return (NSString *)v13;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)status
{
  return self->_status;
}

- (BOOL)shouldShowSubtitle
{
  return self->_shouldShowSubtitle;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSAttributedString)networkingAccountErrorString
{
  return self->_networkingAccountErrorString;
}

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (int64_t)badgeCount
{
  return self->_badgeCount;
}

- (NSAttributedString)accountErrorString
{
  return self->_accountErrorString;
}

- (int64_t)unsentCount
{
  return self->_unsentCount;
}

- (void)setUnsentCount:(int64_t)a3
{
  self->_unsentCount = a3;
}

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setShouldShowSubtitle:(BOOL)a3
{
  self->_shouldShowSubtitle = a3;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void)setNetworkingAccountErrorString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setLastUpdateTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdateTime, a3);
}

- (void)setICloudQuotaOfferText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setICloudQuotaOfferLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setHasAccountError:(BOOL)a3
{
  self->_hasAccountError = a3;
}

- (void)setBadgeCount:(int64_t)a3
{
  self->_badgeCount = a3;
}

- (void)setAccountErrorString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSAttributedString)iCloudQuotaOfferText
{
  return self->_iCloudQuotaOfferText;
}

- (NSAttributedString)iCloudQuotaOfferLink
{
  return self->_iCloudQuotaOfferLink;
}

- (BOOL)hasAccountError
{
  return self->_hasAccountError;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MailStatusInfo *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = -[MailStatusInfo init](+[MailStatusInfo allocWithZone:](MailStatusInfo, "allocWithZone:", a3), "init");
  -[MailStatusInfo setState:](v4, "setState:", -[MailStatusInfo state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo status](self, "status"));
  v6 = objc_msgSend(v5, "copy");
  -[MailStatusInfo setStatus:](v4, "setStatus:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo lastUpdateTime](self, "lastUpdateTime"));
  v8 = objc_msgSend(v7, "copy");
  -[MailStatusInfo setLastUpdateTime:](v4, "setLastUpdateTime:", v8);

  -[MailStatusInfo setShouldShowSubtitle:](v4, "setShouldShowSubtitle:", -[MailStatusInfo shouldShowSubtitle](self, "shouldShowSubtitle"));
  -[MailStatusInfo setBadgeCount:](v4, "setBadgeCount:", -[MailStatusInfo badgeCount](self, "badgeCount"));
  -[MailStatusInfo setUnsentCount:](v4, "setUnsentCount:", -[MailStatusInfo unsentCount](self, "unsentCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo progress](self, "progress"));
  -[MailStatusInfo setProgress:](v4, "setProgress:", v9);

  -[MailStatusInfo setHasAccountError:](v4, "setHasAccountError:", -[MailStatusInfo hasAccountError](self, "hasAccountError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo accountErrorTitle](self, "accountErrorTitle"));
  -[MailStatusInfo setAccountErrorTitle:](v4, "setAccountErrorTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo failureReasonDescription](self, "failureReasonDescription"));
  -[MailStatusInfo setFailureReasonDescription:](v4, "setFailureReasonDescription:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo error](self, "error"));
  v13 = objc_msgSend(v12, "copy");
  -[MailStatusInfo setError:](v4, "setError:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo accountErrorString](self, "accountErrorString"));
  -[MailStatusInfo setAccountErrorString:](v4, "setAccountErrorString:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo networkingAccountErrorString](self, "networkingAccountErrorString"));
  -[MailStatusInfo setNetworkingAccountErrorString:](v4, "setNetworkingAccountErrorString:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo iCloudQuotaOfferText](self, "iCloudQuotaOfferText"));
  -[MailStatusInfo setICloudQuotaOfferText:](v4, "setICloudQuotaOfferText:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo iCloudQuotaOfferLink](self, "iCloudQuotaOfferLink"));
  -[MailStatusInfo setICloudQuotaOfferLink:](v4, "setICloudQuotaOfferLink:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo showQuotaOfferInformationTimestamp](self, "showQuotaOfferInformationTimestamp"));
  v19 = objc_msgSend(v18, "copy");
  -[MailStatusInfo setShowQuotaOfferInformationTimestamp:](v4, "setShowQuotaOfferInformationTimestamp:", v19);

  return v4;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  unsigned int v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char *v12;

  v3 = -[MailStatusInfo state](self, "state");
  v4 = -[MailStatusInfo badgeCount](self, "badgeCount");
  v5 = -[MailStatusInfo unsentCount](self, "unsentCount");
  v6 = -[MailStatusInfo hasAccountError](self, "hasAccountError");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo status](self, "status"));
  v8 = objc_msgSend(v7, "hash");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo lastUpdateTime](self, "lastUpdateTime"));
  v10 = objc_msgSend(v9, "hash");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo iCloudQuotaOfferText](self, "iCloudQuotaOfferText"));
  v12 = (char *)objc_msgSend(v11, "hash")
      + 33 * ((_QWORD)v10 + 33 * ((_QWORD)v8 + 1185921 * v3 + 35937 * v4 + 1089 * v5 + 33 * v6))
      + 0x9EC41D4E1;

  return (unint64_t)v12;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo ef_publicDescription](self, "ef_publicDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo error](self, "error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" error:%@"), v4));

  return (NSString *)v5;
}

- (NSString)accountErrorTitle
{
  return self->_accountErrorTitle;
}

- (void)setAccountErrorTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)failureReasonDescription
{
  return self->_failureReasonDescription;
}

- (void)setFailureReasonDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSDate)showQuotaOfferInformationTimestamp
{
  return self->_showQuotaOfferInformationTimestamp;
}

- (void)setShowQuotaOfferInformationTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_showQuotaOfferInformationTimestamp, a3);
}

@end
