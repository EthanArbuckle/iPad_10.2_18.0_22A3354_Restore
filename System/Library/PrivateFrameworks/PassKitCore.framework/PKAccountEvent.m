@implementation PKAccountEvent

+ (id)eventIdentifierFromRecordName:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("event-"), &stru_1E2ADF4C0);
}

+ (int64_t)accountEventTypeFromRecord:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  int64_t v9;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  objc_msgSend(v3, "recordType");
  v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("AccountEvent");
  if (v5 == v6)
  {

    goto LABEL_8;
  }
  v7 = v6;
  if (!v5 || !v6)
  {

    v9 = 0;
    goto LABEL_10;
  }
  v8 = -[__CFString isEqualToString:](v5, "isEqualToString:", v6);

  if (v8)
  {
LABEL_8:
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("type"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = PKAccountEventTypeFromString(v5);
LABEL_10:

    goto LABEL_11;
  }
LABEL_6:
  v9 = 0;
LABEL_11:

  return v9;
}

+ (id)accountIdentifierFromRecord:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_10;
  objc_msgSend(v3, "recordType");
  v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("AccountEvent");
  if (v5 == v6)
  {

  }
  else
  {
    v7 = v6;
    if (!v5 || !v6)
    {

LABEL_10:
      v9 = 0;
      goto LABEL_11;
    }
    v8 = -[__CFString isEqualToString:](v5, "isEqualToString:", v6);

    if (!v8)
      goto LABEL_10;
  }
  objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v9;
}

- (id)recordName
{
  return (id)objc_msgSend((id)objc_opt_class(), "recordNameForEventIdentifier:", self->_identifier);
}

+ (id)recordNameForEventIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "recordNamePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addUpdateReasons:(unint64_t)a3
{
  self->_updateReasons |= a3;
}

- (BOOL)updateReasonIsInitialDownload
{
  return (self->_updateReasons & 3) != 0;
}

- (id)updateReasonsDescription
{
  id v3;
  unint64_t updateReasons;
  int v5;
  unint64_t i;
  const __CFString *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  updateReasons = self->_updateReasons;
  if (updateReasons)
  {
    v5 = 1;
    for (i = 1; i <= updateReasons; i = 1 << v5++)
    {
      if ((i & updateReasons) != 0)
      {
        if (i == 1)
        {
          v7 = CFSTR("InitialCloudKitSync");
          goto LABEL_8;
        }
        if (i == 2)
        {
          v7 = CFSTR("FetchAllRecords");
LABEL_8:
          objc_msgSend(v3, "addObject:", v7);
          updateReasons = self->_updateReasons;
        }
      }
    }
  }
  objc_msgSend(v3, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountEvent)initWithCoder:(id)a3
{
  id v4;
  PKAccountEvent *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *accountIdentifier;
  uint64_t v10;
  NSString *altDSID;
  uint64_t v12;
  NSDate *date;
  uint64_t v14;
  NSDate *expirationDate;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSSet *items;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKAccountEvent;
  v5 = -[PKAccountEvent init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v10 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v12 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v14;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_blockNotification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blockNotification"));
    v35 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    v33 = objc_opt_class();
    v32 = objc_opt_class();
    v31 = objc_opt_class();
    v30 = objc_opt_class();
    v29 = objc_opt_class();
    v28 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v34, v33, v32, v31, v30, v29, v28, v16, v17, v18, v19, v20, v21, v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("items"));
    v25 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSSet *)v25;

    v5->_updateReasons = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("updateReasons"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_blockNotification, CFSTR("blockNotification"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_items, CFSTR("items"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_updateReasons, CFSTR("updateReasons"));

}

- (PKAccountEvent)initWithCloudStoreCoder:(id)a3
{
  id v4;
  PKAccountEvent *v5;
  PKAccountEvent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAccountEvent;
  v5 = -[PKAccountEvent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKAccountEvent applyPropertiesFromCloudStoreRecord:](v5, "applyPropertiesFromCloudStoreRecord:", v4);

  return v6;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *identifier;
  NSString *v9;
  NSString *accountIdentifier;
  NSString *v11;
  NSString *altDSID;
  NSDate *v13;
  NSDate *expirationDate;
  NSDate *v15;
  NSDate *date;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  int v26;
  __objc2_class *v27;
  __CFString *v28;
  __CFString *v29;
  int v30;
  __CFString *v31;
  __CFString *v32;
  int v33;
  PKAccountPayment *v34;
  __CFString *v35;
  __CFString *v36;
  int v37;
  unint64_t v38;
  _QWORD *v39;
  __CFString *v40;
  __CFString *v41;
  int v42;
  uint64_t v43;
  __CFString *v44;
  __CFString *v45;
  int v46;
  uint64_t v47;
  __CFString *v48;
  __CFString *v49;
  int v50;
  __CFString *v51;
  __CFString *v52;
  int v53;
  __CFString *v54;
  __CFString *v55;
  int v56;
  __CFString *v57;
  __CFString *v58;
  int v59;
  __CFString *v60;
  __CFString *v61;
  int v62;
  __CFString *v63;
  __CFString *v64;
  int v65;
  __CFString *v66;
  __CFString *v67;
  int v68;
  __CFString *v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  NSSet *items;
  __CFString *v74;
  void *v75;
  id v76;
  PKAccountEvent *v77;
  id obj;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "recordsWithRecordType:", CFSTR("AccountEvent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "pk_encryptedStringForKey:", CFSTR("identifier"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v7;

    objc_msgSend(v6, "pk_encryptedStringForKey:", CFSTR("accountIdentifier"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = v9;

    objc_msgSend(v6, "pk_encryptedStringForKey:", CFSTR("altDSID"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    altDSID = self->_altDSID;
    self->_altDSID = v11;

    objc_msgSend(v6, "pk_encryptedDateForKey:", CFSTR("expirationDate"));
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    expirationDate = self->_expirationDate;
    self->_expirationDate = v13;

    objc_msgSend(v6, "pk_encryptedDateForKey:", CFSTR("date"));
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    date = self->_date;
    self->_date = v15;

    objc_msgSend(v6, "pk_encryptedStringForKey:", CFSTR("type"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    self->_type = PKAccountEventTypeFromString(v17);

    v75 = v6;
    v77 = self;
    self->_blockNotification = objc_msgSend(v6, "pk_encryptedBoolForKey:", CFSTR("blockNotification"));
    v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v76 = v4;
    objc_msgSend(v4, "records");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
    if (!v19)
      goto LABEL_131;
    v20 = v19;
    v21 = *(_QWORD *)v80;
    v74 = CFSTR("AssistanceProgram");
    while (1)
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v80 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v22);
        objc_msgSend(v23, "recordType", v74);
        v24 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24 == CFSTR("Rewards"))
        {

LABEL_13:
          v27 = PKAccountRewards;
          goto LABEL_30;
        }
        if (CFSTR("Rewards") && v24)
        {
          v26 = -[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("Rewards"));

          if (v26)
            goto LABEL_13;
        }
        else
        {

        }
        v28 = v25;
        if (v28 == CFSTR("Statement"))
        {

LABEL_21:
          v27 = PKCreditAccountStatement;
          goto LABEL_30;
        }
        v29 = v28;
        if (CFSTR("Statement") && v25)
        {
          v30 = -[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("Statement"));

          if (v30)
            goto LABEL_21;
        }
        else
        {

        }
        v31 = v29;
        if (v31 == CFSTR("Servicing"))
        {

LABEL_29:
          v27 = PKAccountServicingEvent;
          goto LABEL_30;
        }
        v32 = v31;
        if (CFSTR("Servicing") && v25)
        {
          v33 = -[__CFString isEqualToString:](v31, "isEqualToString:");

          if (v33)
            goto LABEL_29;
        }
        else
        {

        }
        v35 = v32;
        if (v35 == CFSTR("Payment"))
        {

LABEL_42:
          v34 = -[PKAccountPayment initWithRecord:]([PKAccountPayment alloc], "initWithRecord:", v23);
          v38 = -[PKAccountEvent type](v77, "type") - 5;
          if (v38 <= 3)
          {
            v39 = &unk_1904560A0;
            goto LABEL_53;
          }
LABEL_31:
          objc_msgSend(v18, "addObject:", v34);
LABEL_32:

          goto LABEL_33;
        }
        v36 = v35;
        if (CFSTR("Payment") && v25)
        {
          v37 = -[__CFString isEqualToString:](v35, "isEqualToString:");

          if (v37)
            goto LABEL_42;
        }
        else
        {

        }
        v40 = v36;
        if (v40 == CFSTR("Transfer"))
        {

LABEL_51:
          v34 = -[PKAccountTransfer initWithRecord:]([PKAccountTransfer alloc], "initWithRecord:", v23);
          v38 = -[PKAccountEvent type](v77, "type") - 19;
          if (v38 > 5)
            goto LABEL_31;
          v39 = &unk_1904560C0;
LABEL_53:
          v43 = v39[v38];
LABEL_54:
          -[PKAccountPayment setState:](v34, "setState:", v43);
          goto LABEL_31;
        }
        v41 = v40;
        if (CFSTR("Transfer") && v25)
        {
          v42 = -[__CFString isEqualToString:](v40, "isEqualToString:");

          if (v42)
            goto LABEL_51;
        }
        else
        {

        }
        v44 = v41;
        if (v44 == CFSTR("AccountHold"))
        {

LABEL_62:
          v34 = -[PKAccountHold initWithRecord:]([PKAccountHold alloc], "initWithRecord:", v23);
          v47 = -[PKAccountEvent type](v77, "type");
          if (v47 == 25)
          {
            v43 = 1;
          }
          else
          {
            if (v47 != 26)
              goto LABEL_31;
            v43 = 2;
          }
          goto LABEL_54;
        }
        v45 = v44;
        if (CFSTR("AccountHold") && v25)
        {
          v46 = -[__CFString isEqualToString:](v44, "isEqualToString:");

          if (v46)
            goto LABEL_62;
        }
        else
        {

        }
        v48 = v45;
        if (v48 == CFSTR("PaymentReminder"))
        {

LABEL_73:
          v27 = PKAccountPaymentReminder;
LABEL_30:
          v34 = (PKAccountPayment *)objc_msgSend([v27 alloc], "initWithRecord:", v23);
          goto LABEL_31;
        }
        v49 = v48;
        if (CFSTR("PaymentReminder") && v25)
        {
          v50 = -[__CFString isEqualToString:](v48, "isEqualToString:");

          if (v50)
            goto LABEL_73;
        }
        else
        {

        }
        v51 = v49;
        if (v51 == CFSTR("CreditTermsUpdate"))
        {

LABEL_81:
          v27 = PKAccountCreditTermsUpdate;
          goto LABEL_30;
        }
        v52 = v51;
        if (CFSTR("CreditTermsUpdate") && v25)
        {
          v53 = -[__CFString isEqualToString:](v51, "isEqualToString:");

          if (v53)
            goto LABEL_81;
        }
        else
        {

        }
        v54 = v52;
        if (v54 == CFSTR("PhysicalCardStatusUpdate"))
        {

LABEL_89:
          v27 = PKAccountPhysicalCardStatusUpdate;
          goto LABEL_30;
        }
        v55 = v54;
        if (CFSTR("PhysicalCardStatusUpdate") && v25)
        {
          v56 = -[__CFString isEqualToString:](v54, "isEqualToString:");

          if (v56)
            goto LABEL_89;
        }
        else
        {

        }
        v57 = v55;
        if (v57 == CFSTR("PhysicalCardShippingUpdate"))
        {

LABEL_97:
          v27 = PKAccountPhysicalCardShippingUpdate;
          goto LABEL_30;
        }
        v58 = v57;
        if (CFSTR("PhysicalCardShippingUpdate") && v25)
        {
          v59 = -[__CFString isEqualToString:](v57, "isEqualToString:");

          if (v59)
            goto LABEL_97;
        }
        else
        {

        }
        v60 = v58;
        if (v60 == CFSTR("VirtualCardStatusUpdate"))
        {

LABEL_105:
          v27 = PKAccountVirtualCardStatusUpdate;
          goto LABEL_30;
        }
        v61 = v60;
        if (CFSTR("VirtualCardStatusUpdate") && v25)
        {
          v62 = -[__CFString isEqualToString:](v60, "isEqualToString:");

          if (v62)
            goto LABEL_105;
        }
        else
        {

        }
        v63 = v61;
        if (v63 == CFSTR("BillPaymentSelectedSuggestedAmount"))
        {

LABEL_113:
          v27 = PKBillPaymentSelectedSuggestedAmountData;
          goto LABEL_30;
        }
        v64 = v63;
        if (CFSTR("BillPaymentSelectedSuggestedAmount") && v25)
        {
          v65 = -[__CFString isEqualToString:](v63, "isEqualToString:");

          if (v65)
            goto LABEL_113;
        }
        else
        {

        }
        v66 = v64;
        if (v66 == CFSTR("UserInfo"))
        {

LABEL_121:
          v27 = PKAccountUserInfoUpdate;
          goto LABEL_30;
        }
        v67 = v66;
        if (CFSTR("UserInfo") && v25)
        {
          v68 = -[__CFString isEqualToString:](v66, "isEqualToString:");

          if (v68)
            goto LABEL_121;
        }
        else
        {

        }
        v69 = v67;
        if (v69 == v74)
        {

LABEL_129:
          v27 = PKAccountAssistanceProgramMessage;
          goto LABEL_30;
        }
        v34 = (PKAccountPayment *)v69;
        if (!v74 || !v25)
          goto LABEL_32;
        v70 = -[__CFString isEqualToString:](v69, "isEqualToString:");

        if (v70)
          goto LABEL_129;
LABEL_33:

        ++v22;
      }
      while (v20 != v22);
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
      v20 = v71;
      if (!v71)
      {
LABEL_131:

        v72 = objc_msgSend(v18, "copy");
        items = v77->_items;
        v77->_items = (NSSet *)v72;

        v6 = v75;
        v4 = v76;
        break;
      }
    }
  }

}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  if (a4 - 1 <= 1)
    -[PKAccountEvent _encodeServerDataForCloudStoreCoder:](self, "_encodeServerDataForCloudStoreCoder:", a3);
}

- (void)_encodeServerDataForCloudStoreCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKAccountEvent *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSSet *obj;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  objc_msgSend(v27, "recordsWithRecordType:", CFSTR("AccountEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "encryptedValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v6, "setObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v6, "setObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  objc_msgSend(v6, "setObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v6, "setObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  PKAccountEventTypeToString(self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_blockNotification);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v6;
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("blockNotification"));

  objc_msgSend(v5, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecord:action:", v5, 1);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = self;
  obj = self->_items;
  v12 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
        v17 = objc_alloc(MEMORY[0x1E0C95070]);
        -[PKAccountEvent recordNameForItem:](v11, "recordNameForItem:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "initWithRecordName:zoneID:", v18, v28);

        v20 = objc_alloc(MEMORY[0x1E0C95048]);
        objc_msgSend((id)objc_opt_class(), "recordType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initWithRecordType:recordID:", v21, v19);

        objc_msgSend(v22, "valuesByKey");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKey:", v10, CFSTR("accountEventReference"));

        objc_msgSend(v16, "encodeWithRecord:", v22);
        if (v22)
          objc_msgSend(v27, "addRecord:", v22);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v13);
  }

}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  void *v24;
  _BYTE v25[128];
  const __CFString *v26;
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = CFSTR("AccountEvent");
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "recordNamePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, self->_identifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_items;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
        objc_msgSend((id)objc_opt_class(), "recordType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v15;
        -[PKAccountEvent recordNameForItem:](self, "recordNameForItem:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v17);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v11);
  }

  return v4;
}

- (id)recordNameForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "recordNamePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v5, self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)primaryIdentifier
{
  return self->_identifier;
}

- (unint64_t)itemType
{
  return 5;
}

+ (id)recordNamePrefix
{
  return CFSTR("event-");
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_altDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_expirationDate);
  objc_msgSend(v3, "safelyAddObject:", self->_date);
  objc_msgSend(v3, "safelyAddObject:", self->_items);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_blockNotification - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountEvent *v4;
  PKAccountEvent *v5;
  BOOL v6;

  v4 = (PKAccountEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountEvent isEqualToAccountEvent:](self, "isEqualToAccountEvent:", v5);

  return v6;
}

- (BOOL)isEqualToAccountEvent:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  NSString *accountIdentifier;
  NSString *v9;
  NSString *altDSID;
  NSString *v11;
  NSDate *expirationDate;
  NSDate *v13;
  NSDate *date;
  NSDate *v15;
  NSSet *items;
  NSSet *v17;
  BOOL v18;

  v4 = a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (identifier != v6)
      goto LABEL_36;
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_36;
  }
  accountIdentifier = self->_accountIdentifier;
  v9 = (NSString *)v4[3];
  if (accountIdentifier && v9)
  {
    if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (accountIdentifier != v9)
  {
    goto LABEL_36;
  }
  altDSID = self->_altDSID;
  v11 = (NSString *)v4[4];
  if (altDSID && v11)
  {
    if ((-[NSString isEqual:](altDSID, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (altDSID != v11)
  {
    goto LABEL_36;
  }
  expirationDate = self->_expirationDate;
  v13 = (NSDate *)v4[7];
  if (expirationDate && v13)
  {
    if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (expirationDate != v13)
  {
    goto LABEL_36;
  }
  date = self->_date;
  v15 = (NSDate *)v4[6];
  if (date && v15)
  {
    if ((-[NSDate isEqual:](date, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (date != v15)
  {
    goto LABEL_36;
  }
  items = self->_items;
  v17 = (NSSet *)v4[8];
  if (!items || !v17)
  {
    if (items == v17)
      goto LABEL_34;
LABEL_36:
    v18 = 0;
    goto LABEL_37;
  }
  if ((-[NSSet isEqual:](items, "isEqual:") & 1) == 0)
    goto LABEL_36;
LABEL_34:
  if (self->_type != v4[5])
    goto LABEL_36;
  v18 = self->_blockNotification == *((unsigned __int8 *)v4 + 8);
LABEL_37:

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("account identifier: '%@'; "), self->_accountIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("altDSID: '%@'; "), self->_altDSID);
  PKAccountEventTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v4);

  -[NSDate description](self->_date, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("date: '%@'; "), v5);

  -[NSDate description](self->_expirationDate, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("expiration date: '%@'; "), v6);

  -[NSSet description](self->_items, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("items: '%@'; "), v7);

  if (self->_blockNotification)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("blockNotification: '%@'; "), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (BOOL)blockNotification
{
  return self->_blockNotification;
}

- (void)setBlockNotification:(BOOL)a3
{
  self->_blockNotification = a3;
}

- (NSSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (unint64_t)updateReasons
{
  return self->_updateReasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
