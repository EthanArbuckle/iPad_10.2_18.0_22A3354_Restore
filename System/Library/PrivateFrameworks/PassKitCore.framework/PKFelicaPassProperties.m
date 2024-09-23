@implementation PKFelicaPassProperties

+ (id)passPropertiesForPass:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "felicaProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PKFelicaPassProperties)initWithFelicaAppletState:(id)a3 paymentApplication:(id)a4
{
  return -[PKFelicaPassProperties initWithTransitAppletState:paymentApplication:fieldCollection:](self, "initWithTransitAppletState:paymentApplication:fieldCollection:", a3, a4, 0);
}

- (PKFelicaPassProperties)initWithTransitAppletState:(id)a3 paymentApplication:(id)a4 fieldCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PKFelicaPassProperties *v12;
  void *v13;
  uint64_t v14;
  NSDateComponents *shinkansenValidityStartDate;
  uint64_t v16;
  NSNumber *shinkansenValidityTerm;
  uint64_t v18;
  NSString *shinkansenOriginStation;
  uint64_t v20;
  NSString *shinkansenDestinationStation;
  void *v22;
  uint64_t v23;
  NSDateComponents *shinkansenDepartureTime;
  void *v25;
  uint64_t v26;
  NSDateComponents *shinkansenArrivalTime;
  uint64_t v28;
  NSString *shinkansenTrainName;
  uint64_t v30;
  NSNumber *shinkansenCarNumber;
  uint64_t v32;
  NSNumber *shinkansenSeatRow;
  uint64_t v34;
  NSNumber *shinkansenSeatNumber;
  uint64_t v36;
  NSString *shinkansenSecondaryOriginStation;
  uint64_t v38;
  NSString *shinkansenSecondaryDestinationStation;
  void *v40;
  uint64_t v41;
  NSDateComponents *shinkansenSecondaryDepartureTime;
  void *v43;
  uint64_t v44;
  NSDateComponents *shinkansenSecondaryArrivalTime;
  uint64_t v46;
  NSString *shinkansenSecondaryTrainName;
  uint64_t v48;
  NSNumber *shinkansenSecondaryCarNumber;
  uint64_t v50;
  NSNumber *shinkansenSecondarySeatRow;
  uint64_t v52;
  NSNumber *shinkansenSecondarySeatNumber;
  uint64_t v54;
  NSString *greenCarOriginStation;
  uint64_t v56;
  NSString *greenCarDestinationStation;
  void *v58;
  uint64_t v59;
  NSDateComponents *greenCarValidityStartDate;
  PKFelicaPassProperties *v61;
  objc_super v63;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "felicaState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v63.receiver = self;
    v63.super_class = (Class)PKFelicaPassProperties;
    v12 = -[PKStoredValuePassProperties initWithTransitAppletState:paymentApplication:fieldCollection:](&v63, sel_initWithTransitAppletState_paymentApplication_fieldCollection_, v8, v9, v10);
    if (v12)
    {
      v12->_shinkansenTicketActive = objc_msgSend(v11, "isShinkansenTicketActive");
      v12->_greenCarTicketUsed = objc_msgSend(v11, "isGreenCarTicketUsed");
      v12->_balanceAllowedForCommute = objc_msgSend(v11, "isBalanceAllowedForCommute");
      v12->_lowBalanceGateNotificationEnabled = objc_msgSend(v11, "isLowBalanceNotificationEnabled");
      objc_msgSend(v11, "shinkansenValidityStartDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      DateComponentsFromFelicaDateNumber(v13);
      v14 = objc_claimAutoreleasedReturnValue();
      shinkansenValidityStartDate = v12->_shinkansenValidityStartDate;
      v12->_shinkansenValidityStartDate = (NSDateComponents *)v14;

      objc_msgSend(v11, "shinkansenValidityTerm");
      v16 = objc_claimAutoreleasedReturnValue();
      shinkansenValidityTerm = v12->_shinkansenValidityTerm;
      v12->_shinkansenValidityTerm = (NSNumber *)v16;

      objc_msgSend(v11, "shinkansenOriginStationString");
      v18 = objc_claimAutoreleasedReturnValue();
      shinkansenOriginStation = v12->_shinkansenOriginStation;
      v12->_shinkansenOriginStation = (NSString *)v18;

      objc_msgSend(v11, "shinkansenDestinationStationString");
      v20 = objc_claimAutoreleasedReturnValue();
      shinkansenDestinationStation = v12->_shinkansenDestinationStation;
      v12->_shinkansenDestinationStation = (NSString *)v20;

      objc_msgSend(v11, "shinkansenDepartureTime");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      DateComponentsFromFelicaTimeNumber(v22);
      v23 = objc_claimAutoreleasedReturnValue();
      shinkansenDepartureTime = v12->_shinkansenDepartureTime;
      v12->_shinkansenDepartureTime = (NSDateComponents *)v23;

      objc_msgSend(v11, "shinkansenArrivalTime");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      DateComponentsFromFelicaTimeNumber(v25);
      v26 = objc_claimAutoreleasedReturnValue();
      shinkansenArrivalTime = v12->_shinkansenArrivalTime;
      v12->_shinkansenArrivalTime = (NSDateComponents *)v26;

      objc_msgSend(v11, "shinkansenTrainName");
      v28 = objc_claimAutoreleasedReturnValue();
      shinkansenTrainName = v12->_shinkansenTrainName;
      v12->_shinkansenTrainName = (NSString *)v28;

      objc_msgSend(v11, "shinkansenCarNumber");
      v30 = objc_claimAutoreleasedReturnValue();
      shinkansenCarNumber = v12->_shinkansenCarNumber;
      v12->_shinkansenCarNumber = (NSNumber *)v30;

      objc_msgSend(v11, "shinkansenSeatRow");
      v32 = objc_claimAutoreleasedReturnValue();
      shinkansenSeatRow = v12->_shinkansenSeatRow;
      v12->_shinkansenSeatRow = (NSNumber *)v32;

      objc_msgSend(v11, "shinkansenSeatNumber");
      v34 = objc_claimAutoreleasedReturnValue();
      shinkansenSeatNumber = v12->_shinkansenSeatNumber;
      v12->_shinkansenSeatNumber = (NSNumber *)v34;

      objc_msgSend(v11, "shinkansenSecondaryOriginStationString");
      v36 = objc_claimAutoreleasedReturnValue();
      shinkansenSecondaryOriginStation = v12->_shinkansenSecondaryOriginStation;
      v12->_shinkansenSecondaryOriginStation = (NSString *)v36;

      objc_msgSend(v11, "shinkansenSecondaryDestinationStationString");
      v38 = objc_claimAutoreleasedReturnValue();
      shinkansenSecondaryDestinationStation = v12->_shinkansenSecondaryDestinationStation;
      v12->_shinkansenSecondaryDestinationStation = (NSString *)v38;

      objc_msgSend(v11, "shinkansenSecondaryDepartureTime");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      DateComponentsFromFelicaTimeNumber(v40);
      v41 = objc_claimAutoreleasedReturnValue();
      shinkansenSecondaryDepartureTime = v12->_shinkansenSecondaryDepartureTime;
      v12->_shinkansenSecondaryDepartureTime = (NSDateComponents *)v41;

      objc_msgSend(v11, "shinkansenSecondaryArrivalTime");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      DateComponentsFromFelicaTimeNumber(v43);
      v44 = objc_claimAutoreleasedReturnValue();
      shinkansenSecondaryArrivalTime = v12->_shinkansenSecondaryArrivalTime;
      v12->_shinkansenSecondaryArrivalTime = (NSDateComponents *)v44;

      objc_msgSend(v11, "shinkansenSecondaryTrainName");
      v46 = objc_claimAutoreleasedReturnValue();
      shinkansenSecondaryTrainName = v12->_shinkansenSecondaryTrainName;
      v12->_shinkansenSecondaryTrainName = (NSString *)v46;

      objc_msgSend(v11, "shinkansenSecondaryCarNumber");
      v48 = objc_claimAutoreleasedReturnValue();
      shinkansenSecondaryCarNumber = v12->_shinkansenSecondaryCarNumber;
      v12->_shinkansenSecondaryCarNumber = (NSNumber *)v48;

      objc_msgSend(v11, "shinkansenSecondarySeatRow");
      v50 = objc_claimAutoreleasedReturnValue();
      shinkansenSecondarySeatRow = v12->_shinkansenSecondarySeatRow;
      v12->_shinkansenSecondarySeatRow = (NSNumber *)v50;

      objc_msgSend(v11, "shinkansenSecondarySeatNumber");
      v52 = objc_claimAutoreleasedReturnValue();
      shinkansenSecondarySeatNumber = v12->_shinkansenSecondarySeatNumber;
      v12->_shinkansenSecondarySeatNumber = (NSNumber *)v52;

      objc_msgSend(v11, "greenCarOriginStationString");
      v54 = objc_claimAutoreleasedReturnValue();
      greenCarOriginStation = v12->_greenCarOriginStation;
      v12->_greenCarOriginStation = (NSString *)v54;

      objc_msgSend(v11, "greenCarDestinationStationString");
      v56 = objc_claimAutoreleasedReturnValue();
      greenCarDestinationStation = v12->_greenCarDestinationStation;
      v12->_greenCarDestinationStation = (NSString *)v56;

      objc_msgSend(v11, "greenCarValidityStartDate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      DateComponentsFromFelicaDateNumber(v58);
      v59 = objc_claimAutoreleasedReturnValue();
      greenCarValidityStartDate = v12->_greenCarValidityStartDate;
      v12->_greenCarValidityStartDate = (NSDateComponents *)v59;

      v12->_hasGreenCarTicket = objc_msgSend(v11, "hasGreenCarTicket");
      v12->_hasShinkansenTicket = objc_msgSend(v11, "hasShinkansenTicket");
    }
    self = v12;
    v61 = self;
  }
  else
  {
    v61 = 0;
  }

  return v61;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFelicaPassProperties)initWithCoder:(id)a3
{
  id v4;
  PKFelicaPassProperties *v5;
  PKFelicaPassProperties *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSDecimalNumber *v11;
  uint64_t v12;
  NSString *v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  NSDateComponents *shinkansenValidityStartDate;
  uint64_t v18;
  NSNumber *shinkansenValidityTerm;
  uint64_t v20;
  NSString *shinkansenOriginStation;
  uint64_t v22;
  NSString *shinkansenDestinationStation;
  uint64_t v24;
  NSDateComponents *shinkansenDepartureTime;
  uint64_t v26;
  NSDateComponents *shinkansenArrivalTime;
  uint64_t v28;
  NSString *shinkansenTrainName;
  uint64_t v30;
  NSNumber *shinkansenCarNumber;
  uint64_t v32;
  NSNumber *shinkansenSeatRow;
  uint64_t v34;
  NSNumber *shinkansenSeatNumber;
  uint64_t v36;
  NSString *shinkansenSecondaryOriginStation;
  uint64_t v38;
  NSString *shinkansenSecondaryDestinationStation;
  uint64_t v40;
  NSDateComponents *shinkansenSecondaryDepartureTime;
  uint64_t v42;
  NSDateComponents *shinkansenSecondaryArrivalTime;
  uint64_t v44;
  NSString *shinkansenSecondaryTrainName;
  uint64_t v46;
  NSNumber *shinkansenSecondaryCarNumber;
  uint64_t v48;
  NSNumber *shinkansenSecondarySeatRow;
  uint64_t v50;
  NSNumber *shinkansenSecondarySeatNumber;
  uint64_t v52;
  NSString *greenCarOriginStation;
  uint64_t v54;
  NSString *greenCarDestinationStation;
  uint64_t v56;
  NSDateComponents *greenCarValidityStartDate;
  objc_super v59;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)PKFelicaPassProperties;
  v5 = -[PKStoredValuePassProperties initWithCoder:](&v59, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[PKStoredValuePassProperties balanceAmount](v5, "balanceAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      v9 = objc_opt_class();
      objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("transitBalance"));
      v11 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", -[NSDecimalNumber unsignedLongLongValue](v11, "unsignedLongLongValue"), 0, 0);
        v12 = objc_claimAutoreleasedReturnValue();

        v11 = (NSDecimalNumber *)v12;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v11 && v13)
      {
        PKCurrencyAmountCreate(v11, v13, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKStoredValuePassProperties setBalanceAmount:](v6, "setBalanceAmount:", v15);

      }
    }
    v6->_shinkansenTicketActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shinkansenTicketActive"));
    v6->_greenCarTicketUsed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("greenCarTicketUsed"));
    v6->_balanceAllowedForCommute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("balanceAllowedForCommute"));
    v6->_lowBalanceGateNotificationEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lowBalanceGateNotificationEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenValidityStartDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    shinkansenValidityStartDate = v6->_shinkansenValidityStartDate;
    v6->_shinkansenValidityStartDate = (NSDateComponents *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenValidityTerm"));
    v18 = objc_claimAutoreleasedReturnValue();
    shinkansenValidityTerm = v6->_shinkansenValidityTerm;
    v6->_shinkansenValidityTerm = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenOriginStation"));
    v20 = objc_claimAutoreleasedReturnValue();
    shinkansenOriginStation = v6->_shinkansenOriginStation;
    v6->_shinkansenOriginStation = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenDestinationStation"));
    v22 = objc_claimAutoreleasedReturnValue();
    shinkansenDestinationStation = v6->_shinkansenDestinationStation;
    v6->_shinkansenDestinationStation = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenDepartureTime"));
    v24 = objc_claimAutoreleasedReturnValue();
    shinkansenDepartureTime = v6->_shinkansenDepartureTime;
    v6->_shinkansenDepartureTime = (NSDateComponents *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenArrivalTime"));
    v26 = objc_claimAutoreleasedReturnValue();
    shinkansenArrivalTime = v6->_shinkansenArrivalTime;
    v6->_shinkansenArrivalTime = (NSDateComponents *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenTrainName"));
    v28 = objc_claimAutoreleasedReturnValue();
    shinkansenTrainName = v6->_shinkansenTrainName;
    v6->_shinkansenTrainName = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenCarNumber"));
    v30 = objc_claimAutoreleasedReturnValue();
    shinkansenCarNumber = v6->_shinkansenCarNumber;
    v6->_shinkansenCarNumber = (NSNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSeatRow"));
    v32 = objc_claimAutoreleasedReturnValue();
    shinkansenSeatRow = v6->_shinkansenSeatRow;
    v6->_shinkansenSeatRow = (NSNumber *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSeatNumber"));
    v34 = objc_claimAutoreleasedReturnValue();
    shinkansenSeatNumber = v6->_shinkansenSeatNumber;
    v6->_shinkansenSeatNumber = (NSNumber *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryOriginStation"));
    v36 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryOriginStation = v6->_shinkansenSecondaryOriginStation;
    v6->_shinkansenSecondaryOriginStation = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryDestinationStation"));
    v38 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryDestinationStation = v6->_shinkansenSecondaryDestinationStation;
    v6->_shinkansenSecondaryDestinationStation = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryDepartureTime"));
    v40 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryDepartureTime = v6->_shinkansenSecondaryDepartureTime;
    v6->_shinkansenSecondaryDepartureTime = (NSDateComponents *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryArrivalTime"));
    v42 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryArrivalTime = v6->_shinkansenSecondaryArrivalTime;
    v6->_shinkansenSecondaryArrivalTime = (NSDateComponents *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryTrainName"));
    v44 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryTrainName = v6->_shinkansenSecondaryTrainName;
    v6->_shinkansenSecondaryTrainName = (NSString *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryCarNumber"));
    v46 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryCarNumber = v6->_shinkansenSecondaryCarNumber;
    v6->_shinkansenSecondaryCarNumber = (NSNumber *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondarySeatRow"));
    v48 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondarySeatRow = v6->_shinkansenSecondarySeatRow;
    v6->_shinkansenSecondarySeatRow = (NSNumber *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondarySeatNumber"));
    v50 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondarySeatNumber = v6->_shinkansenSecondarySeatNumber;
    v6->_shinkansenSecondarySeatNumber = (NSNumber *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("greenCarOriginStation"));
    v52 = objc_claimAutoreleasedReturnValue();
    greenCarOriginStation = v6->_greenCarOriginStation;
    v6->_greenCarOriginStation = (NSString *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("greenCarDestinationStation"));
    v54 = objc_claimAutoreleasedReturnValue();
    greenCarDestinationStation = v6->_greenCarDestinationStation;
    v6->_greenCarDestinationStation = (NSString *)v54;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("greenCarValidityStartDate"));
    v56 = objc_claimAutoreleasedReturnValue();
    greenCarValidityStartDate = v6->_greenCarValidityStartDate;
    v6->_greenCarValidityStartDate = (NSDateComponents *)v56;

    v6->_hasGreenCarTicket = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasGreenCarTicket"));
    v6->_hasShinkansenTicket = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasShinkansenTicket"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKFelicaPassProperties;
  v4 = a3;
  -[PKStoredValuePassProperties encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[PKStoredValuePassProperties balanceAmount](self, "balanceAmount", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("currencyCode"));

  -[PKStoredValuePassProperties balanceAmount](self, "balanceAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("transitBalance"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_shinkansenTicketActive, CFSTR("shinkansenTicketActive"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_greenCarTicketUsed, CFSTR("greenCarTicketUsed"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_balanceAllowedForCommute, CFSTR("balanceAllowedForCommute"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_lowBalanceGateNotificationEnabled, CFSTR("lowBalanceGateNotificationEnabled"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenValidityStartDate, CFSTR("shinkansenValidityStartDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenValidityTerm, CFSTR("shinkansenValidityTerm"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenOriginStation, CFSTR("shinkansenOriginStation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenDestinationStation, CFSTR("shinkansenDestinationStation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenDepartureTime, CFSTR("shinkansenDepartureTime"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenArrivalTime, CFSTR("shinkansenArrivalTime"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenTrainName, CFSTR("shinkansenTrainName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenCarNumber, CFSTR("shinkansenCarNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSeatRow, CFSTR("shinkansenSeatRow"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSeatNumber, CFSTR("shinkansenSeatNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryOriginStation, CFSTR("shinkansenSecondaryOriginStation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryDestinationStation, CFSTR("shinkansenSecondaryDestinationStation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryDepartureTime, CFSTR("shinkansenSecondaryDepartureTime"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryArrivalTime, CFSTR("shinkansenSecondaryArrivalTime"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryTrainName, CFSTR("shinkansenSecondaryTrainName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryCarNumber, CFSTR("shinkansenSecondaryCarNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondarySeatRow, CFSTR("shinkansenSecondarySeatRow"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondarySeatNumber, CFSTR("shinkansenSecondarySeatNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_greenCarOriginStation, CFSTR("greenCarOriginStation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_greenCarDestinationStation, CFSTR("greenCarDestinationStation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_greenCarValidityStartDate, CFSTR("greenCarValidityStartDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasGreenCarTicket, CFSTR("hasGreenCarTicket"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasShinkansenTicket, CFSTR("hasShinkansenTicket"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKFelicaPassProperties;
  v4 = -[PKStoredValuePassProperties copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setShinkansenTicketActive:", self->_shinkansenTicketActive);
  objc_msgSend(v4, "setGreenCarTicketUsed:", self->_greenCarTicketUsed);
  objc_msgSend(v4, "setBalanceAllowedForCommute:", self->_balanceAllowedForCommute);
  objc_msgSend(v4, "setLowBalanceGateNotificationEnabled:", self->_lowBalanceGateNotificationEnabled);
  objc_msgSend(v4, "setShinkansenValidityStartDate:", self->_shinkansenValidityStartDate);
  objc_msgSend(v4, "setShinkansenValidityTerm:", self->_shinkansenValidityTerm);
  objc_msgSend(v4, "setShinkansenOriginStation:", self->_shinkansenOriginStation);
  objc_msgSend(v4, "setShinkansenDestinationStation:", self->_shinkansenDestinationStation);
  objc_msgSend(v4, "setShinkansenDepartureTime:", self->_shinkansenDepartureTime);
  objc_msgSend(v4, "setShinkansenArrivalTime:", self->_shinkansenArrivalTime);
  objc_msgSend(v4, "setShinkansenTrainName:", self->_shinkansenTrainName);
  objc_msgSend(v4, "setShinkansenCarNumber:", self->_shinkansenCarNumber);
  objc_msgSend(v4, "setShinkansenSeatRow:", self->_shinkansenSeatRow);
  objc_msgSend(v4, "setShinkansenSeatNumber:", self->_shinkansenSeatNumber);
  objc_msgSend(v4, "setShinkansenSecondaryOriginStation:", self->_shinkansenSecondaryOriginStation);
  objc_msgSend(v4, "setShinkansenSecondaryDestinationStation:", self->_shinkansenSecondaryDestinationStation);
  objc_msgSend(v4, "setShinkansenSecondaryDepartureTime:", self->_shinkansenSecondaryDepartureTime);
  objc_msgSend(v4, "setShinkansenSecondaryArrivalTime:", self->_shinkansenSecondaryArrivalTime);
  objc_msgSend(v4, "setShinkansenSecondaryTrainName:", self->_shinkansenSecondaryTrainName);
  objc_msgSend(v4, "setShinkansenSecondaryCarNumber:", self->_shinkansenSecondaryCarNumber);
  objc_msgSend(v4, "setShinkansenSecondarySeatRow:", self->_shinkansenSecondarySeatRow);
  objc_msgSend(v4, "setShinkansenSecondarySeatNumber:", self->_shinkansenSecondarySeatNumber);
  objc_msgSend(v4, "setGreenCarOriginStation:", self->_greenCarOriginStation);
  objc_msgSend(v4, "setGreenCarDestinationStation:", self->_greenCarDestinationStation);
  objc_msgSend(v4, "setGreenCarValidityStartDate:", self->_greenCarValidityStartDate);
  objc_msgSend(v4, "setHasGreenCarTicket:", self->_hasGreenCarTicket);
  objc_msgSend(v4, "setHasShinkansenTicket:", self->_hasShinkansenTicket);
  return v4;
}

- (id)displayableShinkansenSeat
{
  return -[PKFelicaPassProperties _stringForRow:seat:](self, "_stringForRow:seat:", self->_shinkansenSeatRow, self->_shinkansenSeatNumber);
}

- (id)displayableShinkansenSecondarySeat
{
  return -[PKFelicaPassProperties _stringForRow:seat:](self, "_stringForRow:seat:", self->_shinkansenSecondarySeatRow, self->_shinkansenSecondarySeatNumber);
}

- (BOOL)isInShinkansenStation
{
  void *v2;
  char v3;

  -[PKStoredValuePassProperties enrouteTransitTypes](self, "enrouteTransitTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("TransitTrainShinkansen"));

  return v3;
}

- (BOOL)isInStation
{
  void *v2;
  char v3;

  -[PKStoredValuePassProperties enrouteTransitTypes](self, "enrouteTransitTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("Transit"));

  return v3;
}

- (id)_stringForRow:(id)a3 seat:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  __int16 v13;

  v5 = a4;
  objc_msgSend(a3, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "integerValue");
  if ((unint64_t)(v7 - 1) > 0x19)
  {
    objc_msgSend(v5, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v7 + 64;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (v6 && v8)
  {
    PKCoreLocalizedString(CFSTR("FELICA_PASS_PROPERTIES_TICKET_SEAT_FORMAT"), CFSTR("%1$@%2$@"), v6, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v11 = v10;

    v6 = v11;
    goto LABEL_10;
  }
  if (v8)
  {
    v10 = v8;
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  NSDateComponents *shinkansenValidityStartDate;
  NSDateComponents *v8;
  char v9;
  NSNumber *shinkansenValidityTerm;
  NSNumber *v11;
  NSString *shinkansenOriginStation;
  NSString *v13;
  NSString *shinkansenDestinationStation;
  NSString *v15;
  NSDateComponents *shinkansenDepartureTime;
  NSDateComponents *v17;
  NSDateComponents *shinkansenArrivalTime;
  NSDateComponents *v19;
  NSString *shinkansenTrainName;
  NSString *v21;
  NSNumber *shinkansenCarNumber;
  NSNumber *v23;
  NSNumber *shinkansenSeatRow;
  NSNumber *v25;
  NSNumber *shinkansenSeatNumber;
  NSNumber *v27;
  NSString *shinkansenSecondaryOriginStation;
  NSString *v29;
  NSString *shinkansenSecondaryDestinationStation;
  NSString *v31;
  NSDateComponents *shinkansenSecondaryDepartureTime;
  NSDateComponents *v33;
  NSDateComponents *shinkansenSecondaryArrivalTime;
  NSDateComponents *v35;
  NSString *shinkansenSecondaryTrainName;
  NSString *v37;
  NSNumber *shinkansenSecondaryCarNumber;
  NSNumber *v39;
  NSNumber *shinkansenSecondarySeatRow;
  NSNumber *v41;
  NSNumber *shinkansenSecondarySeatNumber;
  NSNumber *v43;
  NSString *greenCarOriginStation;
  NSString *v45;
  NSString *greenCarDestinationStation;
  NSString *v47;
  NSDateComponents *greenCarValidityStartDate;
  NSDateComponents *v49;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)PKFelicaPassProperties;
  if (-[PKStoredValuePassProperties isEqual:](&v51, sel_isEqual_, v4))
  {
    v5 = (unsigned __int8 *)v4;
    v6 = v5;
    if (self->_hasGreenCarTicket != v5[69]
      || self->_hasShinkansenTicket != v5[70]
      || self->_shinkansenTicketActive != v5[64]
      || self->_greenCarTicketUsed != v5[65]
      || self->_inShinkansenStation != v5[66]
      || self->_balanceAllowedForCommute != v5[67]
      || self->_lowBalanceGateNotificationEnabled != v5[68])
    {
      goto LABEL_112;
    }
    shinkansenValidityStartDate = self->_shinkansenValidityStartDate;
    v8 = (NSDateComponents *)*((_QWORD *)v6 + 9);
    if (shinkansenValidityStartDate && v8)
    {
      if ((-[NSDateComponents isEqual:](shinkansenValidityStartDate, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenValidityStartDate != v8)
    {
      goto LABEL_112;
    }
    shinkansenValidityTerm = self->_shinkansenValidityTerm;
    v11 = (NSNumber *)*((_QWORD *)v6 + 10);
    if (shinkansenValidityTerm && v11)
    {
      if ((-[NSNumber isEqual:](shinkansenValidityTerm, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenValidityTerm != v11)
    {
      goto LABEL_112;
    }
    shinkansenOriginStation = self->_shinkansenOriginStation;
    v13 = (NSString *)*((_QWORD *)v6 + 11);
    if (shinkansenOriginStation && v13)
    {
      if ((-[NSString isEqual:](shinkansenOriginStation, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenOriginStation != v13)
    {
      goto LABEL_112;
    }
    shinkansenDestinationStation = self->_shinkansenDestinationStation;
    v15 = (NSString *)*((_QWORD *)v6 + 12);
    if (shinkansenDestinationStation && v15)
    {
      if ((-[NSString isEqual:](shinkansenDestinationStation, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenDestinationStation != v15)
    {
      goto LABEL_112;
    }
    shinkansenDepartureTime = self->_shinkansenDepartureTime;
    v17 = (NSDateComponents *)*((_QWORD *)v6 + 13);
    if (shinkansenDepartureTime && v17)
    {
      if ((-[NSDateComponents isEqual:](shinkansenDepartureTime, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenDepartureTime != v17)
    {
      goto LABEL_112;
    }
    shinkansenArrivalTime = self->_shinkansenArrivalTime;
    v19 = (NSDateComponents *)*((_QWORD *)v6 + 14);
    if (shinkansenArrivalTime && v19)
    {
      if ((-[NSDateComponents isEqual:](shinkansenArrivalTime, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenArrivalTime != v19)
    {
      goto LABEL_112;
    }
    shinkansenTrainName = self->_shinkansenTrainName;
    v21 = (NSString *)*((_QWORD *)v6 + 15);
    if (shinkansenTrainName && v21)
    {
      if ((-[NSString isEqual:](shinkansenTrainName, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenTrainName != v21)
    {
      goto LABEL_112;
    }
    shinkansenCarNumber = self->_shinkansenCarNumber;
    v23 = (NSNumber *)*((_QWORD *)v6 + 16);
    if (shinkansenCarNumber && v23)
    {
      if ((-[NSNumber isEqual:](shinkansenCarNumber, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenCarNumber != v23)
    {
      goto LABEL_112;
    }
    shinkansenSeatRow = self->_shinkansenSeatRow;
    v25 = (NSNumber *)*((_QWORD *)v6 + 17);
    if (shinkansenSeatRow && v25)
    {
      if ((-[NSNumber isEqual:](shinkansenSeatRow, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenSeatRow != v25)
    {
      goto LABEL_112;
    }
    shinkansenSeatNumber = self->_shinkansenSeatNumber;
    v27 = (NSNumber *)*((_QWORD *)v6 + 18);
    if (shinkansenSeatNumber && v27)
    {
      if ((-[NSNumber isEqual:](shinkansenSeatNumber, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenSeatNumber != v27)
    {
      goto LABEL_112;
    }
    shinkansenSecondaryOriginStation = self->_shinkansenSecondaryOriginStation;
    v29 = (NSString *)*((_QWORD *)v6 + 19);
    if (shinkansenSecondaryOriginStation && v29)
    {
      if ((-[NSString isEqual:](shinkansenSecondaryOriginStation, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenSecondaryOriginStation != v29)
    {
      goto LABEL_112;
    }
    shinkansenSecondaryDestinationStation = self->_shinkansenSecondaryDestinationStation;
    v31 = (NSString *)*((_QWORD *)v6 + 20);
    if (shinkansenSecondaryDestinationStation && v31)
    {
      if ((-[NSString isEqual:](shinkansenSecondaryDestinationStation, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenSecondaryDestinationStation != v31)
    {
      goto LABEL_112;
    }
    shinkansenSecondaryDepartureTime = self->_shinkansenSecondaryDepartureTime;
    v33 = (NSDateComponents *)*((_QWORD *)v6 + 21);
    if (shinkansenSecondaryDepartureTime && v33)
    {
      if ((-[NSDateComponents isEqual:](shinkansenSecondaryDepartureTime, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenSecondaryDepartureTime != v33)
    {
      goto LABEL_112;
    }
    shinkansenSecondaryArrivalTime = self->_shinkansenSecondaryArrivalTime;
    v35 = (NSDateComponents *)*((_QWORD *)v6 + 22);
    if (shinkansenSecondaryArrivalTime && v35)
    {
      if ((-[NSDateComponents isEqual:](shinkansenSecondaryArrivalTime, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenSecondaryArrivalTime != v35)
    {
      goto LABEL_112;
    }
    shinkansenSecondaryTrainName = self->_shinkansenSecondaryTrainName;
    v37 = (NSString *)*((_QWORD *)v6 + 23);
    if (shinkansenSecondaryTrainName && v37)
    {
      if ((-[NSString isEqual:](shinkansenSecondaryTrainName, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenSecondaryTrainName != v37)
    {
      goto LABEL_112;
    }
    shinkansenSecondaryCarNumber = self->_shinkansenSecondaryCarNumber;
    v39 = (NSNumber *)*((_QWORD *)v6 + 24);
    if (shinkansenSecondaryCarNumber && v39)
    {
      if ((-[NSNumber isEqual:](shinkansenSecondaryCarNumber, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenSecondaryCarNumber != v39)
    {
      goto LABEL_112;
    }
    shinkansenSecondarySeatRow = self->_shinkansenSecondarySeatRow;
    v41 = (NSNumber *)*((_QWORD *)v6 + 25);
    if (shinkansenSecondarySeatRow && v41)
    {
      if ((-[NSNumber isEqual:](shinkansenSecondarySeatRow, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenSecondarySeatRow != v41)
    {
      goto LABEL_112;
    }
    shinkansenSecondarySeatNumber = self->_shinkansenSecondarySeatNumber;
    v43 = (NSNumber *)*((_QWORD *)v6 + 26);
    if (shinkansenSecondarySeatNumber && v43)
    {
      if ((-[NSNumber isEqual:](shinkansenSecondarySeatNumber, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (shinkansenSecondarySeatNumber != v43)
    {
      goto LABEL_112;
    }
    greenCarOriginStation = self->_greenCarOriginStation;
    v45 = (NSString *)*((_QWORD *)v6 + 27);
    if (greenCarOriginStation && v45)
    {
      if ((-[NSString isEqual:](greenCarOriginStation, "isEqual:") & 1) == 0)
        goto LABEL_112;
    }
    else if (greenCarOriginStation != v45)
    {
      goto LABEL_112;
    }
    greenCarDestinationStation = self->_greenCarDestinationStation;
    v47 = (NSString *)*((_QWORD *)v6 + 28);
    if (greenCarDestinationStation && v47)
    {
      if ((-[NSString isEqual:](greenCarDestinationStation, "isEqual:") & 1) != 0)
      {
LABEL_108:
        greenCarValidityStartDate = self->_greenCarValidityStartDate;
        v49 = (NSDateComponents *)*((_QWORD *)v6 + 29);
        if (greenCarValidityStartDate && v49)
          v9 = -[NSDateComponents isEqual:](greenCarValidityStartDate, "isEqual:");
        else
          v9 = greenCarValidityStartDate == v49;
        goto LABEL_113;
      }
    }
    else if (greenCarDestinationStation == v47)
    {
      goto LABEL_108;
    }
LABEL_112:
    v9 = 0;
LABEL_113:

    goto LABEL_114;
  }
  v9 = 0;
LABEL_114:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKFelicaPassProperties;
  v3 = -[PKStoredValuePassProperties hash](&v14, sel_hash);
  v4 = self->_hasGreenCarTicket - v3 + 32 * v3;
  v5 = self->_hasShinkansenTicket - v4 + 32 * v4;
  v6 = self->_shinkansenTicketActive - v5 + 32 * v5;
  v7 = self->_greenCarTicketUsed - v6 + 32 * v6;
  v8 = self->_inShinkansenStation - v7 + 32 * v7;
  v9 = self->_balanceAllowedForCommute - v8 + 32 * v8;
  v10 = self->_lowBalanceGateNotificationEnabled - v9 + 32 * v9;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenOriginStation);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenDestinationStation);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenDepartureTime);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenArrivalTime);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenTrainName);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenCarNumber);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenSeatRow);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenSeatNumber);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenSecondaryOriginStation);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenSecondaryDestinationStation);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenSecondaryDepartureTime);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenSecondaryArrivalTime);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenSecondaryTrainName);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenSecondaryCarNumber);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenSecondarySeatRow);
  objc_msgSend(v11, "safelyAddObject:", self->_shinkansenSecondarySeatNumber);
  objc_msgSend(v11, "safelyAddObject:", self->_greenCarOriginStation);
  objc_msgSend(v11, "safelyAddObject:", self->_greenCarDestinationStation);
  objc_msgSend(v11, "safelyAddObject:", self->_greenCarValidityStartDate);
  v12 = PKCombinedHash(v10, v11);

  return v12;
}

+ (Class)equalityClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isShinkansenTicketActive
{
  return self->_shinkansenTicketActive;
}

- (void)setShinkansenTicketActive:(BOOL)a3
{
  self->_shinkansenTicketActive = a3;
}

- (BOOL)isGreenCarTicketUsed
{
  return self->_greenCarTicketUsed;
}

- (void)setGreenCarTicketUsed:(BOOL)a3
{
  self->_greenCarTicketUsed = a3;
}

- (void)setInShinkansenStation:(BOOL)a3
{
  self->_inShinkansenStation = a3;
}

- (BOOL)isBalanceAllowedForCommute
{
  return self->_balanceAllowedForCommute;
}

- (void)setBalanceAllowedForCommute:(BOOL)a3
{
  self->_balanceAllowedForCommute = a3;
}

- (BOOL)isLowBalanceGateNotificationEnabled
{
  return self->_lowBalanceGateNotificationEnabled;
}

- (void)setLowBalanceGateNotificationEnabled:(BOOL)a3
{
  self->_lowBalanceGateNotificationEnabled = a3;
}

- (NSDateComponents)shinkansenValidityStartDate
{
  return self->_shinkansenValidityStartDate;
}

- (void)setShinkansenValidityStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)shinkansenValidityTerm
{
  return self->_shinkansenValidityTerm;
}

- (void)setShinkansenValidityTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)shinkansenOriginStation
{
  return self->_shinkansenOriginStation;
}

- (void)setShinkansenOriginStation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)shinkansenDestinationStation
{
  return self->_shinkansenDestinationStation;
}

- (void)setShinkansenDestinationStation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDateComponents)shinkansenDepartureTime
{
  return self->_shinkansenDepartureTime;
}

- (void)setShinkansenDepartureTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDateComponents)shinkansenArrivalTime
{
  return self->_shinkansenArrivalTime;
}

- (void)setShinkansenArrivalTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)shinkansenTrainName
{
  return self->_shinkansenTrainName;
}

- (void)setShinkansenTrainName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)shinkansenCarNumber
{
  return self->_shinkansenCarNumber;
}

- (void)setShinkansenCarNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)shinkansenSeatRow
{
  return self->_shinkansenSeatRow;
}

- (void)setShinkansenSeatRow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)shinkansenSeatNumber
{
  return self->_shinkansenSeatNumber;
}

- (void)setShinkansenSeatNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)shinkansenSecondaryOriginStation
{
  return self->_shinkansenSecondaryOriginStation;
}

- (void)setShinkansenSecondaryOriginStation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)shinkansenSecondaryDestinationStation
{
  return self->_shinkansenSecondaryDestinationStation;
}

- (void)setShinkansenSecondaryDestinationStation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDateComponents)shinkansenSecondaryDepartureTime
{
  return self->_shinkansenSecondaryDepartureTime;
}

- (void)setShinkansenSecondaryDepartureTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSDateComponents)shinkansenSecondaryArrivalTime
{
  return self->_shinkansenSecondaryArrivalTime;
}

- (void)setShinkansenSecondaryArrivalTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)shinkansenSecondaryTrainName
{
  return self->_shinkansenSecondaryTrainName;
}

- (void)setShinkansenSecondaryTrainName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)shinkansenSecondaryCarNumber
{
  return self->_shinkansenSecondaryCarNumber;
}

- (void)setShinkansenSecondaryCarNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)shinkansenSecondarySeatRow
{
  return self->_shinkansenSecondarySeatRow;
}

- (void)setShinkansenSecondarySeatRow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)shinkansenSecondarySeatNumber
{
  return self->_shinkansenSecondarySeatNumber;
}

- (void)setShinkansenSecondarySeatNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)greenCarOriginStation
{
  return self->_greenCarOriginStation;
}

- (void)setGreenCarOriginStation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)greenCarDestinationStation
{
  return self->_greenCarDestinationStation;
}

- (void)setGreenCarDestinationStation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSDateComponents)greenCarValidityStartDate
{
  return self->_greenCarValidityStartDate;
}

- (void)setGreenCarValidityStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)hasGreenCarTicket
{
  return self->_hasGreenCarTicket;
}

- (void)setHasGreenCarTicket:(BOOL)a3
{
  self->_hasGreenCarTicket = a3;
}

- (BOOL)hasShinkansenTicket
{
  return self->_hasShinkansenTicket;
}

- (void)setHasShinkansenTicket:(BOOL)a3
{
  self->_hasShinkansenTicket = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greenCarValidityStartDate, 0);
  objc_storeStrong((id *)&self->_greenCarDestinationStation, 0);
  objc_storeStrong((id *)&self->_greenCarOriginStation, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondarySeatNumber, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondarySeatRow, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryCarNumber, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryTrainName, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryArrivalTime, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryDepartureTime, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryDestinationStation, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryOriginStation, 0);
  objc_storeStrong((id *)&self->_shinkansenSeatNumber, 0);
  objc_storeStrong((id *)&self->_shinkansenSeatRow, 0);
  objc_storeStrong((id *)&self->_shinkansenCarNumber, 0);
  objc_storeStrong((id *)&self->_shinkansenTrainName, 0);
  objc_storeStrong((id *)&self->_shinkansenArrivalTime, 0);
  objc_storeStrong((id *)&self->_shinkansenDepartureTime, 0);
  objc_storeStrong((id *)&self->_shinkansenDestinationStation, 0);
  objc_storeStrong((id *)&self->_shinkansenOriginStation, 0);
  objc_storeStrong((id *)&self->_shinkansenValidityTerm, 0);
  objc_storeStrong((id *)&self->_shinkansenValidityStartDate, 0);
}

@end
