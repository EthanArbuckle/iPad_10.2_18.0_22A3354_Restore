@implementation PKFelicaTransitAppletState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFelicaTransitAppletState)init
{
  PKFelicaTransitAppletState *v2;
  PKFelicaTransitAppletState *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKFelicaTransitAppletState;
  v2 = -[PKFelicaTransitAppletState init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PKTransitAppletState setCurrency:](v2, "setCurrency:", CFSTR("JPY"));
  return v3;
}

- (PKFelicaTransitAppletState)initWithCoder:(id)a3
{
  id v4;
  PKFelicaTransitAppletState *v5;
  PKFelicaTransitAppletState *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  NSNumber *shinkansenValidityStartDate;
  uint64_t v12;
  NSNumber *shinkansenValidityTerm;
  uint64_t v14;
  NSData *shinkansenOriginStationCode;
  uint64_t v16;
  NSData *shinkansenDestinationStationCode;
  uint64_t v18;
  NSNumber *shinkansenDepartureTime;
  uint64_t v20;
  NSNumber *shinkansenArrivalTime;
  uint64_t v22;
  NSString *shinkansenTrainName;
  uint64_t v24;
  NSNumber *shinkansenCarNumber;
  uint64_t v26;
  NSNumber *shinkansenSeatRow;
  uint64_t v28;
  NSNumber *shinkansenSeatNumber;
  uint64_t v30;
  NSData *shinkansenSecondaryOriginStationCode;
  uint64_t v32;
  NSData *shinkansenSecondaryDestinationStationCode;
  uint64_t v34;
  NSNumber *shinkansenSecondaryDepartureTime;
  uint64_t v36;
  NSNumber *shinkansenSecondaryArrivalTime;
  uint64_t v38;
  NSString *shinkansenSecondaryTrainName;
  uint64_t v40;
  NSNumber *shinkansenSecondaryCarNumber;
  uint64_t v42;
  NSNumber *shinkansenSecondarySeatRow;
  uint64_t v44;
  NSNumber *shinkansenSecondarySeatNumber;
  uint64_t v46;
  NSData *greenCarOriginStationCode;
  uint64_t v48;
  NSData *greenCarDestinationStationCode;
  uint64_t v50;
  NSNumber *greenCarValidityStartDate;
  uint64_t v52;
  NSString *shinkansenOriginStationString;
  uint64_t v54;
  NSString *shinkansenDestinationStationString;
  uint64_t v56;
  NSString *shinkansenSecondaryOriginStationString;
  uint64_t v58;
  NSString *shinkansenSecondaryDestinationStationString;
  uint64_t v60;
  NSString *greenCarOriginStationString;
  uint64_t v62;
  NSString *greenCarDestinationStationString;
  objc_super v65;

  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)PKFelicaTransitAppletState;
  v5 = -[PKTransitAppletState initWithCoder:](&v65, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[PKTransitAppletState setCurrency:](v5, "setCurrency:", CFSTR("JPY"));
    -[PKTransitAppletState enrouteTransitTypes](v6, "enrouteTransitTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", CFSTR("TransitMetro"));

    if (v8)
      -[PKTransitAppletState setEnrouteTransitTypes:](v6, "setEnrouteTransitTypes:", 0);
    -[PKTransitAppletState enrouteTransitTypes](v6, "enrouteTransitTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inStation")))
        -[PKTransitAppletState addEnrouteTransitType:](v6, "addEnrouteTransitType:", CFSTR("Transit"));
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inShinkansenStation")))
        -[PKTransitAppletState addEnrouteTransitType:](v6, "addEnrouteTransitType:", CFSTR("TransitTrainShinkansen"));
    }
    v6->_shinkansenTicketActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shinkansenTicketActive"));
    v6->_greenCarTicketUsed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("greenCarTicketUsed"));
    v6->_balanceAllowedForCommute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("balanceAllowedForCommute"));
    v6->_lowBalanceNotificationEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lowBalanceNotificationEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenValidityStartDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    shinkansenValidityStartDate = v6->_shinkansenValidityStartDate;
    v6->_shinkansenValidityStartDate = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenValidityTerm"));
    v12 = objc_claimAutoreleasedReturnValue();
    shinkansenValidityTerm = v6->_shinkansenValidityTerm;
    v6->_shinkansenValidityTerm = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenOriginStation"));
    v14 = objc_claimAutoreleasedReturnValue();
    shinkansenOriginStationCode = v6->_shinkansenOriginStationCode;
    v6->_shinkansenOriginStationCode = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenDestinationStation"));
    v16 = objc_claimAutoreleasedReturnValue();
    shinkansenDestinationStationCode = v6->_shinkansenDestinationStationCode;
    v6->_shinkansenDestinationStationCode = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenDepartureTime"));
    v18 = objc_claimAutoreleasedReturnValue();
    shinkansenDepartureTime = v6->_shinkansenDepartureTime;
    v6->_shinkansenDepartureTime = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenArrivalTime"));
    v20 = objc_claimAutoreleasedReturnValue();
    shinkansenArrivalTime = v6->_shinkansenArrivalTime;
    v6->_shinkansenArrivalTime = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenTrainName"));
    v22 = objc_claimAutoreleasedReturnValue();
    shinkansenTrainName = v6->_shinkansenTrainName;
    v6->_shinkansenTrainName = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenCarNumber"));
    v24 = objc_claimAutoreleasedReturnValue();
    shinkansenCarNumber = v6->_shinkansenCarNumber;
    v6->_shinkansenCarNumber = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSeatRow"));
    v26 = objc_claimAutoreleasedReturnValue();
    shinkansenSeatRow = v6->_shinkansenSeatRow;
    v6->_shinkansenSeatRow = (NSNumber *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSeatNumber"));
    v28 = objc_claimAutoreleasedReturnValue();
    shinkansenSeatNumber = v6->_shinkansenSeatNumber;
    v6->_shinkansenSeatNumber = (NSNumber *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryOriginStation"));
    v30 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryOriginStationCode = v6->_shinkansenSecondaryOriginStationCode;
    v6->_shinkansenSecondaryOriginStationCode = (NSData *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryDestinationStation"));
    v32 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryDestinationStationCode = v6->_shinkansenSecondaryDestinationStationCode;
    v6->_shinkansenSecondaryDestinationStationCode = (NSData *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryDepartureTime"));
    v34 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryDepartureTime = v6->_shinkansenSecondaryDepartureTime;
    v6->_shinkansenSecondaryDepartureTime = (NSNumber *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryArrivalTime"));
    v36 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryArrivalTime = v6->_shinkansenSecondaryArrivalTime;
    v6->_shinkansenSecondaryArrivalTime = (NSNumber *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryTrainName"));
    v38 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryTrainName = v6->_shinkansenSecondaryTrainName;
    v6->_shinkansenSecondaryTrainName = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryCarNumber"));
    v40 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryCarNumber = v6->_shinkansenSecondaryCarNumber;
    v6->_shinkansenSecondaryCarNumber = (NSNumber *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondarySeatRow"));
    v42 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondarySeatRow = v6->_shinkansenSecondarySeatRow;
    v6->_shinkansenSecondarySeatRow = (NSNumber *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondarySeatNumber"));
    v44 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondarySeatNumber = v6->_shinkansenSecondarySeatNumber;
    v6->_shinkansenSecondarySeatNumber = (NSNumber *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("greenCarOriginStation"));
    v46 = objc_claimAutoreleasedReturnValue();
    greenCarOriginStationCode = v6->_greenCarOriginStationCode;
    v6->_greenCarOriginStationCode = (NSData *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("greenCarDestinationStation"));
    v48 = objc_claimAutoreleasedReturnValue();
    greenCarDestinationStationCode = v6->_greenCarDestinationStationCode;
    v6->_greenCarDestinationStationCode = (NSData *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("greenCarValidityStartDate"));
    v50 = objc_claimAutoreleasedReturnValue();
    greenCarValidityStartDate = v6->_greenCarValidityStartDate;
    v6->_greenCarValidityStartDate = (NSNumber *)v50;

    v6->_hasShinkansenTicket = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasShinkansenTicket"));
    v6->_hasGreenCarTicket = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasGreenCarTicket"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenOriginStationString"));
    v52 = objc_claimAutoreleasedReturnValue();
    shinkansenOriginStationString = v6->_shinkansenOriginStationString;
    v6->_shinkansenOriginStationString = (NSString *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenDestinationStationString"));
    v54 = objc_claimAutoreleasedReturnValue();
    shinkansenDestinationStationString = v6->_shinkansenDestinationStationString;
    v6->_shinkansenDestinationStationString = (NSString *)v54;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryOriginStationString"));
    v56 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryOriginStationString = v6->_shinkansenSecondaryOriginStationString;
    v6->_shinkansenSecondaryOriginStationString = (NSString *)v56;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenSecondaryDestinationStationString"));
    v58 = objc_claimAutoreleasedReturnValue();
    shinkansenSecondaryDestinationStationString = v6->_shinkansenSecondaryDestinationStationString;
    v6->_shinkansenSecondaryDestinationStationString = (NSString *)v58;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("greenCarOriginStationString"));
    v60 = objc_claimAutoreleasedReturnValue();
    greenCarOriginStationString = v6->_greenCarOriginStationString;
    v6->_greenCarOriginStationString = (NSString *)v60;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("greenCarDestinationStationString"));
    v62 = objc_claimAutoreleasedReturnValue();
    greenCarDestinationStationString = v6->_greenCarDestinationStationString;
    v6->_greenCarDestinationStationString = (NSString *)v62;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKFelicaTransitAppletState;
  v4 = a3;
  -[PKTransitAppletState encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[PKFelicaTransitAppletState isInShinkansenStation](self, "isInShinkansenStation", v5.receiver, v5.super_class), CFSTR("inShinkansenStation"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shinkansenTicketActive, CFSTR("shinkansenTicketActive"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_greenCarTicketUsed, CFSTR("greenCarTicketUsed"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_balanceAllowedForCommute, CFSTR("balanceAllowedForCommute"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_lowBalanceNotificationEnabled, CFSTR("lowBalanceNotificationEnabled"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenValidityStartDate, CFSTR("shinkansenValidityStartDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenValidityTerm, CFSTR("shinkansenValidityTerm"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenOriginStationCode, CFSTR("shinkansenOriginStation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenDestinationStationCode, CFSTR("shinkansenDestinationStation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenDepartureTime, CFSTR("shinkansenDepartureTime"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenArrivalTime, CFSTR("shinkansenArrivalTime"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenTrainName, CFSTR("shinkansenTrainName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenCarNumber, CFSTR("shinkansenCarNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSeatRow, CFSTR("shinkansenSeatRow"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSeatNumber, CFSTR("shinkansenSeatNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryOriginStationCode, CFSTR("shinkansenSecondaryOriginStation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryDestinationStationCode, CFSTR("shinkansenSecondaryDestinationStation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryDepartureTime, CFSTR("shinkansenSecondaryDepartureTime"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryArrivalTime, CFSTR("shinkansenSecondaryArrivalTime"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryTrainName, CFSTR("shinkansenSecondaryTrainName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryCarNumber, CFSTR("shinkansenSecondaryCarNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondarySeatRow, CFSTR("shinkansenSecondarySeatRow"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondarySeatNumber, CFSTR("shinkansenSecondarySeatNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_greenCarOriginStationCode, CFSTR("greenCarOriginStation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_greenCarDestinationStationCode, CFSTR("greenCarDestinationStation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_greenCarValidityStartDate, CFSTR("greenCarValidityStartDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasShinkansenTicket, CFSTR("hasShinkansenTicket"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasGreenCarTicket, CFSTR("hasGreenCarTicket"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenOriginStationString, CFSTR("shinkansenOriginStationString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenDestinationStationString, CFSTR("shinkansenDestinationStationString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryOriginStationString, CFSTR("shinkansenSecondaryOriginStationString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenSecondaryDestinationStationString, CFSTR("shinkansenSecondaryDestinationStationString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_greenCarOriginStationString, CFSTR("greenCarOriginStationString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_greenCarDestinationStationString, CFSTR("greenCarDestinationStationString"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKFelicaTransitAppletState;
  v4 = -[PKTransitAppletState copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setShinkansenTicketActive:", self->_shinkansenTicketActive);
  objc_msgSend(v4, "setGreenCarTicketUsed:", self->_greenCarTicketUsed);
  objc_msgSend(v4, "setBalanceAllowedForCommute:", self->_balanceAllowedForCommute);
  objc_msgSend(v4, "setLowBalanceNotificationEnabled:", self->_lowBalanceNotificationEnabled);
  objc_msgSend(v4, "setShinkansenValidityStartDate:", self->_shinkansenValidityStartDate);
  objc_msgSend(v4, "setShinkansenValidityTerm:", self->_shinkansenValidityTerm);
  objc_msgSend(v4, "setShinkansenOriginStationCode:", self->_shinkansenOriginStationCode);
  objc_msgSend(v4, "setShinkansenDestinationStationCode:", self->_shinkansenDestinationStationCode);
  objc_msgSend(v4, "setShinkansenDepartureTime:", self->_shinkansenDepartureTime);
  objc_msgSend(v4, "setShinkansenArrivalTime:", self->_shinkansenArrivalTime);
  objc_msgSend(v4, "setShinkansenTrainName:", self->_shinkansenTrainName);
  objc_msgSend(v4, "setShinkansenCarNumber:", self->_shinkansenCarNumber);
  objc_msgSend(v4, "setShinkansenSeatRow:", self->_shinkansenSeatRow);
  objc_msgSend(v4, "setShinkansenSeatNumber:", self->_shinkansenSeatNumber);
  objc_msgSend(v4, "setShinkansenSecondaryOriginStationCode:", self->_shinkansenSecondaryOriginStationCode);
  objc_msgSend(v4, "setShinkansenSecondaryDestinationStationCode:", self->_shinkansenSecondaryDestinationStationCode);
  objc_msgSend(v4, "setShinkansenSecondaryDepartureTime:", self->_shinkansenSecondaryDepartureTime);
  objc_msgSend(v4, "setShinkansenSecondaryArrivalTime:", self->_shinkansenSecondaryArrivalTime);
  objc_msgSend(v4, "setShinkansenSecondaryTrainName:", self->_shinkansenSecondaryTrainName);
  objc_msgSend(v4, "setShinkansenSecondaryCarNumber:", self->_shinkansenSecondaryCarNumber);
  objc_msgSend(v4, "setShinkansenSecondarySeatRow:", self->_shinkansenSecondarySeatRow);
  objc_msgSend(v4, "setShinkansenSecondarySeatNumber:", self->_shinkansenSecondarySeatNumber);
  objc_msgSend(v4, "setGreenCarOriginStationCode:", self->_greenCarOriginStationCode);
  objc_msgSend(v4, "setGreenCarDestinationStationCode:", self->_greenCarDestinationStationCode);
  objc_msgSend(v4, "setGreenCarValidityStartDate:", self->_greenCarValidityStartDate);
  objc_msgSend(v4, "setHasShinkansenTicket:", self->_hasShinkansenTicket);
  objc_msgSend(v4, "setHasGreenCarTicket:", self->_hasGreenCarTicket);
  objc_msgSend(v4, "setShinkansenOriginStationString:", self->_shinkansenOriginStationString);
  objc_msgSend(v4, "setShinkansenDestinationStationString:", self->_shinkansenDestinationStationString);
  objc_msgSend(v4, "setShinkansenSecondaryOriginStationString:", self->_shinkansenSecondaryOriginStationString);
  objc_msgSend(v4, "setShinkansenSecondaryDestinationStationString:", self->_shinkansenSecondaryDestinationStationString);
  objc_msgSend(v4, "setGreenCarOriginStationString:", self->_greenCarOriginStationString);
  objc_msgSend(v4, "setGreenCarDestinationStationString:", self->_greenCarDestinationStationString);
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKFelicaTransitAppletState;
  -[PKFelicaTransitAppletState dealloc](&v2, sel_dealloc);
}

- (BOOL)isInStation
{
  void *v2;
  char v3;

  -[PKTransitAppletState enrouteTransitTypes](self, "enrouteTransitTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("Transit"));

  return v3;
}

- (BOOL)isInShinkansenStation
{
  void *v2;
  char v3;

  -[PKTransitAppletState enrouteTransitTypes](self, "enrouteTransitTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("TransitTrainShinkansen"));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSNumber *shinkansenValidityStartDate;
  NSNumber *v7;
  char v8;
  NSNumber *shinkansenValidityTerm;
  NSNumber *v11;
  NSData *shinkansenOriginStationCode;
  NSData *v13;
  NSData *shinkansenDestinationStationCode;
  NSData *v15;
  NSNumber *shinkansenDepartureTime;
  NSNumber *v17;
  NSNumber *shinkansenArrivalTime;
  NSNumber *v19;
  NSString *shinkansenTrainName;
  NSString *v21;
  NSNumber *shinkansenCarNumber;
  NSNumber *v23;
  NSNumber *shinkansenSeatRow;
  NSNumber *v25;
  NSNumber *shinkansenSeatNumber;
  NSNumber *v27;
  NSData *shinkansenSecondaryOriginStationCode;
  NSData *v29;
  NSData *shinkansenSecondaryDestinationStationCode;
  NSData *v31;
  NSNumber *shinkansenSecondaryDepartureTime;
  NSNumber *v33;
  NSNumber *shinkansenSecondaryArrivalTime;
  NSNumber *v35;
  NSString *shinkansenSecondaryTrainName;
  NSString *v37;
  NSNumber *shinkansenSecondaryCarNumber;
  NSNumber *v39;
  NSNumber *shinkansenSecondarySeatRow;
  NSNumber *v41;
  NSNumber *shinkansenSecondarySeatNumber;
  NSNumber *v43;
  NSData *greenCarOriginStationCode;
  NSData *v45;
  NSData *greenCarDestinationStationCode;
  NSData *v47;
  NSNumber *greenCarValidityStartDate;
  NSNumber *v49;
  NSString *shinkansenOriginStationString;
  NSString *v51;
  NSString *shinkansenDestinationStationString;
  NSString *v53;
  NSString *shinkansenSecondaryOriginStationString;
  NSString *v55;
  NSString *shinkansenSecondaryDestinationStationString;
  NSString *v57;
  NSString *greenCarOriginStationString;
  NSString *v59;
  NSString *greenCarDestinationStationString;
  NSString *v61;
  objc_super v62;

  v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
    goto LABEL_13;
  }
  v5 = v4;
  v62.receiver = self;
  v62.super_class = (Class)PKFelicaTransitAppletState;
  if (!-[PKTransitAppletState isEqual:](&v62, sel_isEqual_, v5)
    || self->_shinkansenTicketActive != *((unsigned __int8 *)v5 + 88)
    || self->_greenCarTicketUsed != *((unsigned __int8 *)v5 + 89)
    || self->_balanceAllowedForCommute != *((unsigned __int8 *)v5 + 90)
    || self->_lowBalanceNotificationEnabled != *((unsigned __int8 *)v5 + 91))
  {
    goto LABEL_13;
  }
  shinkansenValidityStartDate = self->_shinkansenValidityStartDate;
  v7 = (NSNumber *)v5[12];
  if (shinkansenValidityStartDate && v7)
  {
    if ((-[NSNumber isEqual:](shinkansenValidityStartDate, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenValidityStartDate != v7)
  {
    goto LABEL_13;
  }
  shinkansenValidityTerm = self->_shinkansenValidityTerm;
  v11 = (NSNumber *)v5[13];
  if (shinkansenValidityTerm && v11)
  {
    if ((-[NSNumber isEqual:](shinkansenValidityTerm, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenValidityTerm != v11)
  {
    goto LABEL_13;
  }
  shinkansenOriginStationCode = self->_shinkansenOriginStationCode;
  v13 = (NSData *)v5[14];
  if (shinkansenOriginStationCode && v13)
  {
    if ((-[NSData isEqual:](shinkansenOriginStationCode, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenOriginStationCode != v13)
  {
    goto LABEL_13;
  }
  shinkansenDestinationStationCode = self->_shinkansenDestinationStationCode;
  v15 = (NSData *)v5[15];
  if (shinkansenDestinationStationCode && v15)
  {
    if ((-[NSData isEqual:](shinkansenDestinationStationCode, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenDestinationStationCode != v15)
  {
    goto LABEL_13;
  }
  shinkansenDepartureTime = self->_shinkansenDepartureTime;
  v17 = (NSNumber *)v5[16];
  if (shinkansenDepartureTime && v17)
  {
    if ((-[NSNumber isEqual:](shinkansenDepartureTime, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenDepartureTime != v17)
  {
    goto LABEL_13;
  }
  shinkansenArrivalTime = self->_shinkansenArrivalTime;
  v19 = (NSNumber *)v5[17];
  if (shinkansenArrivalTime && v19)
  {
    if ((-[NSNumber isEqual:](shinkansenArrivalTime, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenArrivalTime != v19)
  {
    goto LABEL_13;
  }
  shinkansenTrainName = self->_shinkansenTrainName;
  v21 = (NSString *)v5[18];
  if (shinkansenTrainName && v21)
  {
    if ((-[NSString isEqual:](shinkansenTrainName, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenTrainName != v21)
  {
    goto LABEL_13;
  }
  shinkansenCarNumber = self->_shinkansenCarNumber;
  v23 = (NSNumber *)v5[19];
  if (shinkansenCarNumber && v23)
  {
    if ((-[NSNumber isEqual:](shinkansenCarNumber, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenCarNumber != v23)
  {
    goto LABEL_13;
  }
  shinkansenSeatRow = self->_shinkansenSeatRow;
  v25 = (NSNumber *)v5[20];
  if (shinkansenSeatRow && v25)
  {
    if ((-[NSNumber isEqual:](shinkansenSeatRow, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenSeatRow != v25)
  {
    goto LABEL_13;
  }
  shinkansenSeatNumber = self->_shinkansenSeatNumber;
  v27 = (NSNumber *)v5[21];
  if (shinkansenSeatNumber && v27)
  {
    if ((-[NSNumber isEqual:](shinkansenSeatNumber, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenSeatNumber != v27)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryOriginStationCode = self->_shinkansenSecondaryOriginStationCode;
  v29 = (NSData *)v5[22];
  if (shinkansenSecondaryOriginStationCode && v29)
  {
    if ((-[NSData isEqual:](shinkansenSecondaryOriginStationCode, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenSecondaryOriginStationCode != v29)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryDestinationStationCode = self->_shinkansenSecondaryDestinationStationCode;
  v31 = (NSData *)v5[23];
  if (shinkansenSecondaryDestinationStationCode && v31)
  {
    if ((-[NSData isEqual:](shinkansenSecondaryDestinationStationCode, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenSecondaryDestinationStationCode != v31)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryDepartureTime = self->_shinkansenSecondaryDepartureTime;
  v33 = (NSNumber *)v5[24];
  if (shinkansenSecondaryDepartureTime && v33)
  {
    if ((-[NSNumber isEqual:](shinkansenSecondaryDepartureTime, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenSecondaryDepartureTime != v33)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryArrivalTime = self->_shinkansenSecondaryArrivalTime;
  v35 = (NSNumber *)v5[25];
  if (shinkansenSecondaryArrivalTime && v35)
  {
    if ((-[NSNumber isEqual:](shinkansenSecondaryArrivalTime, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenSecondaryArrivalTime != v35)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryTrainName = self->_shinkansenSecondaryTrainName;
  v37 = (NSString *)v5[26];
  if (shinkansenSecondaryTrainName && v37)
  {
    if ((-[NSString isEqual:](shinkansenSecondaryTrainName, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenSecondaryTrainName != v37)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryCarNumber = self->_shinkansenSecondaryCarNumber;
  v39 = (NSNumber *)v5[27];
  if (shinkansenSecondaryCarNumber && v39)
  {
    if ((-[NSNumber isEqual:](shinkansenSecondaryCarNumber, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenSecondaryCarNumber != v39)
  {
    goto LABEL_13;
  }
  shinkansenSecondarySeatRow = self->_shinkansenSecondarySeatRow;
  v41 = (NSNumber *)v5[28];
  if (shinkansenSecondarySeatRow && v41)
  {
    if ((-[NSNumber isEqual:](shinkansenSecondarySeatRow, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenSecondarySeatRow != v41)
  {
    goto LABEL_13;
  }
  shinkansenSecondarySeatNumber = self->_shinkansenSecondarySeatNumber;
  v43 = (NSNumber *)v5[29];
  if (shinkansenSecondarySeatNumber && v43)
  {
    if ((-[NSNumber isEqual:](shinkansenSecondarySeatNumber, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenSecondarySeatNumber != v43)
  {
    goto LABEL_13;
  }
  greenCarOriginStationCode = self->_greenCarOriginStationCode;
  v45 = (NSData *)v5[30];
  if (greenCarOriginStationCode && v45)
  {
    if ((-[NSData isEqual:](greenCarOriginStationCode, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (greenCarOriginStationCode != v45)
  {
    goto LABEL_13;
  }
  greenCarDestinationStationCode = self->_greenCarDestinationStationCode;
  v47 = (NSData *)v5[31];
  if (greenCarDestinationStationCode && v47)
  {
    if ((-[NSData isEqual:](greenCarDestinationStationCode, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (greenCarDestinationStationCode != v47)
  {
    goto LABEL_13;
  }
  greenCarValidityStartDate = self->_greenCarValidityStartDate;
  v49 = (NSNumber *)v5[32];
  if (greenCarValidityStartDate && v49)
  {
    if ((-[NSNumber isEqual:](greenCarValidityStartDate, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (greenCarValidityStartDate != v49)
  {
    goto LABEL_13;
  }
  if (self->_hasShinkansenTicket != *((unsigned __int8 *)v5 + 92)
    || self->_hasGreenCarTicket != *((unsigned __int8 *)v5 + 93))
  {
    goto LABEL_13;
  }
  shinkansenOriginStationString = self->_shinkansenOriginStationString;
  v51 = (NSString *)v5[33];
  if (shinkansenOriginStationString && v51)
  {
    if ((-[NSString isEqual:](shinkansenOriginStationString, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenOriginStationString != v51)
  {
    goto LABEL_13;
  }
  shinkansenDestinationStationString = self->_shinkansenDestinationStationString;
  v53 = (NSString *)v5[34];
  if (shinkansenDestinationStationString && v53)
  {
    if ((-[NSString isEqual:](shinkansenDestinationStationString, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenDestinationStationString != v53)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryOriginStationString = self->_shinkansenSecondaryOriginStationString;
  v55 = (NSString *)v5[35];
  if (shinkansenSecondaryOriginStationString && v55)
  {
    if ((-[NSString isEqual:](shinkansenSecondaryOriginStationString, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenSecondaryOriginStationString != v55)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryDestinationStationString = self->_shinkansenSecondaryDestinationStationString;
  v57 = (NSString *)v5[36];
  if (shinkansenSecondaryDestinationStationString && v57)
  {
    if ((-[NSString isEqual:](shinkansenSecondaryDestinationStationString, "isEqual:") & 1) == 0)
      goto LABEL_13;
  }
  else if (shinkansenSecondaryDestinationStationString != v57)
  {
    goto LABEL_13;
  }
  greenCarOriginStationString = self->_greenCarOriginStationString;
  v59 = (NSString *)v5[37];
  if (greenCarOriginStationString && v59)
  {
    if ((-[NSString isEqual:](greenCarOriginStationString, "isEqual:") & 1) != 0)
      goto LABEL_143;
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  if (greenCarOriginStationString != v59)
    goto LABEL_13;
LABEL_143:
  greenCarDestinationStationString = self->_greenCarDestinationStationString;
  v61 = (NSString *)v5[38];
  if (greenCarDestinationStationString && v61)
    v8 = -[NSString isEqual:](greenCarDestinationStationString, "isEqual:");
  else
    v8 = greenCarDestinationStationString == v61;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (2 * self->_hasShinkansenTicket) | (4* ((2 * self->_lowBalanceNotificationEnabled) | (4 * ((2 * self->_greenCarTicketUsed) | (4 * self->_shinkansenTicketActive) | self->_balanceAllowedForCommute)) | self->_hasGreenCarTicket)));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v27.receiver = self;
  v27.super_class = (Class)PKFelicaTransitAppletState;
  v5 = -[PKTransitAppletState hash](&v27, sel_hash);
  v6 = v5 ^ -[NSNumber hash](self->_shinkansenValidityStartDate, "hash");
  v7 = v6 ^ -[NSNumber hash](self->_shinkansenValidityTerm, "hash");
  v8 = v7 ^ -[NSData hash](self->_shinkansenOriginStationCode, "hash");
  v9 = v8 ^ -[NSData hash](self->_shinkansenDestinationStationCode, "hash");
  v10 = v9 ^ -[NSNumber hash](self->_shinkansenDepartureTime, "hash");
  v11 = v10 ^ -[NSNumber hash](self->_shinkansenArrivalTime, "hash");
  v12 = v11 ^ -[NSString hash](self->_shinkansenTrainName, "hash");
  v13 = v12 ^ -[NSNumber hash](self->_shinkansenCarNumber, "hash");
  v14 = v13 ^ -[NSNumber hash](self->_shinkansenSeatRow, "hash");
  v15 = v14 ^ -[NSNumber hash](self->_shinkansenSeatNumber, "hash");
  v16 = v15 ^ -[NSData hash](self->_shinkansenSecondaryOriginStationCode, "hash") ^ v4;
  v17 = -[NSData hash](self->_shinkansenSecondaryDestinationStationCode, "hash");
  v18 = v17 ^ -[NSNumber hash](self->_shinkansenSecondaryDepartureTime, "hash");
  v19 = v18 ^ -[NSNumber hash](self->_shinkansenSecondaryArrivalTime, "hash");
  v20 = v19 ^ -[NSString hash](self->_shinkansenSecondaryTrainName, "hash");
  v21 = v20 ^ -[NSNumber hash](self->_shinkansenSecondaryCarNumber, "hash");
  v22 = v21 ^ -[NSNumber hash](self->_shinkansenSecondarySeatRow, "hash");
  v23 = v22 ^ -[NSNumber hash](self->_shinkansenSecondarySeatNumber, "hash");
  v24 = v23 ^ -[NSData hash](self->_greenCarOriginStationCode, "hash");
  v25 = v24 ^ -[NSData hash](self->_greenCarDestinationStationCode, "hash");
  return v16 ^ v25 ^ -[NSNumber hash](self->_greenCarValidityStartDate, "hash");
}

- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
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
  char v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v51;
  void *v52;
  char v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  const __CFString *v77;
  int v78;
  const __CFString *v79;
  id v81;
  id v82;
  PKFelicaTransitAppletState *v83;
  void *v85;
  uint8_t buf[4];
  const __CFString *v87;
  __int16 v88;
  const __CFString *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)-[PKFelicaTransitAppletState copy](self, "copy");
  v9 = objc_msgSend(v7, "source");
  objc_msgSend(v7, "sanitizeValuesWithState:", self);
  objc_msgSend(v8, "setBlacklisted:", objc_msgSend(v7, "isBlacklisted"));
  objc_msgSend(v8, "setShinkansenTicketActive:", objc_msgSend(v7, "isShinkansenTicketActive"));
  objc_msgSend(v8, "setGreenCarTicketUsed:", objc_msgSend(v7, "isGreenCarTicketUsed"));
  objc_msgSend(v8, "setBalanceAllowedForCommute:", objc_msgSend(v7, "isBalanceAllowedForCommute"));
  objc_msgSend(v8, "setLowBalanceNotificationEnabled:", objc_msgSend(v7, "isLowBalanceNotificationEnabled"));
  objc_msgSend(v8, "enrouteTransitTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enrouteTransitTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = self;
  -[PKTransitAppletState updatedEnrouteTransitTypesFromExistingTypes:newTypes:](self, "updatedEnrouteTransitTypesFromExistingTypes:newTypes:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnrouteTransitTypes:", v12);

  objc_msgSend(v7, "shinkansenTicket");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v85 = v13;
  if (v13 || v9 == 1)
  {
    objc_msgSend(v13, "validityStartDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShinkansenValidityStartDate:", v18);

    objc_msgSend(v14, "validityTerm");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShinkansenValidityTerm:", v19);

    objc_msgSend(v14, "trains");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    v82 = v20;
    if (v21)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    v81 = (id)v9;
    objc_msgSend(v22, "departureTime");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShinkansenDepartureTime:", v23);

    objc_msgSend(v22, "arrivalTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShinkansenArrivalTime:", v24);

    objc_msgSend(v22, "trainName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShinkansenTrainName:", v25);

    objc_msgSend(v22, "carNumber");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShinkansenCarNumber:", v26);

    objc_msgSend(v22, "seatRow");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShinkansenSeatRow:", v27);

    objc_msgSend(v22, "seatNumber");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShinkansenSeatNumber:", v28);

    objc_msgSend(v22, "originStation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shinkansenOriginStationCode");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29 && v30)
    {
      v32 = objc_msgSend(v29, "isEqual:", v30);

      if ((v32 & 1) != 0)
      {
LABEL_10:
        v33 = 0;
LABEL_13:
        objc_msgSend(v22, "destinationStation");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "shinkansenDestinationStationCode");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v34 && v35)
        {
          v37 = objc_msgSend(v34, "isEqual:", v35);

          if ((v37 & 1) != 0)
            goto LABEL_24;
        }
        else
        {

          if (v34 == v36)
            goto LABEL_24;
        }
        objc_msgSend(v8, "setShinkansenDestinationStationCode:", v34);
        objc_msgSend(v8, "setShinkansenDestinationStationString:", 0);
        v33 = v33 || v34 != 0;
LABEL_24:
        if (v21 < 2)
        {
          v39 = 0;
        }
        else
        {
          objc_msgSend(v82, "objectAtIndexedSubscript:", 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v39, "departureTime");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setShinkansenSecondaryDepartureTime:", v40);

        objc_msgSend(v39, "arrivalTime");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setShinkansenSecondaryArrivalTime:", v41);

        objc_msgSend(v39, "trainName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setShinkansenSecondaryTrainName:", v42);

        objc_msgSend(v39, "carNumber");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setShinkansenSecondaryCarNumber:", v43);

        objc_msgSend(v39, "seatRow");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setShinkansenSecondarySeatRow:", v44);

        objc_msgSend(v39, "seatNumber");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setShinkansenSecondarySeatNumber:", v45);

        objc_msgSend(v39, "originStation");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "shinkansenSecondaryOriginStationCode");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        if (v46 && v47)
        {
          v49 = objc_msgSend(v46, "isEqual:", v47);

          if ((v49 & 1) != 0)
            goto LABEL_38;
        }
        else
        {

          if (v46 == v48)
            goto LABEL_38;
        }
        objc_msgSend(v8, "setShinkansenSecondaryOriginStationCode:", v46);
        objc_msgSend(v8, "setShinkansenSecondaryOriginStationString:", 0);
        v33 = v33 || v46 != 0;
LABEL_38:
        objc_msgSend(v39, "destinationStation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "shinkansenSecondaryDestinationStationCode");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        v9 = (uint64_t)v81;
        if (v16 && v51)
        {
          v53 = objc_msgSend(v16, "isEqual:", v51);

          if ((v53 & 1) != 0)
          {
LABEL_41:
            v15 = a5;
LABEL_49:
            objc_msgSend(v8, "setHasShinkansenTicket:", v85 != 0);

            v17 = v33;
            goto LABEL_50;
          }
        }
        else
        {

          if (v16 == v52)
            goto LABEL_41;
        }
        v15 = a5;
        objc_msgSend(v8, "setShinkansenSecondaryDestinationStationCode:", v16);
        objc_msgSend(v8, "setShinkansenSecondaryDestinationStationString:", 0);
        v33 = v33 || v16 != 0;
        goto LABEL_49;
      }
    }
    else
    {

      if (v29 == v31)
        goto LABEL_10;
    }
    v33 = v29 != 0;
    objc_msgSend(v8, "setShinkansenOriginStationCode:", v29);
    objc_msgSend(v8, "setShinkansenOriginStationString:", 0);
    goto LABEL_13;
  }
  v15 = a5;
  v16 = 0;
  v17 = 0;
LABEL_50:
  objc_msgSend(v7, "greenCarTicket");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55 || v9 == 1)
  {
    objc_msgSend(v55, "originStation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "greenCarOriginStationCode");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v58;
    if (v57 && v58)
    {
      v60 = objc_msgSend(v57, "isEqual:", v58);

      if ((v60 & 1) != 0)
        goto LABEL_59;
    }
    else
    {

      if (v57 == v59)
        goto LABEL_59;
    }
    objc_msgSend(v8, "setGreenCarOriginStationCode:", v57);
    objc_msgSend(v8, "setGreenCarOriginStationString:", 0);
    if (v57)
      v17 = 1;
LABEL_59:
    objc_msgSend(v56, "destinationStation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "greenCarDestinationStationCode");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v16 && v61)
    {
      v63 = objc_msgSend(v16, "isEqual:", v61);

      if ((v63 & 1) != 0)
        goto LABEL_66;
    }
    else
    {

      if (v16 == v62)
      {
LABEL_66:
        objc_msgSend(v56, "validityStartDate");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setGreenCarValidityStartDate:", v64);

        objc_msgSend(v8, "setHasGreenCarTicket:", v56 != 0);
        goto LABEL_67;
      }
    }
    objc_msgSend(v8, "setGreenCarDestinationStationCode:", v16);
    objc_msgSend(v8, "setGreenCarDestinationStationString:", 0);
    if (v16)
      v17 = 1;
    goto LABEL_66;
  }
LABEL_67:
  objc_msgSend(v8, "shinkansenOriginStationCode");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    v66 = 1;
  }
  else
  {
    objc_msgSend(v8, "shinkansenDestinationStationCode");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v67)
    {
      v66 = 1;
    }
    else
    {
      objc_msgSend(v8, "shinkansenSecondaryOriginStationCode");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v68)
      {
        v66 = 1;
      }
      else
      {
        objc_msgSend(v8, "shinkansenSecondaryDestinationStationCode");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (v69)
        {
          v66 = 1;
        }
        else
        {
          objc_msgSend(v8, "greenCarOriginStationCode");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (v70)
          {
            v66 = 1;
          }
          else
          {
            objc_msgSend(v8, "greenCarDestinationStationCode");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = v71 != 0;

            v70 = 0;
          }

          v69 = 0;
        }

      }
    }

  }
  if (((v66 ^ 1 | v17) & 1) == 0)
    v66 = objc_msgSend(v8, "needsStationProcessing");
  objc_msgSend(v8, "setNeedsStationProcessing:", v66);
  objc_msgSend(v7, "balance");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBalance:", v72);

  objc_msgSend(v7, "historyRecords");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v73, "count"))
  {
    objc_msgSend(v73, "objectAtIndexedSubscript:", 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "historySequenceNumber");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v75)
      objc_msgSend(v8, "setHistorySequenceNumber:", v75);

  }
  if ((unint64_t)a4 | (unint64_t)v15 && !-[PKFelicaTransitAppletState isEqual:](v83, "isEqual:", v8))
  {
    -[PKFelicaTransitAppletState _resolveTransactionsFromState:toState:withHistoryRecords:concreteTransactions:ephemeralTransaction:](v83, "_resolveTransactionsFromState:toState:withHistoryRecords:concreteTransactions:ephemeralTransaction:", v83, v8, v73, a4, v15);
    PKLogFacilityTypeGetObject(0xCuLL);
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v8, "isInStation"))
        v77 = CFSTR("inStation ");
      else
        v77 = &stru_1E2ADF4C0;
      v78 = objc_msgSend(v8, "isInShinkansenStation");
      v79 = CFSTR("inShinkansenStation");
      if (!v78)
        v79 = &stru_1E2ADF4C0;
      *(_DWORD *)buf = 138412546;
      v87 = v77;
      v88 = 2112;
      v89 = v79;
      _os_log_impl(&dword_18FC92000, v76, OS_LOG_TYPE_DEFAULT, "Resolved State is: %@%@", buf, 0x16u);
    }

  }
  return v8;
}

- (void)_resolveTransactionsFromState:(id)a3 toState:(id)a4 withHistoryRecords:(id)a5 concreteTransactions:(id *)a6 ephemeralTransaction:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  id *v33;
  void *v34;
  int v35;
  unint64_t v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  void *v44;
  void *v45;
  uint64_t v46;
  int v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id *v60;
  id v61;
  id v62;
  id *v63;
  id *v64;
  void *v65;
  void *v67;
  unint64_t v68;
  int v69;
  char v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v11, "historySequenceNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");
  v67 = v14;
  v65 = v13;
  if (v14
    && (objc_msgSend(v12, "historySequenceNumber"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "unsignedIntegerValue"),
        v16,
        v15 == v17))
  {
    v18 = 0;
  }
  else
  {
    v62 = v12;
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v20 = v13;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    if (v21)
    {
      v22 = v21;
      v63 = a6;
      v60 = a7;
      v61 = v11;
      v23 = 0;
      v24 = *(_QWORD *)v72;
      while (2)
      {
        v25 = 0;
        v26 = v23;
        do
        {
          if (*(_QWORD *)v72 != v24)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v25);
          objc_msgSend(v27, "historySequenceNumber");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v23, "unsignedIntegerValue");
          if (v67 && v15 == v28)
          {

            v23 = v26;
            goto LABEL_18;
          }
          if (!v26 || v28 != objc_msgSend(v26, "unsignedIntegerValue"))
            objc_msgSend(v19, "addObject:", v27);

          ++v25;
          v26 = v23;
        }
        while (v22 != v25);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
        if (v22)
          continue;
        break;
      }
LABEL_18:

      a7 = v60;
      v11 = v61;
      a6 = v63;
    }

    objc_msgSend(v19, "reverseObjectEnumerator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v62;
  }
  v70 = 0;
  v30 = objc_msgSend(v18, "count");
  if (a6)
  {
    v31 = v30;
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v30 + 2);
    if (v31)
    {
      v64 = a6;
      v33 = a7;
      objc_msgSend(v11, "balance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "unsignedLongLongValue");

      v36 = 0;
      v69 = v35;
      while (v36 < v31)
      {
        v68 = 0;
        -[PKFelicaTransitAppletState _concreteTransactionForRecordAtIndex:withBalance:historyRecords:terminalState:numberProcessed:exitedShinkansen:](self, "_concreteTransactionForRecordAtIndex:withBalance:historyRecords:terminalState:numberProcessed:exitedShinkansen:", v36, &v69, v18, v12, &v68, &v70);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          objc_msgSend(v32, "addObject:", v37);
        v38 = v68;
        if (!v68)
        {

          break;
        }
        v39 = v31 + ~v36;

        if (v38 <= v39)
          v40 = v38;
        else
          v40 = 0;
        v36 += v40;
        if (v38 > v39)
          break;
      }
      a7 = v33;
      a6 = v64;
    }
    v41 = objc_msgSend(v32, "count");
    v42 = objc_msgSend(v11, "isInShinkansenStation");
    if (v42 == objc_msgSend(v12, "isInShinkansenStation")
      || v70
      || (objc_msgSend(v12, "isInShinkansenStation") & 1) != 0)
    {
      v43 = objc_msgSend(v11, "isInStation");
      if (v43 == objc_msgSend(v12, "isInStation") || (objc_msgSend(v12, "isInStation") & 1) != 0 || v41)
        goto LABEL_43;
      +[PKPaymentTransaction paymentTransactionWithSource:](PKPaymentTransaction, "paymentTransactionWithSource:", 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setTransactionType:", 2);
      v45 = v44;
      v46 = 1;
    }
    else
    {
      +[PKPaymentTransaction paymentTransactionWithSource:](PKPaymentTransaction, "paymentTransactionWithSource:", 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setTransactionType:", 2);
      v45 = v44;
      v46 = 257;
    }
    objc_msgSend(v45, "setTransitType:", v46);
    objc_msgSend(v44, "setOriginatedByDevice:", 1);
    objc_msgSend(v32, "addObject:", v44);

LABEL_43:
    v47 = objc_msgSend(v11, "isGreenCarTicketUsed");
    if (v47 != objc_msgSend(v12, "isGreenCarTicketUsed")
      && objc_msgSend(v12, "isGreenCarTicketUsed"))
    {
      +[PKPaymentTransaction paymentTransactionWithSource:](PKPaymentTransaction, "paymentTransactionWithSource:", 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setTransactionType:", 2);
      objc_msgSend(v48, "setTransitType:", 1025);
      objc_msgSend(v48, "setOriginatedByDevice:", 1);
      objc_msgSend(v32, "addObject:", v48);

    }
    if (!objc_msgSend(v32, "count"))
    {

      v32 = 0;
    }
    v49 = (void *)objc_msgSend(v32, "copy");
    v50 = *a6;
    *a6 = v49;

  }
  if (a7)
  {
    objc_msgSend(v11, "enrouteTransitTypes");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "lastObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "enrouteTransitTypes");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "lastObject");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54 && (objc_msgSend(v54, "isEqual:", v52) & 1) == 0)
    {
      v56 = a7;
      v57 = PKPaymentTransactionTransitSubtypeForTransactionDetailString(v54);
      if (v57)
      {
        v58 = v57;
        +[PKPaymentTransaction paymentTransactionWithSource:](PKPaymentTransaction, "paymentTransactionWithSource:", 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setTransactionType:", 2);
        objc_msgSend(v55, "setTransitType:", v58);
        objc_msgSend(v55, "setEnRoute:", 1);
        objc_msgSend(v55, "setOriginatedByDevice:", 1);
      }
      else
      {
        v55 = 0;
      }
      a7 = v56;
    }
    else
    {
      v55 = 0;
    }
    v59 = *a7;
    *a7 = v55;

  }
}

- (id)_concreteTransactionForRecordAtIndex:(unint64_t)a3 withBalance:(unsigned int *)a4 historyRecords:(id)a5 terminalState:(id)a6 numberProcessed:(unint64_t *)a7 exitedShinkansen:(BOOL *)a8
{
  id v11;
  unint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  unint64_t v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v45;
  unint64_t v47;
  __int16 v48;
  uint64_t v49;
  unint64_t v50;
  NSObject *v51;
  id v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  id v62;
  unint64_t v64;
  __int16 v65;
  void *v68;
  id v69;
  unsigned int *v70;
  unint64_t v71;
  unsigned int v72;
  unint64_t v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  int v77;
  __int16 v78;
  id v79;
  __int16 v80;
  int v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v69 = a6;
  v12 = objc_msgSend(v11, "count");
  objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v68 = v11;
  v70 = a4;
  if (a3 + 1 >= v12)
  {
    v23 = 0;
    v25 = 0;
    v26 = 0;
    v22 = 0;
    v64 = 1;
    goto LABEL_71;
  }
  v15 = v13;
  objc_msgSend(v11, "objectAtIndexedSubscript:", a3 + 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = FelicaTransitHistoryRecordFromFelicaRecord(v15);
  v19 = v18;
  v20 = FelicaTransitHistoryRecordFromFelicaRecord(v16);
  v22 = 0;
  v23 = 0;
  v24 = 1;
  if (v17 > 0x15u)
    goto LABEL_28;
  v25 = 0;
  v26 = 0;
  v14 = v15;
  if (((1 << v17) & 0x380062) == 0)
    goto LABEL_70;
  v22 = 0;
  v23 = 0;
  v24 = 1;
  if (v20 > 0x15u)
    goto LABEL_28;
  v25 = 0;
  v26 = 0;
  v14 = v15;
  if (((1 << v20) & 0x380062) == 0)
    goto LABEL_70;
  v22 = 0;
  v23 = 0;
  v24 = 1;
  if (HIBYTE(v17) > 0x1Cu)
    goto LABEL_28;
  v25 = 0;
  v26 = 0;
  v14 = v15;
  if (((1 << SHIBYTE(v17)) & 0x12000090) == 0)
    goto LABEL_70;
  v22 = 0;
  v23 = 0;
  v71 = v20 >> 8;
  v24 = 1;
  if (BYTE1(v20) > 0x1Bu)
  {
LABEL_28:
    v25 = 0;
    v26 = 0;
    v14 = v15;
    goto LABEL_70;
  }
  v25 = 0;
  v26 = 0;
  v14 = v15;
  if (((1 << SBYTE1(v20)) & 0x9000048) != 0)
  {
    v27 = v21;
    v28 = HIDWORD(v21);
    if (HIDWORD(v19) && HIDWORD(v21) && v21 != v19)
    {
      v23 = 0;
      v25 = 0;
      v26 = 0;
      v22 = 0;
      v24 = 1;
      v14 = v15;
      goto LABEL_70;
    }
    v65 = v20;
    PKLogFacilityTypeGetObject(0xCuLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "historySequenceNumber");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "historySequenceNumber");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v75 = v30;
      v76 = 1024;
      v77 = HIBYTE(v17);
      v78 = 2112;
      v79 = v31;
      v80 = 1024;
      v81 = HIBYTE(v65);
      _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Combining history records [{sequence number: %@, sector combination: %hhu}, {sequence number: %@, sector combination: %hhu}].", buf, 0x22u);

    }
    v32 = (void *)objc_msgSend(v16, "copy");
    if (HIDWORD(v19))
      v33 = v19;
    else
      v33 = v27;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAmountType:", v34);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v28 + HIDWORD(v19)));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PKDecimalAmountFromAmount(v35, CFSTR("JPY"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAmount:", v36);

    if (v65 <= 0x15u
      && ((1 << v65) & 0x380062) != 0
      && v71 <= 0x1Bu
      && ((1 << v71) & 0xFFF7AF8) != 0)
    {
      objc_msgSend(v16, "endStation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = HIBYTE(v17);
      goto LABEL_25;
    }
    v38 = HIBYTE(v17);
    if (IsStartStationAvailable(v65, v71))
    {
      v41 = v16;
    }
    else
    {
      if (v17 <= 0x15u
        && ((1 << v17) & 0x380062) != 0
        && HIBYTE(v17) <= 0x1Cu
        && ((1 << SHIBYTE(v17)) & 0x1FFF7AF0) != 0)
      {
        objc_msgSend(v15, "endStation");
        v42 = objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
      if (!IsStartStationAvailable(v17, HIBYTE(v17)))
      {
        v37 = 0;
        goto LABEL_41;
      }
      v41 = v15;
    }
    objc_msgSend(v41, "startStation");
    v42 = objc_claimAutoreleasedReturnValue();
LABEL_37:
    v37 = (void *)v42;
LABEL_25:
    if (IsStartStationAvailable(v17, v38))
    {
      v39 = v15;
LABEL_27:
      objc_msgSend(v39, "startStation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:
      v25 = (uint64_t)v40;
      if (v37 && v40)
      {
        v23 = (uint64_t)v37;
        if ((objc_msgSend(v40, "isEqual:", v37) & 1) == 0)
        {
LABEL_51:
          v14 = v32;

          v22 = v17 == 19 || v65 == 19;
          if ((v38 - 4) < 0x19u && ((0x1B5613Du >> (v38 - 4)) & 1) != 0)
          {
            v45 = 1;
          }
          else if ((v71 - 3) >= 0x19u)
          {
            v45 = 0;
          }
          else
          {
            v45 = qword_1904534E0[(char)(v71 - 3)];
          }
          if ((HIBYTE(v65) - 23) >= 6u && (HIBYTE(v17) - 23) >= 6u)
            v26 = v45;
          else
            v26 = v45 | 2;

          v24 = 2;
          goto LABEL_70;
        }
LABEL_50:

        v23 = 0;
        goto LABEL_51;
      }
LABEL_140:
      v23 = (uint64_t)v37;
      v37 = (void *)v25;
      if (v25 != v23)
        goto LABEL_51;
      goto LABEL_50;
    }
LABEL_41:
    if (v17 <= 0x15u && ((1 << v17) & 0x380062) != 0 && v38 <= 0x1Cu && ((1 << v38) & 0x1FFF7AF0) != 0)
    {
      v43 = v15;
    }
    else
    {
      if (IsStartStationAvailable(v65, v71))
      {
        v39 = v16;
        goto LABEL_27;
      }
      v25 = 0;
      if (v65 > 0x15u)
        goto LABEL_140;
      if (((1 << v65) & 0x380062) == 0)
        goto LABEL_140;
      v25 = 0;
      if (v71 > 0x1Bu || ((1 << v71) & 0xFFF7AF8) == 0)
        goto LABEL_140;
      v43 = v16;
    }
    objc_msgSend(v43, "endStation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
LABEL_70:
  v64 = v24;

  a4 = v70;
LABEL_71:
  v47 = FelicaTransitHistoryRecordFromFelicaRecord(v14);
  v48 = v47;
  if ((v47 - 1) > 0x4Bu)
    v49 = 0;
  else
    v49 = qword_1904535A8[(char)(v47 - 1)];
  v73 = HIDWORD(v47);
  if (a4)
  {
    v72 = *a4;
    if (v14)
      goto LABEL_76;
LABEL_82:
    if (v22)
      v53 = 257;
    else
      v53 = v49;
    v54 = 1;
    goto LABEL_119;
  }
  v72 = 0;
  if (!v14)
    goto LABEL_82;
LABEL_76:
  v50 = v47 >> 8;
  PKLogFacilityTypeGetObject(0xCuLL);
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "historySequenceNumber");
    v52 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v75 = v52;
    v76 = 1024;
    v77 = v48;
    v78 = 1024;
    LODWORD(v79) = HIBYTE(v48);
    _os_log_impl(&dword_18FC92000, v51, OS_LOG_TYPE_DEFAULT, "Processing History Record: {sequence number: %@, type: %hhu, sector combination: %hhu}", buf, 0x18u);

  }
  if (!(v23 | v25))
  {
    if (IsStartStationAvailable(v48, v50))
    {
      objc_msgSend(v14, "startStation");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v23 = 0;
    if (v48 <= 0x15u && ((1 << v48) & 0x380062) != 0)
    {
      v23 = 0;
      if (v50 <= 0x1Fu && ((1 << v50) & 0xDFFF7AFC) != 0)
      {
        objc_msgSend(v14, "endStation");
        v23 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  if (v48 == 19)
    v22 = 1;
  v55 = v26 | 1;
  if (((1 << v50) & 0x9B5613D8) == 0)
    v55 = v26;
  if (v50 <= 0x1Fu)
    v56 = v55;
  else
    v56 = v26;
  if ((HIBYTE(v48) - 23) >= 6u)
    v26 = v56;
  else
    v26 = v56 | 2;
  if (v22)
    v53 = 257;
  else
    v53 = v49;
  v54 = 1;
  a4 = v70;
  if (!v70 || v72 == (_DWORD)v73)
    goto LABEL_119;
  if (!v53)
  {
    v54 = 0;
    if (v72 <= v73)
      v53 = 513;
    else
      v53 = 515;
    goto LABEL_119;
  }
  if (v72 > v73)
    goto LABEL_115;
  if (v53 != 257)
  {
    if (v53 == 1)
    {
      if ((objc_msgSend(v69, "isInStation") & 1) != 0)
      {
LABEL_114:
        v54 = 0;
        v53 = 513;
        goto LABEL_119;
      }
      if (!v22)
      {
        v54 = 0;
        v53 = v49;
        goto LABEL_119;
      }
      goto LABEL_113;
    }
LABEL_115:
    v54 = 0;
    goto LABEL_119;
  }
LABEL_113:
  if (objc_msgSend(v69, "isInShinkansenStation"))
    goto LABEL_114;
  v54 = 0;
  v53 = 257;
LABEL_119:
  +[PKPaymentTransaction paymentTransactionWithSource:](PKPaymentTransaction, "paymentTransactionWithSource:", 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setTransactionType:", 2);
  objc_msgSend(v57, "setTransitType:", v53);
  objc_msgSend(v57, "setTransitModifiers:", v26);
  objc_msgSend(v14, "transactionID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setPaymentHash:", v58);

  objc_msgSend(v57, "setOriginatedByDevice:", 1);
  if ((v54 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0xCuLL);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v59, OS_LOG_TYPE_DEFAULT, "\tProcessed record has balance change.", buf, 2u);
    }

    if (v72 >= v73)
      v60 = v72 - v73;
    else
      v60 = v73 - v72;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v60, 0, v72 < v73);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setAmount:", v61);

    *a4 = v73;
  }
  objc_msgSend(v57, "setStartStationCode:", v25);
  objc_msgSend(v57, "setEndStationCode:", v23);
  if (a7)
    *a7 = v64;
  if (a8)
    *a8 = v22;
  v62 = v57;

  return v62;
}

- (id)transitPassPropertiesWithPaymentApplication:(id)a3
{
  id v4;
  PKFelicaPassProperties *v5;

  v4 = a3;
  v5 = -[PKFelicaPassProperties initWithTransitAppletState:paymentApplication:fieldCollection:]([PKFelicaPassProperties alloc], "initWithTransitAppletState:paymentApplication:fieldCollection:", self, v4, 0);

  return v5;
}

- (id)transitPassPropertiesWithPaymentApplication:(id)a3 pass:(id)a4
{
  id v6;
  id v7;
  PKSecureElementPassFieldCollection *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[PKSecureElementPassFieldCollection initWithBalanceFieldsFromPass:]([PKSecureElementPassFieldCollection alloc], "initWithBalanceFieldsFromPass:", v6);

  -[PKFelicaTransitAppletState transitPassPropertiesWithPaymentApplication:fieldCollection:](self, "transitPassPropertiesWithPaymentApplication:fieldCollection:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)transitPassPropertiesWithPaymentApplication:(id)a3 fieldCollection:(id)a4
{
  id v6;
  id v7;
  PKFelicaPassProperties *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKFelicaPassProperties initWithTransitAppletState:paymentApplication:fieldCollection:]([PKFelicaPassProperties alloc], "initWithTransitAppletState:paymentApplication:fieldCollection:", self, v7, v6);

  return v8;
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

- (BOOL)isBalanceAllowedForCommute
{
  return self->_balanceAllowedForCommute;
}

- (void)setBalanceAllowedForCommute:(BOOL)a3
{
  self->_balanceAllowedForCommute = a3;
}

- (BOOL)isLowBalanceNotificationEnabled
{
  return self->_lowBalanceNotificationEnabled;
}

- (void)setLowBalanceNotificationEnabled:(BOOL)a3
{
  self->_lowBalanceNotificationEnabled = a3;
}

- (NSNumber)shinkansenValidityStartDate
{
  return self->_shinkansenValidityStartDate;
}

- (void)setShinkansenValidityStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)shinkansenValidityTerm
{
  return self->_shinkansenValidityTerm;
}

- (void)setShinkansenValidityTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)shinkansenOriginStationCode
{
  return self->_shinkansenOriginStationCode;
}

- (void)setShinkansenOriginStationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSData)shinkansenDestinationStationCode
{
  return self->_shinkansenDestinationStationCode;
}

- (void)setShinkansenDestinationStationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)shinkansenDepartureTime
{
  return self->_shinkansenDepartureTime;
}

- (void)setShinkansenDepartureTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)shinkansenArrivalTime
{
  return self->_shinkansenArrivalTime;
}

- (void)setShinkansenArrivalTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)shinkansenTrainName
{
  return self->_shinkansenTrainName;
}

- (void)setShinkansenTrainName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)shinkansenCarNumber
{
  return self->_shinkansenCarNumber;
}

- (void)setShinkansenCarNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)shinkansenSeatRow
{
  return self->_shinkansenSeatRow;
}

- (void)setShinkansenSeatRow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)shinkansenSeatNumber
{
  return self->_shinkansenSeatNumber;
}

- (void)setShinkansenSeatNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSData)shinkansenSecondaryOriginStationCode
{
  return self->_shinkansenSecondaryOriginStationCode;
}

- (void)setShinkansenSecondaryOriginStationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSData)shinkansenSecondaryDestinationStationCode
{
  return self->_shinkansenSecondaryDestinationStationCode;
}

- (void)setShinkansenSecondaryDestinationStationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)shinkansenSecondaryDepartureTime
{
  return self->_shinkansenSecondaryDepartureTime;
}

- (void)setShinkansenSecondaryDepartureTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)shinkansenSecondaryArrivalTime
{
  return self->_shinkansenSecondaryArrivalTime;
}

- (void)setShinkansenSecondaryArrivalTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)shinkansenSecondaryTrainName
{
  return self->_shinkansenSecondaryTrainName;
}

- (void)setShinkansenSecondaryTrainName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSNumber)shinkansenSecondaryCarNumber
{
  return self->_shinkansenSecondaryCarNumber;
}

- (void)setShinkansenSecondaryCarNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)shinkansenSecondarySeatRow
{
  return self->_shinkansenSecondarySeatRow;
}

- (void)setShinkansenSecondarySeatRow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)shinkansenSecondarySeatNumber
{
  return self->_shinkansenSecondarySeatNumber;
}

- (void)setShinkansenSecondarySeatNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)hasShinkansenTicket
{
  return self->_hasShinkansenTicket;
}

- (void)setHasShinkansenTicket:(BOOL)a3
{
  self->_hasShinkansenTicket = a3;
}

- (NSData)greenCarOriginStationCode
{
  return self->_greenCarOriginStationCode;
}

- (void)setGreenCarOriginStationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSData)greenCarDestinationStationCode
{
  return self->_greenCarDestinationStationCode;
}

- (void)setGreenCarDestinationStationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSNumber)greenCarValidityStartDate
{
  return self->_greenCarValidityStartDate;
}

- (void)setGreenCarValidityStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (BOOL)hasGreenCarTicket
{
  return self->_hasGreenCarTicket;
}

- (void)setHasGreenCarTicket:(BOOL)a3
{
  self->_hasGreenCarTicket = a3;
}

- (NSString)shinkansenOriginStationString
{
  return self->_shinkansenOriginStationString;
}

- (void)setShinkansenOriginStationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)shinkansenDestinationStationString
{
  return self->_shinkansenDestinationStationString;
}

- (void)setShinkansenDestinationStationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)shinkansenSecondaryOriginStationString
{
  return self->_shinkansenSecondaryOriginStationString;
}

- (void)setShinkansenSecondaryOriginStationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)shinkansenSecondaryDestinationStationString
{
  return self->_shinkansenSecondaryDestinationStationString;
}

- (void)setShinkansenSecondaryDestinationStationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSString)greenCarOriginStationString
{
  return self->_greenCarOriginStationString;
}

- (void)setGreenCarOriginStationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSString)greenCarDestinationStationString
{
  return self->_greenCarDestinationStationString;
}

- (void)setGreenCarDestinationStationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greenCarDestinationStationString, 0);
  objc_storeStrong((id *)&self->_greenCarOriginStationString, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryDestinationStationString, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryOriginStationString, 0);
  objc_storeStrong((id *)&self->_shinkansenDestinationStationString, 0);
  objc_storeStrong((id *)&self->_shinkansenOriginStationString, 0);
  objc_storeStrong((id *)&self->_greenCarValidityStartDate, 0);
  objc_storeStrong((id *)&self->_greenCarDestinationStationCode, 0);
  objc_storeStrong((id *)&self->_greenCarOriginStationCode, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondarySeatNumber, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondarySeatRow, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryCarNumber, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryTrainName, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryArrivalTime, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryDepartureTime, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryDestinationStationCode, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryOriginStationCode, 0);
  objc_storeStrong((id *)&self->_shinkansenSeatNumber, 0);
  objc_storeStrong((id *)&self->_shinkansenSeatRow, 0);
  objc_storeStrong((id *)&self->_shinkansenCarNumber, 0);
  objc_storeStrong((id *)&self->_shinkansenTrainName, 0);
  objc_storeStrong((id *)&self->_shinkansenArrivalTime, 0);
  objc_storeStrong((id *)&self->_shinkansenDepartureTime, 0);
  objc_storeStrong((id *)&self->_shinkansenDestinationStationCode, 0);
  objc_storeStrong((id *)&self->_shinkansenOriginStationCode, 0);
  objc_storeStrong((id *)&self->_shinkansenValidityTerm, 0);
  objc_storeStrong((id *)&self->_shinkansenValidityStartDate, 0);
}

@end
