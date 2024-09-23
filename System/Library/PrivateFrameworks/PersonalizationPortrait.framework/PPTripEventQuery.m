@implementation PPTripEventQuery

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPTripEventQuery;
  v4 = a3;
  -[PPEventQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_tripOptions, CFSTR("triop"), v5.receiver, v5.super_class);

}

- (PPTripEventQuery)initWithCoder:(id)a3
{
  id v4;
  PPTripEventQuery *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PPTripEventQuery;
  v5 = -[PPEventQuery initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_tripOptions = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("triop"));

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPEventQuery fromDate](self, "fromDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPEventQuery toDate](self, "toDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPTripEventQuery f:%@ t:%@ o:%d>"), v4, v5, self->_tripOptions);

  return v6;
}

- (unsigned)tripOptions
{
  return self->_tripOptions;
}

- (void)setTripOptions:(unsigned __int8)a3
{
  self->_tripOptions = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
