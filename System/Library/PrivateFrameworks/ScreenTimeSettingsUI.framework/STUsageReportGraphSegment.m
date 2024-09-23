@implementation STUsageReportGraphSegment

- (STUsageReportGraphSegment)initWithAmount:(id)a3 amountAsPercentageOfDataPointTotal:(double)a4 color:(id)a5
{
  id v8;
  id v9;
  STUsageReportGraphSegment *v10;
  uint64_t v11;
  NSNumber *amount;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)STUsageReportGraphSegment;
  v10 = -[STUsageReportGraphSegment init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    amount = v10->_amount;
    v10->_amount = (NSNumber *)v11;

    v10->_amountAsPercentageOfDataPointTotal = a4;
    objc_storeStrong((id *)&v10->_color, a5);
  }

  return v10;
}

- (NSNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)amountAsPercentageOfDataPointTotal
{
  return self->_amountAsPercentageOfDataPointTotal;
}

- (void)setAmountAsPercentageOfDataPointTotal:(double)a3
{
  self->_amountAsPercentageOfDataPointTotal = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
