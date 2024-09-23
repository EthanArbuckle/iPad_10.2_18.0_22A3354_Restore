@implementation PKFelicaGreenCarTicket

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFelicaGreenCarTicket)init
{

  return 0;
}

- (PKFelicaGreenCarTicket)initWithDictionary:(id)a3
{
  id v4;
  PKFelicaGreenCarTicket *v5;
  void *v6;
  uint64_t v7;
  NSData *originStation;
  void *v9;
  uint64_t v10;
  NSData *destinationStation;
  void *v12;
  void *v13;
  uint64_t v14;
  NSNumber *validityStartDate;
  void *v16;
  PKFelicaGreenCarTicket *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  if (v4)
  {
    v20.receiver = self;
    v20.super_class = (Class)PKFelicaGreenCarTicket;
    v5 = -[PKFelicaGreenCarTicket init](&v20, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFStartStationData"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      originStation = v5->_originStation;
      v5->_originStation = (NSData *)v7;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFEndStationData"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      destinationStation = v5->_destinationStation;
      v5->_destinationStation = (NSData *)v10;

      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFPurchaseDate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberWithInteger:", IntegerFromFelicaDateFormat(v13));
      v14 = objc_claimAutoreleasedReturnValue();
      validityStartDate = v5->_validityStartDate;
      v5->_validityStartDate = (NSNumber *)v14;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFRefundMonth"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "unsignedIntegerValue"))
      {
        v5->_refunded = 1;
      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFRefundDay"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_refunded = objc_msgSend(v18, "unsignedIntegerValue") != 0;

      }
    }
    self = v5;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (PKFelicaGreenCarTicket)initWithCoder:(id)a3
{
  id v4;
  PKFelicaGreenCarTicket *v5;
  uint64_t v6;
  NSData *originStation;
  uint64_t v8;
  NSData *destinationStation;
  uint64_t v10;
  NSNumber *validityStartDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKFelicaGreenCarTicket;
  v5 = -[PKFelicaGreenCarTicket init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originStation"));
    v6 = objc_claimAutoreleasedReturnValue();
    originStation = v5->_originStation;
    v5->_originStation = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationStation"));
    v8 = objc_claimAutoreleasedReturnValue();
    destinationStation = v5->_destinationStation;
    v5->_destinationStation = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("validityStartDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    validityStartDate = v5->_validityStartDate;
    v5->_validityStartDate = (NSNumber *)v10;

    v5->_refunded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("refunded"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *originStation;
  id v5;

  originStation = self->_originStation;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originStation, CFSTR("originStation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationStation, CFSTR("destinationStation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validityStartDate, CFSTR("validityStartDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_refunded, CFSTR("refunded"));

}

- (NSData)originStation
{
  return self->_originStation;
}

- (NSData)destinationStation
{
  return self->_destinationStation;
}

- (NSNumber)validityStartDate
{
  return self->_validityStartDate;
}

- (BOOL)isRefunded
{
  return self->_refunded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validityStartDate, 0);
  objc_storeStrong((id *)&self->_destinationStation, 0);
  objc_storeStrong((id *)&self->_originStation, 0);
}

@end
