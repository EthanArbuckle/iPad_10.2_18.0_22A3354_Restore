@implementation PKPeerPaymentMessage

- (PKPeerPaymentMessage)init
{
  return -[PKPeerPaymentMessage initWithType:](self, "initWithType:", 0);
}

- (PKPeerPaymentMessage)initWithType:(unint64_t)a3
{
  id v5;
  PKPeerPaymentMessage *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0CC6948]);
  v6 = -[PKPeerPaymentMessage initWithType:session:](self, "initWithType:session:", a3, v5);

  return v6;
}

- (PKPeerPaymentMessage)initWithType:(unint64_t)a3 session:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  PKPeerPaymentMessage *v10;

  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0CC6930]);
  v8 = v6;
  if (!v6)
    v8 = objc_alloc_init(MEMORY[0x1E0CC6948]);
  v9 = (void *)objc_msgSend(v7, "initWithSession:", v8);
  v10 = -[PKPeerPaymentMessage initWithUnderlyingMessage:](self, "initWithUnderlyingMessage:", v9);

  if (!v6)
  {

    if (!v10)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v10)
LABEL_5:
    -[PKPeerPaymentMessage setType:](v10, "setType:", a3);
LABEL_6:

  return v10;
}

- (PKPeerPaymentMessage)initWithUnderlyingMessage:(id)a3
{
  id v4;
  PKPeerPaymentMessage *v5;
  MSMessage *v6;
  MSMessage *underlyingMessage;
  id *p_underlyingMessage;
  id v9;
  uint64_t v10;
  MSMessage *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PKProtobufPeerPaymentMessage *protoMessage;
  PKProtobufPeerPaymentMessage *v16;
  PKProtobufPeerPaymentMessage *v17;
  PKProtobufPeerPaymentMessage *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentMessage;
  v5 = -[PKPeerPaymentMessage init](&v22, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (MSMessage *)v4;
      p_underlyingMessage = (id *)&v5->_underlyingMessage;
      underlyingMessage = v5->_underlyingMessage;
      v5->_underlyingMessage = v6;
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x1E0CC6930]);
      underlyingMessage = (MSMessage *)objc_alloc_init(MEMORY[0x1E0CC6948]);
      v10 = objc_msgSend(v9, "initWithSession:", underlyingMessage);
      p_underlyingMessage = (id *)&v5->_underlyingMessage;
      v11 = v5->_underlyingMessage;
      v5->_underlyingMessage = (MSMessage *)v10;

    }
    objc_msgSend(*p_underlyingMessage, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKPeerPaymentMessageDataWithDataURL();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67510]), "initWithData:", v13);
      protoMessage = v5->_protoMessage;
      v5->_protoMessage = (PKProtobufPeerPaymentMessage *)v14;

    }
    if (!v5->_protoMessage)
    {
      v16 = (PKProtobufPeerPaymentMessage *)objc_alloc_init(MEMORY[0x1E0D67510]);
      v17 = v5->_protoMessage;
      v5->_protoMessage = v16;

      -[PKProtobufPeerPaymentMessage setVersion:](v5->_protoMessage, "setVersion:", 1);
      v18 = v5->_protoMessage;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKProtobufPeerPaymentMessage setIdentifier:](v18, "setIdentifier:", v20);

      -[PKPeerPaymentMessage _updateDataURL](v5, "_updateDataURL");
    }

  }
  return v5;
}

- (NSUUID)identifier
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[PKProtobufPeerPaymentMessage identifier](self->_protoMessage, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  return (NSUUID *)v5;
}

- (unint64_t)type
{
  return (int)-[PKProtobufPeerPaymentMessage type](self->_protoMessage, "type");
}

- (NSString)currency
{
  return (NSString *)-[PKProtobufPeerPaymentMessage currency](self->_protoMessage, "currency");
}

- (NSDecimalNumber)amount
{
  int v3;
  PKProtobufPeerPaymentMessage *protoMessage;
  void *v5;
  void *v6;

  v3 = -[PKProtobufPeerPaymentMessage hasDecimalAmount](self->_protoMessage, "hasDecimalAmount");
  protoMessage = self->_protoMessage;
  if (v3)
  {
    -[PKProtobufPeerPaymentMessage decimalAmount](protoMessage, "decimalAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKProtoSupportDecimalNumberFromProtobuf();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKProtobufPeerPaymentMessage amount](protoMessage, "amount");
    PKLegacyCurrencyStorageIntegerToDecimal();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDecimalNumber *)v6;
}

- (PKCurrencyAmount)currencyAmount
{
  NSDecimalNumber *v3;
  NSString *v4;
  void *v5;

  -[PKPeerPaymentMessage amount](self, "amount");
  v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessage currency](self, "currency");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (v4 && v3)
  {
    PKCurrencyAmountCreate(v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (PKCurrencyAmount *)v5;
}

- (NSString)senderAddress
{
  return (NSString *)-[PKProtobufPeerPaymentMessage senderAddress](self->_protoMessage, "senderAddress");
}

- (NSString)recipientAddress
{
  return (NSString *)-[PKProtobufPeerPaymentMessage recipientAddress](self->_protoMessage, "recipientAddress");
}

- (id)_requestDeviceScoreIdentifier
{
  void *v2;
  void *v3;

  -[PKProtobufPeerPaymentMessage requestDeviceScoreIdentifier](self->_protoMessage, "requestDeviceScoreIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);
  else
    v3 = 0;

  return v3;
}

- (PKPeerPaymentRequestToken)requestToken
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D67468]);
  -[PKProtobufPeerPaymentMessage requestToken](self->_protoMessage, "requestToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessage _requestDeviceScoreIdentifier](self, "_requestDeviceScoreIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithRequestToken:deviceScoreIdentifier:expiryDate:", v4, v5, 0);

  return (PKPeerPaymentRequestToken *)v6;
}

- (NSString)paymentIdentifier
{
  return (NSString *)-[PKProtobufPeerPaymentMessage paymentIdentifier](self->_protoMessage, "paymentIdentifier");
}

- (NSString)transactionIdentifier
{
  return (NSString *)-[PKProtobufPeerPaymentMessage transactionIdentifier](self->_protoMessage, "transactionIdentifier");
}

- (NSString)memo
{
  return (NSString *)-[PKProtobufPeerPaymentMessage memo](self->_protoMessage, "memo");
}

- (unint64_t)source
{
  return (int)-[PKProtobufPeerPaymentMessage source](self->_protoMessage, "source");
}

- (NSString)recurringPaymentIdentifier
{
  return (NSString *)-[PKProtobufPeerPaymentMessage recurringPaymentIdentifier](self->_protoMessage, "recurringPaymentIdentifier");
}

- (id)recurringPaymentEmoji
{
  return (id)-[PKProtobufPeerPaymentMessage recurringPaymentEmoji](self->_protoMessage, "recurringPaymentEmoji");
}

- (int64_t)recurringPaymentColor
{
  void *v2;

  -[PKProtobufPeerPaymentMessage recurringPaymentColor](self->_protoMessage, "recurringPaymentColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKSemanticColorFromString();

  return 0;
}

- (PKPeerPaymentRecurringPaymentMemo)recurringPaymentMemo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0D67458]);
  -[PKProtobufPeerPaymentMessage recurringPaymentColor](self->_protoMessage, "recurringPaymentColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKSemanticColorFromString();

  -[PKProtobufPeerPaymentMessage memo](self->_protoMessage, "memo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  -[PKProtobufPeerPaymentMessage recurringPaymentEmoji](self->_protoMessage, "recurringPaymentEmoji");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEmoji:", v6);

  objc_msgSend(v3, "setColor:", 0);
  return (PKPeerPaymentRecurringPaymentMemo *)v3;
}

- (NSDate)recurringPaymentStartDate
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[PKProtobufPeerPaymentMessage recurringPaymentStartDate](self->_protoMessage, "recurringPaymentStartDate");
  return (NSDate *)objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
}

- (unint64_t)recurringPaymentFrequency
{
  void *v2;
  unint64_t v3;

  -[PKProtobufPeerPaymentMessage recurringPaymentFrequency](self->_protoMessage, "recurringPaymentFrequency");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKPeerPaymentRecurringPaymentFrequencyFromString();

  return v3;
}

- (void)setType:(unint64_t)a3
{
  -[PKProtobufPeerPaymentMessage setType:](self->_protoMessage, "setType:");
  -[MSMessage setRequiresValidation:](self->_underlyingMessage, "setRequiresValidation:", a3 - 1 < 3);
  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
  -[PKPeerPaymentMessage _updateLayoutContents](self, "_updateLayoutContents");
  -[PKPeerPaymentMessage _updateSummaryText](self, "_updateSummaryText");
}

- (void)setSource:(unint64_t)a3
{
  -[PKProtobufPeerPaymentMessage setSource:](self->_protoMessage, "setSource:", a3);
  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
  -[PKPeerPaymentMessage _updateLayoutContents](self, "_updateLayoutContents");
  -[PKPeerPaymentMessage _updateSummaryText](self, "_updateSummaryText");
}

- (void)setCurrency:(id)a3
{
  -[PKProtobufPeerPaymentMessage setCurrency:](self->_protoMessage, "setCurrency:", a3);
  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
  -[PKPeerPaymentMessage _updateLayoutContents](self, "_updateLayoutContents");
  -[PKPeerPaymentMessage _updateSummaryText](self, "_updateSummaryText");
}

- (void)setAmount:(id)a3
{
  PKProtobufPeerPaymentMessage *protoMessage;
  id v5;
  PKProtobufPeerPaymentMessage *v6;
  void *v7;

  protoMessage = self->_protoMessage;
  v5 = a3;
  -[PKProtobufPeerPaymentMessage setAmount:](protoMessage, "setAmount:", PKCurrencyDecimalToLegacyStorageInteger());
  v6 = self->_protoMessage;
  PKProtoSupportProtoDecimalNumberFromDecimalNumber();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKProtobufPeerPaymentMessage setDecimalAmount:](v6, "setDecimalAmount:", v7);
  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
  -[PKPeerPaymentMessage _updateLayoutContents](self, "_updateLayoutContents");
  -[PKPeerPaymentMessage _updateSummaryText](self, "_updateSummaryText");
}

- (void)setCurrencyAmount:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "currency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessage setCurrency:](self, "setCurrency:", v5);

  objc_msgSend(v4, "amount");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPeerPaymentMessage setAmount:](self, "setAmount:", v6);
}

- (void)setSenderAddress:(id)a3
{
  -[PKProtobufPeerPaymentMessage setSenderAddress:](self->_protoMessage, "setSenderAddress:", a3);
  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
}

- (void)setRecipientAddress:(id)a3
{
  -[PKProtobufPeerPaymentMessage setRecipientAddress:](self->_protoMessage, "setRecipientAddress:", a3);
  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
}

- (void)setRequestToken:(id)a3
{
  PKProtobufPeerPaymentMessage *protoMessage;
  id v5;
  void *v6;
  PKProtobufPeerPaymentMessage *v7;
  void *v8;
  void *v9;

  protoMessage = self->_protoMessage;
  v5 = a3;
  objc_msgSend(v5, "requestToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPeerPaymentMessage setRequestToken:](protoMessage, "setRequestToken:", v6);

  v7 = self->_protoMessage;
  objc_msgSend(v5, "deviceScoreIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPeerPaymentMessage setRequestDeviceScoreIdentifier:](v7, "setRequestDeviceScoreIdentifier:", v9);

  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
}

- (void)setPaymentIdentifier:(id)a3
{
  -[PKProtobufPeerPaymentMessage setPaymentIdentifier:](self->_protoMessage, "setPaymentIdentifier:", a3);
  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
}

- (void)setTransactionIdentifier:(id)a3
{
  -[PKProtobufPeerPaymentMessage setTransactionIdentifier:](self->_protoMessage, "setTransactionIdentifier:", a3);
  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
}

- (void)setMemo:(id)a3
{
  -[PKProtobufPeerPaymentMessage setMemo:](self->_protoMessage, "setMemo:", a3);
  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
  -[PKPeerPaymentMessage _updateSummaryText](self, "_updateSummaryText");
}

- (BOOL)hasBeenSent
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = -[PKPeerPaymentMessage type](self, "type");
  -[PKPeerPaymentMessage underlyingMessage](self, "underlyingMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "senderParticipantIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3 == 1)
  {
    if (v5)
    {
      -[PKPeerPaymentMessage paymentIdentifier](self, "paymentIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;

    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = v5 != 0;
  }

  return v8;
}

- (BOOL)isFromMe
{
  void *v2;
  char v3;

  -[PKPeerPaymentMessage underlyingMessage](self, "underlyingMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  return v3;
}

- (void)setRecurringPaymentIdentifier:(id)a3
{
  -[PKProtobufPeerPaymentMessage setRecurringPaymentIdentifier:](self->_protoMessage, "setRecurringPaymentIdentifier:", a3);
  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
}

- (void)setRecurringPaymentMemo:(id)a3
{
  PKProtobufPeerPaymentMessage *protoMessage;
  id v5;
  void *v6;
  PKProtobufPeerPaymentMessage *v7;
  void *v8;
  PKProtobufPeerPaymentMessage *v9;
  void *v10;

  protoMessage = self->_protoMessage;
  v5 = a3;
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPeerPaymentMessage setMemo:](protoMessage, "setMemo:", v6);

  v7 = self->_protoMessage;
  objc_msgSend(v5, "emoji");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPeerPaymentMessage setRecurringPaymentEmoji:](v7, "setRecurringPaymentEmoji:", v8);

  v9 = self->_protoMessage;
  objc_msgSend(v5, "color");

  PKSemanticColorToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPeerPaymentMessage setRecurringPaymentColor:](v9, "setRecurringPaymentColor:", v10);

  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
  -[PKPeerPaymentMessage _updateLayoutContents](self, "_updateLayoutContents");
  -[PKPeerPaymentMessage _updateSummaryText](self, "_updateSummaryText");
}

- (void)setRecurringPaymentStartDate:(id)a3
{
  PKProtobufPeerPaymentMessage *protoMessage;

  protoMessage = self->_protoMessage;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  -[PKProtobufPeerPaymentMessage setRecurringPaymentStartDate:](protoMessage, "setRecurringPaymentStartDate:");
  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
  -[PKPeerPaymentMessage _updateLayoutContents](self, "_updateLayoutContents");
  -[PKPeerPaymentMessage _updateSummaryText](self, "_updateSummaryText");
}

- (void)setRecurringPaymentFrequency:(unint64_t)a3
{
  PKProtobufPeerPaymentMessage *protoMessage;
  void *v5;

  protoMessage = self->_protoMessage;
  PKPeerPaymentRecurringPaymentFrequencyToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPeerPaymentMessage setRecurringPaymentFrequency:](protoMessage, "setRecurringPaymentFrequency:", v5);

  -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
  -[PKPeerPaymentMessage _updateLayoutContents](self, "_updateLayoutContents");
  -[PKPeerPaymentMessage _updateSummaryText](self, "_updateSummaryText");
}

- (void)updateWithPeerPaymentPerformResponse:(id)a3
{
  PKProtobufPeerPaymentMessage *protoMessage;
  id v5;
  void *v6;
  PKProtobufPeerPaymentMessage *v7;
  void *v8;
  PKProtobufPeerPaymentMessage *v9;
  void *v10;

  if (a3)
  {
    protoMessage = self->_protoMessage;
    v5 = a3;
    objc_msgSend(v5, "paymentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPeerPaymentMessage setPaymentIdentifier:](protoMessage, "setPaymentIdentifier:", v6);

    v7 = self->_protoMessage;
    objc_msgSend(v5, "transactionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPeerPaymentMessage setTransactionIdentifier:](v7, "setTransactionIdentifier:", v8);

    v9 = self->_protoMessage;
    objc_msgSend(v5, "recurringPaymentIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKProtobufPeerPaymentMessage setRecurringPaymentIdentifier:](v9, "setRecurringPaymentIdentifier:", v10);
    -[PKPeerPaymentMessage _updateDataURL](self, "_updateDataURL");
  }
}

- (void)_updateDataURL
{
  void *v3;
  id v4;

  -[PKProtobufPeerPaymentMessage data](self->_protoMessage, "data");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  PKPeerPaymentMessageDataURLWithData();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessage setURL:](self->_underlyingMessage, "setURL:", v3);

}

- (void)_updateSummaryText
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  -[PKPeerPaymentMessage currencyAmount](self, "currencyAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v3;
  if (v3)
  {
    objc_msgSend(v3, "minimalFormattedStringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKPeerPaymentMessage type](self, "type");
    if (v5 == 3)
    {
      -[PKPeerPaymentMessage memo](self, "memo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentMessage _recurringPaymentSummaryTextWithAmount:memo:](self, "_recurringPaymentSummaryTextWithAmount:memo:", v4, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v5 == 2)
      {
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGE_SUMMARY_REQUEST_FORMAT"), CFSTR("%@"), v4, v11);
      }
      else
      {
        if (v5 != 1)
        {
          v9 = 0;
          goto LABEL_14;
        }
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGE_SUMMARY_PAYMENT_FORMAT"), CFSTR("%@"), v4, v11);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:

    goto LABEL_20;
  }
  v6 = -[PKPeerPaymentMessage type](self, "type");
  if (v6 == 3)
  {
    PKLocalizedPeerPaymentRecurringString(CFSTR("PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_NO_AMOUNT"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6 == 2)
    {
      v7 = CFSTR("PEER_PAYMENT_MESSAGE_SUMMARY_REQUEST_NO_AMOUNT");
    }
    else
    {
      if (v6 != 1)
      {
        v9 = 0;
        goto LABEL_20;
      }
      v7 = CFSTR("PEER_PAYMENT_MESSAGE_SUMMARY_PAYMENT_NO_AMOUNT");
    }
    PKLocalizedPeerPaymentString(&v7->isa);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v10;
LABEL_20:
  -[MSMessage setSummaryText:](self->_underlyingMessage, "setSummaryText:", v9);

}

- (void)_updateLayoutContents
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  int has_internal_ui;
  id v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint8_t buf[16];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[MSMessage layout](self->_underlyingMessage, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CC6938]);
    v5 = objc_alloc_init(MEMORY[0x1E0CC6940]);
    v3 = (void *)objc_msgSend(v4, "initWithAlternateLayout:", v5);

    -[MSMessage setLayout:](self->_underlyingMessage, "setLayout:", v3);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v3;
    objc_msgSend(v6, "alternateLayout");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_14;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      v6 = 0;
      goto LABEL_29;
    }
    v7 = v3;
    v6 = 0;
    if (!v7)
      goto LABEL_14;
  }
  v8 = -[PKPeerPaymentMessage type](self, "type");
  has_internal_ui = os_variant_has_internal_ui();
  if (v8 == 3)
  {
    if (has_internal_ui
      && PKSecureElementIsAvailable()
      && (v10 = objc_alloc_init(MEMORY[0x1E0D67630]),
          v11 = objc_msgSend(v10, "isProductionSigned"),
          v10,
          (v11 & 1) == 0))
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Skipping adding mediaFileURL to template layout for rdar://problem/32523250", buf, 2u);
      }
    }
    else
    {
      -[PKProtobufPeerPaymentMessage data](self->_protoMessage, "data");
      v12 = objc_claimAutoreleasedReturnValue();
      PKPeerPaymentMessageDataURLWithData();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPeerPaymentBubbleView generatedSnapshotForDataURL:contentInset:isFromMe:](PKPeerPaymentBubbleView, "generatedSnapshotForDataURL:contentInset:isFromMe:", v13, 0, 0.0, 6.0, 0.0, 6.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImage:", v14);

    }
LABEL_14:
    if (!v6)
      goto LABEL_29;
    goto LABEL_25;
  }
  if (has_internal_ui
    && PKSecureElementIsAvailable()
    && (v15 = objc_alloc_init(MEMORY[0x1E0D67630]),
        v16 = objc_msgSend(v15, "isProductionSigned"),
        v15,
        (v16 & 1) == 0))
  {
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Skipping adding mediaFileURL to template layout for rdar://problem/32523250", buf, 2u);
    }
  }
  else
  {
    PKPeerPaymentMessageFallbackMediaURL();
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMediaFileURL:", v17);
  }

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_FALLBACK_MESSAGE_CAPTION"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCaption:", v18);

  -[PKPeerPaymentMessage currencyAmount](self, "currencyAmount");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "minimalFormattedStringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PKPeerPaymentMessage type](self, "type") == 1)
    v21 = CFSTR("PEER_PAYMENT_FALLBACK_MESSAGE_SUBCAPTION_PAYMENT_FORMAT");
  else
    v21 = CFSTR("PEER_PAYMENT_FALLBACK_MESSAGE_SUBCAPTION_REQUEST_FORMAT");
  PKLocalizedPeerPaymentString(&v21->isa, CFSTR("%@"), v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubcaption:", v22);

  if (v6)
  {
LABEL_25:
    PKLogFacilityTypeGetObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v23, OS_LOG_TYPE_DEFAULT, "Using MSMessageLiveLayout", buf, 2u);
    }

    if (-[PKPeerPaymentMessage type](self, "type") == 3)
    {
      v26[0] = *MEMORY[0x1E0D34B58];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRequiredCapabilities:", v24);

    }
  }
LABEL_29:

}

- (id)_recurringPaymentSummaryTextWithAmount:(id)a3 memo:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = -[PKPeerPaymentMessage recurringPaymentFrequency](self, "recurringPaymentFrequency");
  if (!v7)
  {
    switch(v8)
    {
      case 1uLL:
        v14 = v6;
        v10 = CFSTR("PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_WEEKLY");
        goto LABEL_14;
      case 2uLL:
        v14 = v6;
        v10 = CFSTR("PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_BIWEEKLY");
        goto LABEL_14;
      case 3uLL:
        v14 = v6;
        v10 = CFSTR("PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_MONTHLY");
        goto LABEL_14;
      case 4uLL:
        v14 = v6;
        v10 = CFSTR("PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_DAILY");
LABEL_14:
        PKLocalizedPeerPaymentRecurringString(&v10->isa, CFSTR("%@"), v14);
        goto LABEL_15;
      default:
LABEL_6:
        v11 = 0;
        goto LABEL_16;
    }
  }
  switch(v8)
  {
    case 1uLL:
      v13 = v6;
      v15 = v7;
      v9 = CFSTR("PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_WITH_MEMO_WEEKLY");
      break;
    case 2uLL:
      v13 = v6;
      v15 = v7;
      v9 = CFSTR("PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_WITH_MEMO_BIWEEKLY");
      break;
    case 3uLL:
      v13 = v6;
      v15 = v7;
      v9 = CFSTR("PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_WITH_MEMO_MONTHLY");
      break;
    case 4uLL:
      v13 = v6;
      v15 = v7;
      v9 = CFSTR("PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_WITH_MEMO_DAILY");
      break;
    default:
      goto LABEL_6;
  }
  PKLocalizedPeerPaymentRecurringString(&v9->isa, CFSTR("%@%@"), v13, v15);
LABEL_15:
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MSMessage *underlyingMessage;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_opt_class();
  -[PKPeerPaymentMessage identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessage type](self, "type");
  PKPeerPaymentMessageTypeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessage amount](self, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessage currency](self, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  underlyingMessage = self->_underlyingMessage;
  -[PKPeerPaymentMessage requestToken](self, "requestToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessage recurringPaymentIdentifier](self, "recurringPaymentIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessage recurringPaymentStartDate](self, "recurringPaymentStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessage recurringPaymentFrequency](self, "recurringPaymentFrequency");
  PKPeerPaymentRecurringPaymentFrequencyToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p> identifier: %@, type: %@, amount: %@, currency: %@, underlyingMessage: %@, requestToken: %@, recurringPaymentIdentifier: %@, recurringPaymentStartDate: %@, recurringPaymentFrequency: %@"), v14, self, v3, v4, v5, v6, underlyingMessage, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)reportMessageSent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPeerPaymentMessage amount](self, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKAnalyticsAmountCategoryForAmount();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v4, *MEMORY[0x1E0D686E0]);

  -[PKPeerPaymentMessage currency](self, "currency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v5, *MEMORY[0x1E0D686E8]);

  -[PKPeerPaymentMessage source](self, "source");
  PKPeerPaymentMessageSourceToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, *MEMORY[0x1E0D686F0]);

  v7 = -[PKPeerPaymentMessage type](self, "type");
  if (v7 == 1 || v7 == 2)
    PKAnalyticsSendEventWithDailyLimit();

}

- (MSMessage)underlyingMessage
{
  return self->_underlyingMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingMessage, 0);
  objc_storeStrong((id *)&self->_protoMessage, 0);
}

@end
