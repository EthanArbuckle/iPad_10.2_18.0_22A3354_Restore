@implementation SPIndexInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPIndexInformation)initWithBeaconIdentifier:(id)a3 sequence:(unsigned __int8)a4 index:(unint64_t)a5
{
  id v9;
  SPIndexInformation *v10;
  SPIndexInformation *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SPIndexInformation;
  v10 = -[SPIndexInformation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_beaconIdentifier, a3);
    v11->_sequence = a4;
    v11->_index = a5;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SPIndexInformation initWithBeaconIdentifier:sequence:index:]([SPIndexInformation alloc], "initWithBeaconIdentifier:sequence:index:", self->_beaconIdentifier, self->_sequence, self->_index);
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *beaconIdentifier;
  id v5;

  beaconIdentifier = self->_beaconIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", beaconIdentifier, CFSTR("beaconIdentifer"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sequence, CFSTR("sequence"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_index, CFSTR("index"));

}

- (SPIndexInformation)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *beaconIdentifier;
  unint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beaconIdentifer"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v5;

  self->_sequence = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sequence"));
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("index"));

  self->_index = v7;
  return self;
}

- (id)description
{
  int v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[SPIndexInformation sequence](self, "sequence");
  v4 = CFSTR("secondary");
  if (v3 != 2)
    v4 = 0;
  if (v3 == 1)
    v5 = CFSTR("primary");
  else
    v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[SPIndexInformation beaconIdentifier](self, "beaconIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:%@/%llu"), v7, v5, -[SPIndexInformation index](self, "index"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDateInterval)dateInterval
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithStartDate:duration:", v3, 0.0);

  return (NSDateInterval *)v4;
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unsigned __int8)a3
{
  self->_sequence = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
}

@end
