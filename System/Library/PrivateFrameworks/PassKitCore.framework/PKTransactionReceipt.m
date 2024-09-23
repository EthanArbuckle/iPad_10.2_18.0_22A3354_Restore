@implementation PKTransactionReceipt

- (PKTransactionReceipt)initWithFileURL:(id)a3
{
  id v5;
  PKTransactionReceipt *v6;
  PKTransactionReceipt *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKTransactionReceipt;
  v6 = -[PKTransactionReceipt init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileURL, a3);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PKTransactionReceipt updateWithBundle:](v7, "updateWithBundle:", v8);
    }
    else
    {

      v7 = 0;
    }

  }
  return v7;
}

- (void)updateWithBundle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *receiptProviderIdentifier;
  NSString *v10;
  NSString *receiptIdentifier;
  NSDecimalNumber *v12;
  NSDecimalNumber *subtotalAmount;
  NSDecimalNumber *v14;
  NSDecimalNumber *totalAmount;
  NSString *v16;
  NSString *currencyCode;
  NSDate *v18;
  NSDate *lastUpdatedDate;
  __CFString *v20;
  __CFString *v21;
  char v22;
  int64_t v23;
  __CFString *v24;
  __CFString *v25;
  int v26;
  NSURL *v27;
  NSURL *supportURL;
  void *v29;
  uint64_t v30;
  id v31;
  NSArray *v32;
  NSArray *headerFields;
  void *v34;
  id v35;
  NSArray *v36;
  NSArray *lineItems;
  void *v38;
  id v39;
  NSArray *v40;
  NSArray *summaryItems;
  void *v42;
  NSData *v43;
  NSData *pdfReceiptData;
  void *v45;
  NSData *v46;
  NSData *htmlReceiptData;
  void *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;

  v49 = a3;
  objc_msgSend(v49, "URLForResource:withExtension:", CFSTR("receipt"), CFSTR("json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "PKStringForKey:", CFSTR("receiptProviderIdentifier"));
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      receiptProviderIdentifier = self->_receiptProviderIdentifier;
      self->_receiptProviderIdentifier = v8;

      objc_msgSend(v7, "PKStringForKey:", CFSTR("receiptIdentifier"));
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      receiptIdentifier = self->_receiptIdentifier;
      self->_receiptIdentifier = v10;

      objc_msgSend(v7, "PKDecimalNumberFromStringForKey:", CFSTR("subtotalAmount"));
      v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      subtotalAmount = self->_subtotalAmount;
      self->_subtotalAmount = v12;

      objc_msgSend(v7, "PKDecimalNumberFromStringForKey:", CFSTR("totalAmount"));
      v14 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      totalAmount = self->_totalAmount;
      self->_totalAmount = v14;

      objc_msgSend(v7, "PKStringForKey:", CFSTR("currencyCode"));
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      currencyCode = self->_currencyCode;
      self->_currencyCode = v16;

      objc_msgSend(v7, "PKDateForKey:", CFSTR("lastUpdatedDate"));
      v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastUpdatedDate = self->_lastUpdatedDate;
      self->_lastUpdatedDate = v18;

      objc_msgSend(v7, "PKStringForKey:", CFSTR("state"));
      v20 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20 != CFSTR("pending"))
      {
        if (v20)
        {
          v22 = -[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("pending"));

          if ((v22 & 1) != 0)
            goto LABEL_7;
          v24 = v21;
          if (v24 == CFSTR("final")
            || (v25 = v24,
                v26 = -[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("final")),
                v25,
                v26))
          {
            v23 = 2;
            goto LABEL_13;
          }
        }
        v23 = 0;
        goto LABEL_13;
      }
LABEL_7:
      v23 = 1;
LABEL_13:

      self->_state = v23;
      objc_msgSend(v7, "PKURLForKey:", CFSTR("supportURL"));
      v27 = (NSURL *)objc_claimAutoreleasedReturnValue();
      supportURL = self->_supportURL;
      self->_supportURL = v27;

      objc_msgSend(v7, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("headerFields"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x1E0C809B0];
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __41__PKTransactionReceipt_updateWithBundle___block_invoke;
      v54[3] = &unk_1E2AC1868;
      v31 = v49;
      v55 = v31;
      objc_msgSend(v29, "pk_arrayByApplyingBlock:", v54);
      v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
      headerFields = self->_headerFields;
      self->_headerFields = v32;

      objc_msgSend(v7, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("lineItems"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v30;
      v52[1] = 3221225472;
      v52[2] = __41__PKTransactionReceipt_updateWithBundle___block_invoke_2;
      v52[3] = &unk_1E2AC1890;
      v35 = v31;
      v53 = v35;
      objc_msgSend(v34, "pk_arrayByApplyingBlock:", v52);
      v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
      lineItems = self->_lineItems;
      self->_lineItems = v36;

      objc_msgSend(v7, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("summaryItems"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v30;
      v50[1] = 3221225472;
      v50[2] = __41__PKTransactionReceipt_updateWithBundle___block_invoke_3;
      v50[3] = &unk_1E2AC18B8;
      v39 = v35;
      v51 = v39;
      objc_msgSend(v38, "pk_arrayByApplyingBlock:", v50);
      v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
      summaryItems = self->_summaryItems;
      self->_summaryItems = v40;

      objc_msgSend(v39, "URLForResource:withExtension:", CFSTR("receipt"), CFSTR("pdf"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v42);
        v43 = (NSData *)objc_claimAutoreleasedReturnValue();
        pdfReceiptData = self->_pdfReceiptData;
        self->_pdfReceiptData = v43;

      }
      objc_msgSend(v39, "URLForResource:withExtension:", CFSTR("receipt"), CFSTR("html"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v45);
        v46 = (NSData *)objc_claimAutoreleasedReturnValue();
        htmlReceiptData = self->_htmlReceiptData;
        self->_htmlReceiptData = v46;

      }
      PKGenerateTransactionReceiptUniqueID(self->_receiptProviderIdentifier, self->_receiptIdentifier);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTransactionReceipt setUniqueID:](self, "setUniqueID:", v48);

    }
  }
LABEL_18:

}

PKTransactionReceiptHeaderField *__41__PKTransactionReceipt_updateWithBundle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKTransactionReceiptHeaderField *v4;

  v3 = a2;
  v4 = -[PKTransactionReceiptHeaderField initWithDictionary:bundle:]([PKTransactionReceiptHeaderField alloc], "initWithDictionary:bundle:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

PKTransactionReceiptLineItem *__41__PKTransactionReceipt_updateWithBundle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PKTransactionReceiptLineItem *v4;

  v3 = a2;
  v4 = -[PKTransactionReceiptLineItem initWithDictionary:bundle:]([PKTransactionReceiptLineItem alloc], "initWithDictionary:bundle:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

PKTransactionReceiptSummaryItem *__41__PKTransactionReceipt_updateWithBundle___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  PKTransactionReceiptSummaryItem *v4;

  v3 = a2;
  v4 = -[PKTransactionReceiptSummaryItem initWithDictionary:bundle:]([PKTransactionReceiptSummaryItem alloc], "initWithDictionary:bundle:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("receiptProviderIdentifier: '%@'; "), self->_receiptProviderIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("receiptIdentifier: '%@'; "), self->_receiptIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdatedDate: '%@'; "), self->_lastUpdatedDate);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("supportURL: '%@'; "), self->_supportURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("subtotalAmount: '%@'; "), self->_subtotalAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalAmount: '%@'; "), self->_totalAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKTransactionReceipt *v4;
  PKTransactionReceipt *v5;
  BOOL v6;

  v4 = (PKTransactionReceipt *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKTransactionReceipt isEqualToTransactionReceipt:](self, "isEqualToTransactionReceipt:", v5);

  return v6;
}

- (BOOL)isEqualToTransactionReceipt:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  NSDate *lastUpdatedDate;
  NSDate *v18;
  NSURL *supportURL;
  NSURL *v20;
  NSDecimalNumber *subtotalAmount;
  NSDecimalNumber *v22;
  NSDecimalNumber *totalAmount;
  NSDecimalNumber *v24;
  void *v25;
  NSString *v26;
  _BOOL4 v27;
  char v28;
  NSArray *headerFields;
  NSArray *v31;
  NSArray *lineItems;
  NSArray *v33;
  NSArray *summaryItems;
  NSArray *v35;
  NSData *htmlReceiptData;
  NSData *v37;
  NSData *pdfReceiptData;
  NSData *v39;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_47;
  v6 = (void *)v4[1];
  v7 = self->_uniqueID;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_46;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_47;
  }
  v11 = (void *)v5[2];
  v7 = self->_receiptProviderIdentifier;
  v12 = v11;
  if (v7 == v12)
  {

  }
  else
  {
    v9 = v12;
    if (!v7 || !v12)
      goto LABEL_46;
    v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_47;
  }
  v14 = (void *)v5[3];
  v7 = self->_receiptIdentifier;
  v15 = v14;
  if (v7 == v15)
  {

  }
  else
  {
    v9 = v15;
    if (!v7 || !v15)
      goto LABEL_46;
    v16 = -[NSString isEqualToString:](v7, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_47;
  }
  lastUpdatedDate = self->_lastUpdatedDate;
  v18 = (NSDate *)v5[4];
  if (lastUpdatedDate && v18)
  {
    if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (lastUpdatedDate != v18)
  {
    goto LABEL_47;
  }
  if (self->_state != v5[6])
    goto LABEL_47;
  supportURL = self->_supportURL;
  v20 = (NSURL *)v5[5];
  if (supportURL && v20)
  {
    if ((-[NSURL isEqual:](supportURL, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (supportURL != v20)
  {
    goto LABEL_47;
  }
  subtotalAmount = self->_subtotalAmount;
  v22 = (NSDecimalNumber *)v5[7];
  if (subtotalAmount && v22)
  {
    if ((-[NSDecimalNumber isEqual:](subtotalAmount, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (subtotalAmount != v22)
  {
    goto LABEL_47;
  }
  totalAmount = self->_totalAmount;
  v24 = (NSDecimalNumber *)v5[8];
  if (totalAmount && v24)
  {
    if ((-[NSDecimalNumber isEqual:](totalAmount, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (totalAmount != v24)
  {
    goto LABEL_47;
  }
  v25 = (void *)v5[9];
  v7 = self->_currencyCode;
  v26 = v25;
  if (v7 == v26)
  {

    goto LABEL_50;
  }
  v9 = v26;
  if (!v7 || !v26)
  {
LABEL_46:

    goto LABEL_47;
  }
  v27 = -[NSString isEqualToString:](v7, "isEqualToString:", v26);

  if (!v27)
    goto LABEL_47;
LABEL_50:
  headerFields = self->_headerFields;
  v31 = (NSArray *)v5[10];
  if (headerFields && v31)
  {
    if ((-[NSArray isEqual:](headerFields, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (headerFields != v31)
  {
    goto LABEL_47;
  }
  lineItems = self->_lineItems;
  v33 = (NSArray *)v5[11];
  if (lineItems && v33)
  {
    if ((-[NSArray isEqual:](lineItems, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (lineItems != v33)
  {
    goto LABEL_47;
  }
  summaryItems = self->_summaryItems;
  v35 = (NSArray *)v5[12];
  if (summaryItems && v35)
  {
    if ((-[NSArray isEqual:](summaryItems, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (summaryItems != v35)
  {
    goto LABEL_47;
  }
  htmlReceiptData = self->_htmlReceiptData;
  v37 = (NSData *)v5[14];
  if (htmlReceiptData && v37)
  {
    if ((-[NSData isEqual:](htmlReceiptData, "isEqual:") & 1) != 0)
      goto LABEL_70;
LABEL_47:
    v28 = 0;
    goto LABEL_48;
  }
  if (htmlReceiptData != v37)
    goto LABEL_47;
LABEL_70:
  pdfReceiptData = self->_pdfReceiptData;
  v39 = (NSData *)v5[13];
  if (pdfReceiptData && v39)
    v28 = -[NSData isEqual:](pdfReceiptData, "isEqual:");
  else
    v28 = pdfReceiptData == v39;
LABEL_48:

  return v28;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_uniqueID);
  objc_msgSend(v3, "safelyAddObject:", self->_receiptProviderIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_receiptIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdatedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_supportURL);
  objc_msgSend(v3, "safelyAddObject:", self->_subtotalAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_totalAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_headerFields);
  objc_msgSend(v3, "safelyAddObject:", self->_lineItems);
  objc_msgSend(v3, "safelyAddObject:", self->_summaryItems);
  objc_msgSend(v3, "safelyAddObject:", self->_htmlReceiptData);
  objc_msgSend(v3, "safelyAddObject:", self->_pdfReceiptData);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_state - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransactionReceipt)initWithCoder:(id)a3
{
  id v4;
  PKTransactionReceipt *v5;
  uint64_t v6;
  NSString *uniqueID;
  uint64_t v8;
  NSString *receiptProviderIdentifier;
  uint64_t v10;
  NSString *receiptIdentifier;
  uint64_t v12;
  NSDate *lastUpdatedDate;
  uint64_t v14;
  NSURL *supportURL;
  uint64_t v16;
  NSDecimalNumber *subtotalAmount;
  uint64_t v18;
  NSDecimalNumber *totalAmount;
  uint64_t v20;
  NSString *currencyCode;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *headerFields;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *lineItems;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *summaryItems;
  uint64_t v37;
  NSData *htmlReceiptData;
  uint64_t v39;
  NSData *pdfReceiptData;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PKTransactionReceipt;
  v5 = -[PKTransactionReceipt init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiptProviderIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    receiptProviderIdentifier = v5->_receiptProviderIdentifier;
    v5->_receiptProviderIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiptIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    receiptIdentifier = v5->_receiptIdentifier;
    v5->_receiptIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    supportURL = v5->_supportURL;
    v5->_supportURL = (NSURL *)v14;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtotalAmount"));
    v16 = objc_claimAutoreleasedReturnValue();
    subtotalAmount = v5->_subtotalAmount;
    v5->_subtotalAmount = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalAmount"));
    v18 = objc_claimAutoreleasedReturnValue();
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (NSDecimalNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v20 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("headerFields"));
    v25 = objc_claimAutoreleasedReturnValue();
    headerFields = v5->_headerFields;
    v5->_headerFields = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("lineItems"));
    v30 = objc_claimAutoreleasedReturnValue();
    lineItems = v5->_lineItems;
    v5->_lineItems = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("summaryItems"));
    v35 = objc_claimAutoreleasedReturnValue();
    summaryItems = v5->_summaryItems;
    v5->_summaryItems = (NSArray *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HTMLReceiptData"));
    v37 = objc_claimAutoreleasedReturnValue();
    htmlReceiptData = v5->_htmlReceiptData;
    v5->_htmlReceiptData = (NSData *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PDFReceiptData"));
    v39 = objc_claimAutoreleasedReturnValue();
    pdfReceiptData = v5->_pdfReceiptData;
    v5->_pdfReceiptData = (NSData *)v39;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueID;
  id v5;

  uniqueID = self->_uniqueID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueID, CFSTR("uniqueID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_receiptProviderIdentifier, CFSTR("receiptProviderIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_receiptIdentifier, CFSTR("receiptIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdatedDate, CFSTR("lastUpdatedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportURL, CFSTR("supportURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtotalAmount, CFSTR("subtotalAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalAmount, CFSTR("totalAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_headerFields, CFSTR("headerFields"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lineItems, CFSTR("lineItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_summaryItems, CFSTR("summaryItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_htmlReceiptData, CFSTR("HTMLReceiptData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pdfReceiptData, CFSTR("PDFReceiptData"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_receiptProviderIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_receiptIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSDate copyWithZone:](self->_lastUpdatedDate, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v5[6] = self->_state;
  v14 = -[NSURL copyWithZone:](self->_supportURL, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_subtotalAmount, "copyWithZone:", a3);
  v17 = (void *)v5[7];
  v5[7] = v16;

  v18 = -[NSDecimalNumber copyWithZone:](self->_totalAmount, "copyWithZone:", a3);
  v19 = (void *)v5[8];
  v5[8] = v18;

  v20 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  v21 = (void *)v5[9];
  v5[9] = v20;

  v22 = -[NSArray copyWithZone:](self->_headerFields, "copyWithZone:", a3);
  v23 = (void *)v5[10];
  v5[10] = v22;

  v24 = -[NSArray copyWithZone:](self->_lineItems, "copyWithZone:", a3);
  v25 = (void *)v5[11];
  v5[11] = v24;

  v26 = -[NSArray copyWithZone:](self->_summaryItems, "copyWithZone:", a3);
  v27 = (void *)v5[12];
  v5[12] = v26;

  v28 = -[NSData copyWithZone:](self->_htmlReceiptData, "copyWithZone:", a3);
  v29 = (void *)v5[14];
  v5[14] = v28;

  v30 = -[NSData copyWithZone:](self->_pdfReceiptData, "copyWithZone:", a3);
  v31 = (void *)v5[13];
  v5[13] = v30;

  return v5;
}

- (PKCurrencyAmount)subtotalCurrencyAmount
{
  NSDecimalNumber *subtotalAmount;
  NSString *currencyCode;

  subtotalAmount = self->_subtotalAmount;
  if (subtotalAmount)
  {
    currencyCode = self->_currencyCode;
    if (currencyCode)
    {
      PKCurrencyAmountCreate(subtotalAmount, currencyCode, 0);
      subtotalAmount = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      subtotalAmount = 0;
    }
  }
  return (PKCurrencyAmount *)subtotalAmount;
}

- (PKCurrencyAmount)totalCurrencyAmount
{
  NSDecimalNumber *totalAmount;
  NSString *currencyCode;

  totalAmount = self->_totalAmount;
  if (totalAmount)
  {
    currencyCode = self->_currencyCode;
    if (currencyCode)
    {
      PKCurrencyAmountCreate(totalAmount, currencyCode, 0);
      totalAmount = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      totalAmount = 0;
    }
  }
  return (PKCurrencyAmount *)totalAmount;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)receiptProviderIdentifier
{
  return self->_receiptProviderIdentifier;
}

- (void)setReceiptProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)receiptIdentifier
{
  return self->_receiptIdentifier;
}

- (void)setReceiptIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, a3);
}

- (NSURL)supportURL
{
  return self->_supportURL;
}

- (void)setSupportURL:(id)a3
{
  objc_storeStrong((id *)&self->_supportURL, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDecimalNumber)subtotalAmount
{
  return self->_subtotalAmount;
}

- (void)setSubtotalAmount:(id)a3
{
  objc_storeStrong((id *)&self->_subtotalAmount, a3);
}

- (NSDecimalNumber)totalAmount
{
  return self->_totalAmount;
}

- (void)setTotalAmount:(id)a3
{
  objc_storeStrong((id *)&self->_totalAmount, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)headerFields
{
  return self->_headerFields;
}

- (NSArray)lineItems
{
  return self->_lineItems;
}

- (NSArray)summaryItems
{
  return self->_summaryItems;
}

- (NSData)pdfReceiptData
{
  return self->_pdfReceiptData;
}

- (NSData)htmlReceiptData
{
  return self->_htmlReceiptData;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_htmlReceiptData, 0);
  objc_storeStrong((id *)&self->_pdfReceiptData, 0);
  objc_storeStrong((id *)&self->_summaryItems, 0);
  objc_storeStrong((id *)&self->_lineItems, 0);
  objc_storeStrong((id *)&self->_headerFields, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
  objc_storeStrong((id *)&self->_subtotalAmount, 0);
  objc_storeStrong((id *)&self->_supportURL, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_receiptIdentifier, 0);
  objc_storeStrong((id *)&self->_receiptProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
