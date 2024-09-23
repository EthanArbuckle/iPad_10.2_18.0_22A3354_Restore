@implementation TIStatisticKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_aggdName, 0);
  objc_storeStrong((id *)&self->_counterName, 0);
}

- (NSString)aggdName
{
  return self->_aggdName;
}

+ (id)statisticKeyWithAggdName:(id)a3 andCounterName:(id)a4 andInputMode:(id)a5
{
  id v7;
  id v8;
  id v9;
  TIStatisticKey *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[TIStatisticKey initWithAggdName:andCounterName:andInputMode:]([TIStatisticKey alloc], "initWithAggdName:andCounterName:andInputMode:", v9, v8, v7);

  return v10;
}

- (TIStatisticKey)initWithAggdName:(id)a3 andCounterName:(id)a4 andInputMode:(id)a5
{
  id v9;
  id v10;
  id v11;
  TIStatisticKey *v12;
  TIStatisticKey *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TIStatisticKey;
  v12 = -[TIStatisticKey init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_aggdName, a3);
    objc_storeStrong((id *)&v13->_counterName, a4);
    objc_storeStrong((id *)&v13->_inputMode, a5);
  }

  return v13;
}

- (NSString)counterName
{
  return self->_counterName;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

@end
