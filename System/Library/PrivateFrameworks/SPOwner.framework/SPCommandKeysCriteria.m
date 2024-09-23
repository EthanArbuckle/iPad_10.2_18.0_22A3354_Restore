@implementation SPCommandKeysCriteria

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_opt_new();
  -[SPCommandKeysCriteria dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateInterval:", v5);

  -[SPCommandKeysCriteria sequence](self, "sequence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSequence:", v6);

  -[SPCommandKeysCriteria indices](self, "indices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setIndices:", v8);

  -[SPCommandKeysCriteria index](self, "index");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIndex:", v9);

  -[SPCommandKeysCriteria hint](self, "hint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHint:", v10);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *dateInterval;
  id v5;

  dateInterval = self->_dateInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sequence, CFSTR("sequence"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_indices, CFSTR("indices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_index, CFSTR("index"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hint, CFSTR("hint"));

}

- (SPCommandKeysCriteria)initWithCoder:(id)a3
{
  id v4;
  NSDateInterval *v5;
  NSDateInterval *dateInterval;
  NSNumber *v7;
  NSNumber *sequence;
  NSNumber *v9;
  NSNumber *index;
  NSNumber *v11;
  NSNumber *hint;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *indices;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
  dateInterval = self->_dateInterval;
  self->_dateInterval = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sequence"));
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  sequence = self->_sequence;
  self->_sequence = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("index"));
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  index = self->_index;
  self->_index = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hint"));
  v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  hint = self->_hint;
  self->_hint = v11;

  v13 = (void *)MEMORY[0x1E0C99E60];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("indices"));
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();

  indices = self->_indices;
  self->_indices = v16;

  return self;
}

- (SPCommandKeysCriteria)initWithDateInterval:(id)a3 sequence:(id)a4 indices:(id)a5 index:(id)a6 hint:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SPCommandKeysCriteria *v17;
  SPCommandKeysCriteria *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SPCommandKeysCriteria;
  v17 = -[SPCommandKeysCriteria init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[SPCommandKeysCriteria setDateInterval:](v17, "setDateInterval:", v12);
    -[SPCommandKeysCriteria setSequence:](v18, "setSequence:", v13);
    -[SPCommandKeysCriteria setIndices:](v18, "setIndices:", v14);
    -[SPCommandKeysCriteria setIndex:](v18, "setIndex:", v15);
    -[SPCommandKeysCriteria setHint:](v18, "setHint:", v16);
  }

  return v18;
}

+ (id)matchSequence:(unsigned __int8)a3 index:(unsigned int)a4 hint:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SPCommandKeysCriteria *v8;
  void *v9;
  void *v10;
  void *v11;
  SPCommandKeysCriteria *v12;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = [SPCommandKeysCriteria alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SPCommandKeysCriteria initWithDateInterval:sequence:indices:index:hint:](v8, "initWithDateInterval:sequence:indices:index:hint:", 0, v9, 0, v10, v11);

  return v12;
}

+ (id)matchDateInterval:(id)a3
{
  id v3;
  SPCommandKeysCriteria *v4;

  v3 = a3;
  v4 = -[SPCommandKeysCriteria initWithDateInterval:sequence:indices:index:hint:]([SPCommandKeysCriteria alloc], "initWithDateInterval:sequence:indices:index:hint:", v3, 0, 0, 0, 0);

  return v4;
}

+ (id)matchPrimaryIndices:(id)a3
{
  id v3;
  SPCommandKeysCriteria *v4;

  v3 = a3;
  v4 = -[SPCommandKeysCriteria initWithDateInterval:sequence:indices:index:hint:]([SPCommandKeysCriteria alloc], "initWithDateInterval:sequence:indices:index:hint:", 0, &unk_1E5E35E78, v3, 0, 0);

  return v4;
}

+ (id)matchSecondaryIndex:(unint64_t)a3 hint:(unsigned __int8)a4
{
  uint64_t v4;
  SPCommandKeysCriteria *v6;
  void *v7;
  void *v8;
  SPCommandKeysCriteria *v9;

  v4 = a4;
  v6 = [SPCommandKeysCriteria alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SPCommandKeysCriteria initWithDateInterval:sequence:indices:index:hint:](v6, "initWithDateInterval:sequence:indices:index:hint:", 0, &unk_1E5E35E90, 0, v7, v8);

  return v9;
}

+ (id)driftModeledCriteria
{
  return -[SPCommandKeysCriteria initWithDateInterval:sequence:indices:index:hint:]([SPCommandKeysCriteria alloc], "initWithDateInterval:sequence:indices:index:hint:", 0, 0, 0, 0, 0);
}

- (NSNumber)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)indices
{
  return self->_indices;
}

- (void)setIndices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)hint
{
  return self->_hint;
}

- (void)setHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_indices, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end
