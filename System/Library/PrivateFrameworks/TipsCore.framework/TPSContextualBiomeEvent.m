@implementation TPSContextualBiomeEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)streamFromDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeStringForKey:", CFSTR("stream"));
}

+ (id)observationDateFromEvent:(id)a3
{
  void *v3;

  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a3, "timestamp");
  return (id)objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
}

- (TPSContextualBiomeEvent)initWithDictionary:(id)a3
{
  id v4;
  TPSContextualBiomeEvent *v5;
  uint64_t v6;
  NSString *stream;
  uint64_t v8;
  NSDictionary *filterInfo;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSContextualBiomeEvent;
  v5 = -[TPSContextualEvent initWithDictionary:](&v11, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("stream"));
    v6 = objc_claimAutoreleasedReturnValue();
    stream = v5->_stream;
    v5->_stream = (NSString *)v6;

    objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("filter"));
    v8 = objc_claimAutoreleasedReturnValue();
    filterInfo = v5->_filterInfo;
    v5->_filterInfo = (NSDictionary *)v8;

  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return 0;
}

- (id)filterHandler
{
  return 0;
}

- (id)filterParametersForBiomeQuery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (self->_filterInfo)
  {
    v3 = (void *)objc_opt_new();
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "TPSSafeObjectForKey:", CFSTR("isStarting"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "TPSSafeBoolForKey:", CFSTR("isStarting")));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("starting"));

    }
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "TPSSafeObjectForKey:", CFSTR("bundleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "TPSSafeStringForKey:", CFSTR("bundleID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("bundleID"));

    }
    v13 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (TPSContextualBiomeEvent)initWithCoder:(id)a3
{
  id v4;
  TPSContextualBiomeEvent *v5;
  uint64_t v6;
  NSString *stream;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *filterInfo;
  objc_super v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSContextualBiomeEvent;
  v5 = -[TPSContextualEvent initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stream"));
    v6 = objc_claimAutoreleasedReturnValue();
    stream = v5->_stream;
    v5->_stream = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("filter"));
    v11 = objc_claimAutoreleasedReturnValue();
    filterInfo = v5->_filterInfo;
    v5->_filterInfo = (NSDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSContextualBiomeEvent;
  v4 = a3;
  -[TPSContextualEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_stream, CFSTR("stream"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_filterInfo, CFSTR("filter"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSContextualBiomeEvent;
  v4 = -[TPSContextualEvent copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setStream:", self->_stream);
  objc_msgSend(v4, "setFilterInfo:", self->_filterInfo);
  return v4;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  NSString *stream;
  NSDictionary *filterInfo;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v10.receiver = self;
  v10.super_class = (Class)TPSContextualBiomeEvent;
  -[TPSContextualEvent debugDescription](&v10, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  stream = self->_stream;
  if (stream)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("stream"), stream);
  filterInfo = self->_filterInfo;
  if (filterInfo)
  {
    -[NSDictionary debugDescription](filterInfo, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("filter"), v8);

  }
  return v5;
}

- (NSString)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDictionary)filterInfo
{
  return self->_filterInfo;
}

- (void)setFilterInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterInfo, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
