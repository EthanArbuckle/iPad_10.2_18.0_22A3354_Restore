@implementation PKFelicaShinkansenTrain

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFelicaShinkansenTrain)init
{

  return 0;
}

- (PKFelicaShinkansenTrain)initWithDictionary:(id)a3
{
  id v4;
  PKFelicaShinkansenTrain *v5;
  void *v6;
  uint64_t v7;
  NSString *trainName;
  PKFelicaShinkansenTrain *v9;
  void *v10;
  uint64_t v11;
  NSData *originStation;
  void *v13;
  uint64_t v14;
  NSData *destinationStation;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSNumber *departureTime;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSNumber *arrivalTime;
  void *v33;
  uint64_t v34;
  NSNumber *carNumber;
  void *v36;
  uint64_t v37;
  NSNumber *seatRow;
  void *v39;
  uint64_t v40;
  NSNumber *seatNumber;
  void *v43;
  objc_super v44;

  v4 = a3;
  if (v4)
  {
    v44.receiver = self;
    v44.super_class = (Class)PKFelicaShinkansenTrain;
    v5 = -[PKFelicaShinkansenTrain init](&v44, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFTrainName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 8);
        trainName = v5->_trainName;
        v5->_trainName = (NSString *)v7;
      }
      else
      {
        trainName = v5->_trainName;
        v5->_trainName = 0;
      }

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFStartStationData"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      originStation = v5->_originStation;
      v5->_originStation = (NSData *)v11;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFEndStationData"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      destinationStation = v5->_destinationStation;
      v5->_destinationStation = (NSData *)v14;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFDepartureHour"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFDepartureMinute"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFArrivalHour"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFArrivalMinute"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v16 || v17 || v18 || v19)
      {
        v43 = v6;
        v21 = (void *)MEMORY[0x1E0CB37E8];
        v22 = v17;
        v23 = objc_msgSend(v16, "integerValue");
        v24 = objc_msgSend(v22, "integerValue");

        objc_msgSend(v21, "numberWithInteger:", v24 + 60 * v23);
        v25 = objc_claimAutoreleasedReturnValue();
        departureTime = v5->_departureTime;
        v5->_departureTime = (NSNumber *)v25;

        v27 = (void *)MEMORY[0x1E0CB37E8];
        v28 = v20;
        v29 = objc_msgSend(v18, "integerValue");
        v30 = objc_msgSend(v28, "integerValue");

        v6 = v43;
        objc_msgSend(v27, "numberWithInteger:", v30 + 60 * v29);
        v31 = objc_claimAutoreleasedReturnValue();
        arrivalTime = v5->_arrivalTime;
        v5->_arrivalTime = (NSNumber *)v31;

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFCarNumber"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "copy");
      carNumber = v5->_carNumber;
      v5->_carNumber = (NSNumber *)v34;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFSeatNumber"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "copy");
      seatRow = v5->_seatRow;
      v5->_seatRow = (NSNumber *)v37;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFSeatType"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "copy");
      seatNumber = v5->_seatNumber;
      v5->_seatNumber = (NSNumber *)v40;

    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PKFelicaShinkansenTrain)initWithCoder:(id)a3
{
  id v4;
  PKFelicaShinkansenTrain *v5;
  uint64_t v6;
  NSData *originStation;
  uint64_t v8;
  NSData *destinationStation;
  uint64_t v10;
  NSNumber *departureTime;
  uint64_t v12;
  NSNumber *arrivalTime;
  uint64_t v14;
  NSString *trainName;
  uint64_t v16;
  NSNumber *carNumber;
  uint64_t v18;
  NSNumber *seatRow;
  uint64_t v20;
  NSNumber *seatNumber;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKFelicaShinkansenTrain;
  v5 = -[PKFelicaShinkansenTrain init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originStationCode"));
    v6 = objc_claimAutoreleasedReturnValue();
    originStation = v5->_originStation;
    v5->_originStation = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationStationCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    destinationStation = v5->_destinationStation;
    v5->_destinationStation = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("departureTime"));
    v10 = objc_claimAutoreleasedReturnValue();
    departureTime = v5->_departureTime;
    v5->_departureTime = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("arrivalTime"));
    v12 = objc_claimAutoreleasedReturnValue();
    arrivalTime = v5->_arrivalTime;
    v5->_arrivalTime = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trainName"));
    v14 = objc_claimAutoreleasedReturnValue();
    trainName = v5->_trainName;
    v5->_trainName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carNumber"));
    v16 = objc_claimAutoreleasedReturnValue();
    carNumber = v5->_carNumber;
    v5->_carNumber = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seatRow"));
    v18 = objc_claimAutoreleasedReturnValue();
    seatRow = v5->_seatRow;
    v5->_seatRow = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seatNumber"));
    v20 = objc_claimAutoreleasedReturnValue();
    seatNumber = v5->_seatNumber;
    v5->_seatNumber = (NSNumber *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *originStation;
  id v5;

  originStation = self->_originStation;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originStation, CFSTR("originStationCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationStation, CFSTR("destinationStationCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_departureTime, CFSTR("departureTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arrivalTime, CFSTR("arrivalTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trainName, CFSTR("trainName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_carNumber, CFSTR("carNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_seatRow, CFSTR("seatRow"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_seatNumber, CFSTR("seatNumber"));

}

- (NSData)originStation
{
  return self->_originStation;
}

- (NSData)destinationStation
{
  return self->_destinationStation;
}

- (NSNumber)departureTime
{
  return self->_departureTime;
}

- (NSNumber)arrivalTime
{
  return self->_arrivalTime;
}

- (NSString)trainName
{
  return self->_trainName;
}

- (NSNumber)carNumber
{
  return self->_carNumber;
}

- (NSNumber)seatRow
{
  return self->_seatRow;
}

- (NSNumber)seatNumber
{
  return self->_seatNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seatNumber, 0);
  objc_storeStrong((id *)&self->_seatRow, 0);
  objc_storeStrong((id *)&self->_carNumber, 0);
  objc_storeStrong((id *)&self->_trainName, 0);
  objc_storeStrong((id *)&self->_arrivalTime, 0);
  objc_storeStrong((id *)&self->_departureTime, 0);
  objc_storeStrong((id *)&self->_destinationStation, 0);
  objc_storeStrong((id *)&self->_originStation, 0);
}

@end
