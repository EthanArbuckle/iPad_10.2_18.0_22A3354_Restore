@implementation WiFiAwareDataSessionStatisticsHistogramBin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiAwareDataSessionStatisticsHistogramBin)initWithBinStart:(double)a3 binEnd:(double)a4 value:(double)a5
{
  WiFiAwareDataSessionStatisticsHistogramBin *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WiFiAwareDataSessionStatisticsHistogramBin;
  result = -[WiFiAwareDataSessionStatisticsHistogramBin init](&v9, sel_init);
  if (result)
  {
    result->_binStart = a3;
    result->_binEnd = a4;
    result->_value = a5;
  }
  return result;
}

- (WiFiAwareDataSessionStatisticsHistogramBin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsHistogramBin.binStart"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsHistogramBin.binEnd"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsHistogramBin.value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  return -[WiFiAwareDataSessionStatisticsHistogramBin initWithBinStart:binEnd:value:](self, "initWithBinStart:binEnd:value:", v7, v10, v13);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  -[WiFiAwareDataSessionStatisticsHistogramBin binStart](self, "binStart");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("WiFiAwareDataSessionStatisticsHistogramBin.binStart"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[WiFiAwareDataSessionStatisticsHistogramBin binEnd](self, "binEnd");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("WiFiAwareDataSessionStatisticsHistogramBin.binEnd"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[WiFiAwareDataSessionStatisticsHistogramBin value](self, "value");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("WiFiAwareDataSessionStatisticsHistogramBin.value"));

}

- (BOOL)isEqual:(id)a3
{
  WiFiAwareDataSessionStatisticsHistogramBin *v4;
  WiFiAwareDataSessionStatisticsHistogramBin *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;

  v4 = (WiFiAwareDataSessionStatisticsHistogramBin *)a3;
  if (self == v4)
  {
    v5 = 0;
LABEL_8:
    v15 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = 0;
    v5 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  -[WiFiAwareDataSessionStatisticsHistogramBin binStart](self, "binStart");
  v7 = v6;
  -[WiFiAwareDataSessionStatisticsHistogramBin binStart](v5, "binStart");
  if (vabdd_f64(v7, v8) < 2.22044605e-16)
  {
    -[WiFiAwareDataSessionStatisticsHistogramBin binEnd](self, "binEnd");
    v10 = v9;
    -[WiFiAwareDataSessionStatisticsHistogramBin binEnd](v5, "binEnd");
    if (vabdd_f64(v10, v11) < 2.22044605e-16)
    {
      -[WiFiAwareDataSessionStatisticsHistogramBin value](self, "value");
      v13 = v12;
      -[WiFiAwareDataSessionStatisticsHistogramBin value](v5, "value");
      if (vabdd_f64(v13, v14) < 2.22044605e-16)
        goto LABEL_8;
    }
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (id)description
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiAwareDataSessionStatisticsHistogramBin binStart](self, "binStart");
  v5 = (uint64_t)v4;
  -[WiFiAwareDataSessionStatisticsHistogramBin binEnd](self, "binEnd");
  v7 = (uint64_t)v6;
  -[WiFiAwareDataSessionStatisticsHistogramBin value](self, "value");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("[<%lld...%lld> = %lld]"), v5, v7, (uint64_t)v8);
}

- (double)binStart
{
  return self->_binStart;
}

- (double)binEnd
{
  return self->_binEnd;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

@end
