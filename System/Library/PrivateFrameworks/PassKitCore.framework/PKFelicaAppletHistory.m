@implementation PKFelicaAppletHistory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)appletTypeForDictionary:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NFServiceProviderID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKFelicaAppletTypeFromSPID(v3);

  return v4;
}

- (PKFelicaAppletHistory)initWithDictionary:(id)a3 source:(int64_t)a4
{
  id v6;
  PKFelicaAppletHistory *v7;
  PKFelicaAppletHistory *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSNumber *SPID;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  PKFelicaAppletHistoryRecord *v32;
  void *v33;
  PKFelicaShinkansenTicket *v34;
  PKFelicaShinkansenTicket *shinkansenTicket;
  void *v36;
  PKFelicaGreenCarTicket *v37;
  PKFelicaGreenCarTicket *greenCarTicket;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKFelicaAppletHistory;
  v7 = -[PKTransitAppletHistory init](&v46, sel_init);
  v8 = v7;
  if (v7)
  {
    -[PKTransitAppletHistory setSource:](v7, "setSource:", a4);
    if (v6)
    {
      v9 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v6, "allKeys");
      a4 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "initWithArray:", a4);
    }
    else
    {
      v10 = 0;
    }
    objc_storeStrong((id *)&v8->_existingKeys, v10);
    if (v6)
    {

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NFServiceProviderID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    SPID = v8->_SPID;
    v8->_SPID = (NSNumber *)v12;

    v8->_type = PKFelicaAppletTypeFromSPID(v8->_SPID);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NFBlacklisted"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransitAppletHistory setBlacklisted:](v8, "setBlacklisted:", objc_msgSend(v14, "BOOLValue"));
    v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NFInStation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "BOOLValue"))
      objc_msgSend(v15, "addObject:", CFSTR("Transit"));
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NFInStationShinkansen"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "BOOLValue"))
      objc_msgSend(v15, "addObject:", CFSTR("TransitTrainShinkansen"));
    -[PKTransitAppletHistory setEnrouteTransitTypes:](v8, "setEnrouteTransitTypes:", v15);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NFTicketUsed"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v8->_greenCarTicketUsed = objc_msgSend(v18, "BOOLValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NFTicketSelected"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v8->_shinkansenTicketActive = objc_msgSend(v19, "unsignedIntegerValue") != 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NFAllowBalanceUsageForCommute"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v8->_balanceAllowedForCommute = objc_msgSend(v20, "BOOLValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NFNotifyOnLowBalance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v8->_lowBalanceNotificationEnabled = objc_msgSend(v21, "BOOLValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NFBalance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PKDecimalAmountFromAmount(v22, CFSTR("JPY"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransitAppletHistory setBalance:](v8, "setBalance:", v23);

    -[PKTransitAppletHistory setCurrency:](v8, "setCurrency:", CFSTR("JPY"));
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NFHistoryRecords"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");
    if (v25)
    {
      v40 = v21;
      v41 = v15;
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v25);
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v27 = v24;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v43;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v43 != v30)
              objc_enumerationMutation(v27);
            v32 = -[PKFelicaAppletHistoryRecord initWithDictionary:]([PKFelicaAppletHistoryRecord alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v31));
            if (v32)
              objc_msgSend(v26, "addObject:", v32);

            ++v31;
          }
          while (v29 != v31);
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v29);
      }

      -[PKTransitAppletHistory setHistoryRecords:](v8, "setHistoryRecords:", v26);
      v21 = v40;
      v15 = v41;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NFShinkansenTicket"), v40, v41, (_QWORD)v42);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = -[PKFelicaShinkansenTicket initWithDictionary:]([PKFelicaShinkansenTicket alloc], "initWithDictionary:", v33);
      shinkansenTicket = v8->_shinkansenTicket;
      v8->_shinkansenTicket = v34;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NFGreenCarTicket"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = -[PKFelicaGreenCarTicket initWithDictionary:]([PKFelicaGreenCarTicket alloc], "initWithDictionary:", v36);
      greenCarTicket = v8->_greenCarTicket;
      v8->_greenCarTicket = v37;

    }
  }

  return v8;
}

- (PKFelicaAppletHistory)initWithCoder:(id)a3
{
  id v4;
  PKFelicaAppletHistory *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *existingKeys;
  uint64_t v11;
  NSNumber *SPID;
  uint64_t v13;
  PKFelicaShinkansenTicket *shinkansenTicket;
  uint64_t v15;
  PKFelicaGreenCarTicket *greenCarTicket;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKFelicaAppletHistory;
  v5 = -[PKTransitAppletHistory initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("existingKeys"));
    v9 = objc_claimAutoreleasedReturnValue();
    existingKeys = v5->_existingKeys;
    v5->_existingKeys = (NSSet *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SPID"));
    v11 = objc_claimAutoreleasedReturnValue();
    SPID = v5->_SPID;
    v5->_SPID = (NSNumber *)v11;

    v5->_type = PKFelicaAppletTypeFromSPID(v5->_SPID);
    v5->_shinkansenTicketActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shinkansenTicketActive"));
    v5->_greenCarTicketUsed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ticketUsed"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shinkansenTicket"));
    v13 = objc_claimAutoreleasedReturnValue();
    shinkansenTicket = v5->_shinkansenTicket;
    v5->_shinkansenTicket = (PKFelicaShinkansenTicket *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("greenCarTicket"));
    v15 = objc_claimAutoreleasedReturnValue();
    greenCarTicket = v5->_greenCarTicket;
    v5->_greenCarTicket = (PKFelicaGreenCarTicket *)v15;

    v5->_balanceAllowedForCommute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("balanceAllowedForCommute"));
    v5->_lowBalanceNotificationEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lowBalanceNotificationEnabled"));
    -[PKTransitAppletHistory enrouteTransitTypes](v5, "enrouteTransitTypes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v17, "containsObject:", CFSTR("TransitMetro"));

    if ((_DWORD)v7)
      -[PKTransitAppletHistory setEnrouteTransitTypes:](v5, "setEnrouteTransitTypes:", 0);
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inStation"))
      && !-[PKFelicaAppletHistory isInStation](v5, "isInStation"))
    {
      -[PKFelicaAppletHistory _addEnrouteTransitType:](v5, "_addEnrouteTransitType:", CFSTR("Transit"));
    }
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inShinkansenStation"))
      && !-[PKFelicaAppletHistory isInShinkansenStation](v5, "isInShinkansenStation"))
    {
      -[PKFelicaAppletHistory _addEnrouteTransitType:](v5, "_addEnrouteTransitType:", CFSTR("TransitTrainShinkansen"));
    }
  }

  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKFelicaAppletHistory;
  -[PKTransitAppletHistory dealloc](&v2, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKFelicaAppletHistory;
  v4 = a3;
  -[PKTransitAppletHistory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_existingKeys, CFSTR("existingKeys"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_SPID, CFSTR("SPID"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PKFelicaAppletHistory isInShinkansenStation](self, "isInShinkansenStation"), CFSTR("inShinkansenStation"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shinkansenTicketActive, CFSTR("shinkansenTicketActive"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_greenCarTicketUsed, CFSTR("ticketUsed"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shinkansenTicket, CFSTR("shinkansenTicket"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_greenCarTicket, CFSTR("greenCarTicket"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_balanceAllowedForCommute, CFSTR("balanceAllowedForCommute"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_lowBalanceNotificationEnabled, CFSTR("lowBalanceNotificationEnabled"));

}

- (void)sanitizeValuesWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKFelicaGreenCarTicket *greenCarTicket;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend(v4, "felicaState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[PKTransitAppletHistory source](self, "source") != 1)
    {
      if (!-[NSSet containsObject:](self->_existingKeys, "containsObject:", CFSTR("NFBlacklisted")))
        -[PKTransitAppletHistory setBlacklisted:](self, "setBlacklisted:", objc_msgSend(v4, "isBlacklisted"));
      if (!-[NSSet containsObject:](self->_existingKeys, "containsObject:", CFSTR("NFInStation"))
        && objc_msgSend(v5, "isInStation")
        && !-[PKFelicaAppletHistory isInStation](self, "isInStation"))
      {
        -[PKFelicaAppletHistory _addEnrouteTransitType:](self, "_addEnrouteTransitType:", CFSTR("Transit"));
      }
      if (!-[NSSet containsObject:](self->_existingKeys, "containsObject:", CFSTR("NFInStationShinkansen"))
        && objc_msgSend(v5, "isInShinkansenStation")
        && !-[PKFelicaAppletHistory isInShinkansenStation](self, "isInShinkansenStation"))
      {
        -[PKFelicaAppletHistory _addEnrouteTransitType:](self, "_addEnrouteTransitType:", CFSTR("TransitTrainShinkansen"));
      }
      if (!-[NSSet containsObject:](self->_existingKeys, "containsObject:", CFSTR("NFTicketSelected")))
        self->_shinkansenTicketActive = objc_msgSend(v5, "isShinkansenTicketActive");
      if (!-[NSSet containsObject:](self->_existingKeys, "containsObject:", CFSTR("NFTicketUsed")))
        self->_greenCarTicketUsed = objc_msgSend(v5, "isGreenCarTicketUsed");
      if (!-[NSSet containsObject:](self->_existingKeys, "containsObject:", CFSTR("NFBalance")))
      {
        objc_msgSend(v5, "balance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTransitAppletHistory setBalance:](self, "setBalance:", v6);

      }
      if (!-[NSSet containsObject:](self->_existingKeys, "containsObject:", CFSTR("NFAllowBalanceUsageForCommute")))
        self->_balanceAllowedForCommute = objc_msgSend(v5, "isBalanceAllowedForCommute");
      if (!-[NSSet containsObject:](self->_existingKeys, "containsObject:", CFSTR("NFNotifyOnLowBalance")))
        self->_lowBalanceNotificationEnabled = objc_msgSend(v5, "isLowBalanceNotificationEnabled");
    }
    if (!self->_greenCarTicketUsed && -[PKFelicaGreenCarTicket isRefunded](self->_greenCarTicket, "isRefunded"))
    {
      greenCarTicket = self->_greenCarTicket;
      self->_greenCarTicket = 0;

    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0xCuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Unexpected: cannot sanitize a non-felica state object against felica history", v9, 2u);
    }

  }
}

- (BOOL)isInShinkansenStation
{
  void *v2;
  char v3;

  -[PKTransitAppletHistory enrouteTransitTypes](self, "enrouteTransitTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("TransitTrainShinkansen"));

  return v3;
}

- (BOOL)isInStation
{
  void *v2;
  char v3;

  -[PKTransitAppletHistory enrouteTransitTypes](self, "enrouteTransitTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("Transit"));

  return v3;
}

- (void)_addEnrouteTransitType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  -[PKTransitAppletHistory enrouteTransitTypes](self, "enrouteTransitTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = v8;

  objc_msgSend(v9, "addObject:", v4);
  -[PKTransitAppletHistory setEnrouteTransitTypes:](self, "setEnrouteTransitTypes:", v9);

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (NSNumber)SPID
{
  return self->_SPID;
}

- (int64_t)transactionType
{
  return self->_transactionType;
}

- (BOOL)isShinkansenTicketActive
{
  return self->_shinkansenTicketActive;
}

- (BOOL)isGreenCarTicketUsed
{
  return self->_greenCarTicketUsed;
}

- (BOOL)isBalanceAllowedForCommute
{
  return self->_balanceAllowedForCommute;
}

- (BOOL)isLowBalanceNotificationEnabled
{
  return self->_lowBalanceNotificationEnabled;
}

- (PKFelicaShinkansenTicket)shinkansenTicket
{
  return self->_shinkansenTicket;
}

- (PKFelicaGreenCarTicket)greenCarTicket
{
  return self->_greenCarTicket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greenCarTicket, 0);
  objc_storeStrong((id *)&self->_shinkansenTicket, 0);
  objc_storeStrong((id *)&self->_SPID, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_existingKeys, 0);
}

@end
