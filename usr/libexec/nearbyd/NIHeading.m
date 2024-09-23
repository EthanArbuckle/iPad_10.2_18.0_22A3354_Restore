@implementation NIHeading

- (NIHeading)initWithTimestamp:(id)a3 trueHeading:(double)a4 magneticHeading:(double)a5 headingAccuracy:(double)a6
{
  id v10;
  NIHeading *v11;
  NSDate *v12;
  NSDate *timestamp;
  objc_super v15;

  v10 = a3;
  if (!v10)
    __assert_rtn("-[NIHeading initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:]", "NILocation.mm", 235, "timestamp");
  v15.receiver = self;
  v15.super_class = (Class)NIHeading;
  v11 = -[NIHeading init](&v15, "init");
  if (v11)
  {
    v12 = (NSDate *)objc_msgSend(v10, "copy");
    timestamp = v11->_timestamp;
    v11->_timestamp = v12;

    v11->_trueHeading = a4;
    v11->_magneticHeading = a5;
    v11->_headingAccuracy = a6;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NIHeading initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:](+[NIHeading allocWithZone:](NIHeading, "allocWithZone:", a3), "initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:", self->_timestamp, self->_trueHeading, self->_magneticHeading, self->_headingAccuracy);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("trueHeading"), self->_trueHeading);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("magneticHeading"), self->_magneticHeading);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("headingAccuracy"), self->_headingAccuracy);

}

- (NIHeading)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NIHeading *v15;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v5), CFSTR("timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8 && (v9 = objc_opt_class(NSDate, v7), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("trueHeading"));
    v11 = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("magneticHeading"));
    v13 = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("headingAccuracy"));
    v15 = -[NIHeading initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:]([NIHeading alloc], "initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:", v8, v11, v13, v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NIHeading *v7;
  NIHeading *v8;
  NSDate *timestamp;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  double trueHeading;
  double v14;
  double v15;
  double magneticHeading;
  double v17;
  double v18;
  double headingAccuracy;
  double v20;
  unsigned __int8 v21;
  BOOL v22;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIHeading *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v22 = 1;
LABEL_17:

      goto LABEL_18;
    }
    timestamp = self->_timestamp;
    if (!timestamp)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIHeading timestamp](v7, "timestamp"));

      if (!v10)
      {
        v12 = 1;
        goto LABEL_7;
      }
      timestamp = self->_timestamp;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIHeading timestamp](v8, "timestamp"));
    v12 = -[NSDate isEqual:](timestamp, "isEqual:", v11);

LABEL_7:
    trueHeading = self->_trueHeading;
    -[NIHeading trueHeading](v8, "trueHeading");
    v15 = v14;
    magneticHeading = self->_magneticHeading;
    -[NIHeading magneticHeading](v8, "magneticHeading");
    v18 = v17;
    headingAccuracy = self->_headingAccuracy;
    -[NIHeading headingAccuracy](v8, "headingAccuracy");
    if (trueHeading == v15)
      v21 = v12;
    else
      v21 = 0;
    if (magneticHeading != v18)
      v21 = 0;
    if (headingAccuracy == v20)
      v22 = v21;
    else
      v22 = 0;
    goto LABEL_17;
  }
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSDate *timestamp;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  timestamp = self->_timestamp;
  if (timestamp)
    v4 = (unint64_t)-[NSDate hash](timestamp, "hash");
  else
    v4 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_trueHeading));
  v6 = (unint64_t)objc_msgSend(v5, "hash");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_magneticHeading));
  v8 = (unint64_t)objc_msgSend(v7, "hash");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_headingAccuracy));
  v10 = v6 ^ v4 ^ v8 ^ (unint64_t)objc_msgSend(v9, "hash");

  return v10;
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIHeading descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1fdeg"), *(_QWORD *)&self->_trueHeading));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1fdeg"), *(_QWORD *)&self->_magneticHeading));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1fdeg"), *(_QWORD *)&self->_headingAccuracy));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Time: %@. TrueHeading: %@. MagHeading: %@. HeadingAcc: %@"), self->_timestamp, v3, v4, v5));

  }
  else
  {
    v6 = CFSTR("***");
  }
  return v6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)trueHeading
{
  return self->_trueHeading;
}

- (void)setTrueHeading:(double)a3
{
  self->_trueHeading = a3;
}

- (double)magneticHeading
{
  return self->_magneticHeading;
}

- (void)setMagneticHeading:(double)a3
{
  self->_magneticHeading = a3;
}

- (double)headingAccuracy
{
  return self->_headingAccuracy;
}

- (void)setHeadingAccuracy:(double)a3
{
  self->_headingAccuracy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
