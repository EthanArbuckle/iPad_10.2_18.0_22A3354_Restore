@implementation PKFelicaAppletHistoryRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFelicaAppletHistoryRecord)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKFelicaAppletHistoryRecord;
  return -[PKTransitAppletHistoryRecord initWithDictionary:](&v3, sel_initWithDictionary_, 0);
}

- (PKFelicaAppletHistoryRecord)initWithDictionary:(id)a3
{
  id v4;
  PKFelicaAppletHistoryRecord *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *transactionID;
  void *v10;
  uint64_t v11;
  NSNumber *transactionType;
  void *v13;
  uint64_t v14;
  NSNumber *sectorCombination;
  void *v16;
  uint64_t v17;
  NSNumber *amountType;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKFelicaAppletHistoryRecord;
  v5 = -[PKTransitAppletHistoryRecord initWithDictionary:](&v36, sel_initWithDictionary_, 0);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFHistorySequenceNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransitAppletHistoryRecord setHistorySequenceNumber:](v5, "setHistorySequenceNumber:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFTransactionID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    transactionID = v5->_transactionID;
    v5->_transactionID = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFTransactionType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    transactionType = v5->_transactionType;
    v5->_transactionType = (NSNumber *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFSectorCombination"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    sectorCombination = v5->_sectorCombination;
    v5->_sectorCombination = (NSNumber *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFAmountType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    amountType = v5->_amountType;
    v5->_amountType = (NSNumber *)v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFAmount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFBalance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSNumber integerValue](v5->_amountType, "integerValue") == 2)
    {
      v21 = (void *)MEMORY[0x1E0CB3598];
      if (v19)
      {
        objc_msgSend(v19, "decimalValue");
      }
      else
      {
        v33 = 0;
        v34 = 0;
        LODWORD(v35) = 0;
      }
      objc_msgSend(v21, "decimalNumberWithDecimal:", &v33);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTransitAppletHistoryRecord setAmount:](v5, "setAmount:", v24);

      v25 = (void *)MEMORY[0x1E0CB3598];
      if (v20)
      {
        objc_msgSend(v20, "decimalValue");
      }
      else
      {
        v30 = 0;
        v31 = 0;
        LODWORD(v32) = 0;
      }
      objc_msgSend(v25, "decimalNumberWithDecimal:", &v30);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PKDecimalAmountFromAmount(v19, CFSTR("JPY"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTransitAppletHistoryRecord setAmount:](v5, "setAmount:", v22);

      PKDecimalAmountFromAmount(v20, CFSTR("JPY"));
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v26 = (void *)v23;
    -[PKTransitAppletHistoryRecord setBalance:](v5, "setBalance:", v23, v30, v31, v32, v33, v34, v35);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFStartStationData"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransitAppletHistoryRecord setStartStation:](v5, "setStartStation:", v27);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFEndStationData"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransitAppletHistoryRecord setEndStation:](v5, "setEndStation:", v28);

  }
  return v5;
}

- (PKFelicaAppletHistoryRecord)initWithCoder:(id)a3
{
  id v4;
  PKFelicaAppletHistoryRecord *v5;
  uint64_t v6;
  NSString *transactionID;
  uint64_t v8;
  NSNumber *transactionType;
  uint64_t v10;
  NSNumber *sectorCombination;
  uint64_t v12;
  NSNumber *amountType;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKFelicaAppletHistoryRecord;
  v5 = -[PKTransitAppletHistoryRecord initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionID"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionID = v5->_transactionID;
    v5->_transactionID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("felicaTransactionType"));
    v8 = objc_claimAutoreleasedReturnValue();
    transactionType = v5->_transactionType;
    v5->_transactionType = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectorCombination"));
    v10 = objc_claimAutoreleasedReturnValue();
    sectorCombination = v5->_sectorCombination;
    v5->_sectorCombination = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amountType"));
    v12 = objc_claimAutoreleasedReturnValue();
    amountType = v5->_amountType;
    v5->_amountType = (NSNumber *)v12;

  }
  return v5;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKFelicaAppletHistoryRecord;
  v5 = -[PKTransitAppletHistoryRecord copyWithZone:](&v15, sel_copyWithZone_);
  v6 = -[NSString copyWithZone:](self->_transactionID, "copyWithZone:", a3);
  v7 = (void *)v5[21];
  v5[21] = v6;

  v8 = -[NSNumber copyWithZone:](self->_transactionType, "copyWithZone:", a3);
  v9 = (void *)v5[18];
  v5[18] = v8;

  v10 = -[NSNumber copyWithZone:](self->_sectorCombination, "copyWithZone:", a3);
  v11 = (void *)v5[19];
  v5[19] = v10;

  v12 = -[NSNumber copyWithZone:](self->_amountType, "copyWithZone:", a3);
  v13 = (void *)v5[20];
  v5[20] = v12;

  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKFelicaAppletHistoryRecord;
  -[PKTransitAppletHistoryRecord dealloc](&v2, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKFelicaAppletHistoryRecord;
  v4 = a3;
  -[PKTransitAppletHistoryRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionID, CFSTR("transactionID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionType, CFSTR("felicaTransactionType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sectorCombination, CFSTR("sectorCombination"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_amountType, CFSTR("amountType"));

}

- (NSNumber)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)sectorCombination
{
  return self->_sectorCombination;
}

- (void)setSectorCombination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)amountType
{
  return self->_amountType;
}

- (void)setAmountType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_amountType, 0);
  objc_storeStrong((id *)&self->_sectorCombination, 0);
  objc_storeStrong((id *)&self->_transactionType, 0);
}

@end
