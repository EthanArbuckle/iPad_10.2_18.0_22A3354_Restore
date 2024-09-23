@implementation STShowStockOverviewRequest

- (id)_initWithName:(id)a3 symbol:(id)a4 exchange:(id)a5 price:(id)a6 high:(id)a7 low:(id)a8 change:(id)a9 changePercent:(id)a10 chartData:(id)a11
{
  id v18;
  STShowStockOverviewRequest *v19;
  id *p_isa;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)STShowStockOverviewRequest;
  v19 = -[AFSiriRequest init](&v30, sel_init);
  p_isa = (id *)&v19->super.super.isa;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_name, a3);
    objc_storeStrong(p_isa + 6, a4);
    objc_storeStrong(p_isa + 7, a5);
    objc_storeStrong(p_isa + 8, a6);
    objc_storeStrong(p_isa + 9, a7);
    objc_storeStrong(p_isa + 10, a8);
    objc_storeStrong(p_isa + 11, a9);
    objc_storeStrong(p_isa + 12, a10);
    objc_storeStrong(p_isa + 13, a11);
  }

  return p_isa;
}

- (id)createResponse
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
}

- (id)name
{
  return self->_name;
}

- (id)symbol
{
  return self->_symbol;
}

- (id)exchange
{
  return self->_exchange;
}

- (id)price
{
  return self->_price;
}

- (id)high
{
  return self->_high;
}

- (id)low
{
  return self->_low;
}

- (id)change
{
  return self->_change;
}

- (id)changePercent
{
  return self->_changePercent;
}

- (id)chartData
{
  return self->_chartData;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STShowStockOverviewRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("_name"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_symbol, CFSTR("_symbol"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_exchange, CFSTR("_exchange"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_price, CFSTR("_price"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_high, CFSTR("_high"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_low, CFSTR("_low"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_change, CFSTR("_change"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_changePercent, CFSTR("_changePercent"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_chartData, CFSTR("_chartData"));

}

- (STShowStockOverviewRequest)initWithCoder:(id)a3
{
  id v4;
  STShowStockOverviewRequest *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *symbol;
  uint64_t v10;
  NSString *exchange;
  uint64_t v12;
  NSNumber *price;
  uint64_t v14;
  NSNumber *high;
  uint64_t v16;
  NSNumber *low;
  uint64_t v18;
  NSNumber *change;
  uint64_t v20;
  NSNumber *changePercent;
  uint64_t v22;
  NSString *chartData;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)STShowStockOverviewRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_symbol"));
    v8 = objc_claimAutoreleasedReturnValue();
    symbol = v5->_symbol;
    v5->_symbol = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_exchange"));
    v10 = objc_claimAutoreleasedReturnValue();
    exchange = v5->_exchange;
    v5->_exchange = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_price"));
    v12 = objc_claimAutoreleasedReturnValue();
    price = v5->_price;
    v5->_price = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_high"));
    v14 = objc_claimAutoreleasedReturnValue();
    high = v5->_high;
    v5->_high = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_low"));
    v16 = objc_claimAutoreleasedReturnValue();
    low = v5->_low;
    v5->_low = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_change"));
    v18 = objc_claimAutoreleasedReturnValue();
    change = v5->_change;
    v5->_change = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_changePercent"));
    v20 = objc_claimAutoreleasedReturnValue();
    changePercent = v5->_changePercent;
    v5->_changePercent = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_chartData"));
    v22 = objc_claimAutoreleasedReturnValue();
    chartData = v5->_chartData;
    v5->_chartData = (NSString *)v22;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartData, 0);
  objc_storeStrong((id *)&self->_changePercent, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_low, 0);
  objc_storeStrong((id *)&self->_high, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_exchange, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
