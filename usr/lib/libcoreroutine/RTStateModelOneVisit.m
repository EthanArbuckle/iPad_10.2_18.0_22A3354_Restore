@implementation RTStateModelOneVisit

- (RTStateModelOneVisit)init
{
  RTStateModelOneVisit *v2;
  RTStateModelLocation *v3;
  RTStateModelEntryExit *v4;
  uint64_t v5;
  NSUUID *identifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RTStateModelOneVisit;
  v2 = -[RTStateModelOneVisit init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(RTStateModelLocation);
    -[RTStateModelOneVisit setLocation:](v2, "setLocation:", v3);

    v4 = objc_alloc_init(RTStateModelEntryExit);
    -[RTStateModelOneVisit setEntryExit_s:](v2, "setEntryExit_s:", v4);

    -[RTStateModelOneVisit setNumOfDataPts:](v2, "setNumOfDataPts:", 0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v5;

  }
  return v2;
}

- (RTStateModelOneVisit)initWithLocation:(id)a3 entryExit:(id)a4 andNumOfDataPts:(int64_t)a5
{
  id v8;
  id v9;
  RTStateModelOneVisit *v10;
  RTStateModelOneVisit *v11;
  uint64_t v12;
  NSUUID *identifier;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RTStateModelOneVisit;
  v10 = -[RTStateModelOneVisit init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    -[RTStateModelOneVisit setLocation:](v10, "setLocation:", v8);
    -[RTStateModelOneVisit setEntryExit_s:](v11, "setEntryExit_s:", v9);
    -[RTStateModelOneVisit setNumOfDataPts:](v11, "setNumOfDataPts:", a5);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;

  }
  return v11;
}

- (RTStateModelOneVisit)initWithLatitude:(double)a3 longitude:(double)a4 uncertainty:(double)a5 entryTimestamp:(double)a6 exitTimestamp:(double)a7 numOfDataPts:(int64_t)a8
{
  RTStateModelOneVisit *v14;
  RTStateModelLocation *v15;
  void *v16;
  double v17;
  uint64_t v18;
  RTStateModelLocation *location;
  RTStateModelEntryExit *v20;
  RTStateModelEntryExit *EntryExit_s;
  uint64_t v22;
  NSUUID *identifier;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)RTStateModelOneVisit;
  v14 = -[RTStateModelOneVisit init](&v25, sel_init);
  if (v14)
  {
    v15 = [RTStateModelLocation alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v18 = -[RTStateModelLocation initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:](v15, "initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:", a3, a4, a5, -1.0, v17);
    location = v14->_location;
    v14->_location = (RTStateModelLocation *)v18;

    v20 = -[RTStateModelEntryExit initWithEntry:exit:]([RTStateModelEntryExit alloc], "initWithEntry:exit:", a6, a7);
    EntryExit_s = v14->_EntryExit_s;
    v14->_EntryExit_s = v20;

    v14->_numOfDataPts = a8;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v22 = objc_claimAutoreleasedReturnValue();
    identifier = v14->_identifier;
    v14->_identifier = (NSUUID *)v22;

  }
  return v14;
}

- (BOOL)isComplete
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  BOOL v7;

  -[RTStateModelOneVisit EntryExit_s](self, "EntryExit_s");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entry_s");
  if (v4 <= -1.0)
  {
    v7 = 0;
  }
  else
  {
    -[RTStateModelOneVisit EntryExit_s](self, "EntryExit_s");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exit_s");
    v7 = v6 > -1.0;

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[RTStateModelOneVisit location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("location"));

  -[RTStateModelOneVisit EntryExit_s](self, "EntryExit_s");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("EntryExit_s"));

}

- (RTStateModelOneVisit)initWithCoder:(id)a3
{
  id v4;
  RTStateModelOneVisit *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTStateModelOneVisit;
  v5 = -[RTStateModelOneVisit init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTStateModelOneVisit setLocation:](v5, "setLocation:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EntryExit_s"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTStateModelOneVisit setEntryExit_s:](v5, "setEntryExit_s:", v7);

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTStateModelOneVisit location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStateModelOneVisit EntryExit_s](self, "EntryExit_s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@, numDataPts, %ld"), v4, v5, -[RTStateModelOneVisit numOfDataPts](self, "numOfDataPts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (RTStateModelLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (RTStateModelEntryExit)EntryExit_s
{
  return self->_EntryExit_s;
}

- (void)setEntryExit_s:(id)a3
{
  objc_storeStrong((id *)&self->_EntryExit_s, a3);
}

- (int64_t)numOfDataPts
{
  return self->_numOfDataPts;
}

- (void)setNumOfDataPts:(int64_t)a3
{
  self->_numOfDataPts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_EntryExit_s, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
