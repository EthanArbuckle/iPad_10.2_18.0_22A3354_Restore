@implementation PHACoreDuetDatasetSample

- (PHACoreDuetDatasetSample)initWithIdentifier:(id)a3 andDate:(id)a4 forSubset:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  PHACoreDuetDatasetSample *v11;
  PHACoreDuetDatasetSample *v12;
  const __CFString *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  v15.receiver = self;
  v15.super_class = (Class)PHACoreDuetDatasetSample;
  v11 = -[PHACoreDuetDatasetSample init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    -[PHACoreDuetDatasetSample setIdentifier:](v11, "setIdentifier:", v8);
    -[PHACoreDuetDatasetSample setDate:](v12, "setDate:", v9);
    if (v10)
      v13 = v10;
    else
      v13 = &stru_1E85223A0;
    -[PHACoreDuetDatasetSample setSubset:](v12, "setSubset:", v13);
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)subset
{
  return self->_subset;
}

- (void)setSubset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subset, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
