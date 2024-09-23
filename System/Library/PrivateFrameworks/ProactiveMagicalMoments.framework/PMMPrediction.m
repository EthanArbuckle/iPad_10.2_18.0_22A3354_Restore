@implementation PMMPrediction

- (PMMPrediction)initWithPredictedItems:(id)a3 expirationDate:(id)a4
{
  id v7;
  id v8;
  PMMPrediction *v9;
  PMMPrediction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PMMPrediction;
  v9 = -[PMMPrediction init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predictedItems, a3);
    objc_storeStrong((id *)&v10->_expirationDate, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PMMPrediction *v4;
  PMMPrediction *v5;
  BOOL v6;

  v4 = (PMMPrediction *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PMMPrediction isEqualToPrediction:](self, "isEqualToPrediction:", v5);

  return v6;
}

- (BOOL)isEqualToPrediction:(id)a3
{
  id *v4;
  NSDate *expirationDate;
  NSDate *v6;
  NSDate *v7;
  NSDate *v8;
  char v9;
  char v10;
  NSArray *v11;
  NSArray *v12;

  v4 = (id *)a3;
  expirationDate = self->_expirationDate;
  v6 = (NSDate *)v4[2];
  if (expirationDate == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = expirationDate;
    v9 = -[NSDate isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_predictedItems;
  v12 = v11;
  if (v11 == v4[1])
    v10 = 1;
  else
    v10 = -[NSArray isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_expirationDate, "hash");
  return -[NSArray hash](self->_predictedItems, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PredictionItems: %@\nexpirationDate: %@"), self->_predictedItems, self->_expirationDate);
}

- (NSArray)predictedItems
{
  return self->_predictedItems;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_predictedItems, 0);
}

@end
