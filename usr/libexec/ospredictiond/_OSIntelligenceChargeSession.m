@implementation _OSIntelligenceChargeSession

- (_OSIntelligenceChargeSession)initWithStartDate:(id)a3 withEndDate:(id)a4 withStartSoC:(id)a5 withEndSoC:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _OSIntelligenceChargeSession *v15;
  _OSIntelligenceChargeSession *v16;
  double v17;
  double v18;
  double v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_OSIntelligenceChargeSession;
  v15 = -[_OSIntelligenceChargeSession init](&v21, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_startDate, a3);
    objc_storeStrong((id *)&v16->_endDate, a4);
    objc_storeStrong((id *)&v16->_startSoC, a5);
    objc_storeStrong((id *)&v16->_endSoC, a6);
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v18 = v17;
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v16->_duration = v18 - v19;
  }

  return v16;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Start: %@ (SoC: %@) - End: %@ (SoC: %@) (duration: %f) - "), self->_startDate, self->_startSoC, self->_endDate, self->_endSoC, *(_QWORD *)&self->_duration);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntelligenceChargeSession startDate](self, "startDate"));
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntelligenceChargeSession endDate](self, "endDate"));
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntelligenceChargeSession startSoC](self, "startSoC"));
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntelligenceChargeSession endSoC](self, "endSoC"));
  v12 = objc_msgSend(v11, "copy");
  v13 = objc_msgSend(v4, "initWithStartDate:withEndDate:withStartSoC:withEndSoC:", v6, v8, v10, v12);

  return v13;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSNumber)startSoC
{
  return self->_startSoC;
}

- (NSNumber)endSoC
{
  return self->_endSoC;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endSoC, 0);
  objc_storeStrong((id *)&self->_startSoC, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
