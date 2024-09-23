@implementation ATXUIFeedbackMetricsQuery

- (ATXUIFeedbackMetricsQuery)init
{
  ATXUIFeedbackMetricsQuery *v2;
  uint64_t v3;
  NSDate *startDate;
  uint64_t v5;
  NSDate *endDate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXUIFeedbackMetricsQuery;
  v2 = -[ATXUIFeedbackMetricsQuery init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
    v3 = objc_claimAutoreleasedReturnValue();
    startDate = v2->_startDate;
    v2->_startDate = (NSDate *)v3;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = objc_claimAutoreleasedReturnValue();
    endDate = v2->_endDate;
    v2->_endDate = (NSDate *)v5;

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  ATXUIFeedbackMetricsQuery *v4;
  ATXUIFeedbackMetricsQuery *v5;
  BOOL v6;

  v4 = (ATXUIFeedbackMetricsQuery *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUIFeedbackMetricsQuery isEqualToATXUIFeedbackMetricsQuery:](self, "isEqualToATXUIFeedbackMetricsQuery:", v5);

  return v6;
}

- (BOOL)isEqualToATXUIFeedbackMetricsQuery:(id)a3
{
  unsigned __int8 *v4;
  _QWORD *v5;
  NSDate *startDate;
  NSDate *v7;
  NSDate *v8;
  NSDate *v9;
  char v10;
  char v11;
  NSDate *v13;
  NSDate *v14;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (self->_clientModelType != *((_QWORD *)v4 + 4) || self->_consumerSubType != v4[8])
    goto LABEL_5;
  startDate = self->_startDate;
  v7 = (NSDate *)*((id *)v4 + 2);
  if (startDate == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = startDate;
    v10 = -[NSDate isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
LABEL_5:
      v11 = 0;
      goto LABEL_6;
    }
  }
  v13 = self->_endDate;
  v14 = v13;
  if (v13 == (NSDate *)v5[3])
    v11 = 1;
  else
    v11 = -[NSDate isEqual:](v13, "isEqual:");

LABEL_6:
  return v11;
}

- (unint64_t)hash
{
  int64_t v3;
  uint64_t v4;

  v3 = self->_consumerSubType - self->_clientModelType + 32 * self->_clientModelType;
  v4 = -[NSDate hash](self->_startDate, "hash") - v3 + 32 * v3;
  return -[NSDate hash](self->_endDate, "hash") - v4 + 32 * v4;
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

- (int64_t)clientModelType
{
  return self->_clientModelType;
}

- (void)setClientModelType:(int64_t)a3
{
  self->_clientModelType = a3;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(unsigned __int8)a3
{
  self->_consumerSubType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
