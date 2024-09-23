@implementation ICSPeriod

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[ICSPeriod start](self, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_ICSStringWithOptions:appendingToString:", a3, v8);

  objc_msgSend(v8, "appendString:", CFSTR("/"));
  if (-[ICSPeriod isDurationBased](self, "isDurationBased"))
    -[ICSPeriod duration](self, "duration");
  else
    -[ICSPeriod end](self, "end");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_ICSStringWithOptions:appendingToString:", a3, v8);

}

- (ICSPeriod)initWithStart:(id)a3
{
  id v5;
  ICSPeriod *v6;
  ICSPeriod *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSPeriod;
  v6 = -[ICSPeriod init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_start, a3);

  return v7;
}

- (ICSPeriod)initWithStart:(id)a3 end:(id)a4
{
  id v7;
  ICSPeriod *v8;
  ICSPeriod *v9;

  v7 = a4;
  v8 = -[ICSPeriod initWithStart:](self, "initWithStart:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_end, a4);

  return v9;
}

- (ICSPeriod)initWithStart:(id)a3 duration:(id)a4
{
  id v7;
  ICSPeriod *v8;
  ICSPeriod *v9;

  v7 = a4;
  v8 = -[ICSPeriod initWithStart:](self, "initWithStart:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_duration, a4);

  return v9;
}

- (id)start
{
  return self->_start;
}

- (id)end
{
  return self->_end;
}

- (id)duration
{
  return self->_duration;
}

- (BOOL)isDurationBased
{
  void *v2;
  BOOL v3;

  -[ICSPeriod duration](self, "duration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ICSDateValue *start;
  id v5;

  start = self->_start;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", start, CFSTR("StartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_end, CFSTR("EndDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_duration, CFSTR("DurationObject"));

}

- (ICSPeriod)initWithCoder:(id)a3
{
  id v4;
  ICSPeriod *v5;
  uint64_t v6;
  ICSDateValue *start;
  uint64_t v8;
  ICSDateValue *end;
  uint64_t v10;
  ICSDuration *duration;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICSPeriod;
  v5 = -[ICSPeriod init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StartDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    start = v5->_start;
    v5->_start = (ICSDateValue *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EndDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    end = v5->_end;
    v5->_end = (ICSDateValue *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DurationObject"));
    v10 = objc_claimAutoreleasedReturnValue();
    duration = v5->_duration;
    v5->_duration = (ICSDuration *)v10;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
