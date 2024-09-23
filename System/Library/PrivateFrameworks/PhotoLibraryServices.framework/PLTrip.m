@implementation PLTrip

- (PLTrip)initWithItems:(id)a3 type:(unint64_t)a4
{
  id v6;
  PLTrip *v7;
  PLTrip *v8;
  uint64_t v9;
  NSArray *items;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLTrip;
  v7 = -[PLTrip init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a4;
    v9 = objc_msgSend(v6, "copy");
    items = v8->_items;
    v8->_items = (NSArray *)v9;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)PLTrip;
  -[PLTrip description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTrip items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pl_startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTrip items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pl_endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTrip typeDescription](self, "typeDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ - %@, %@, %lu moments"), v4, v7, v10, v11, -[NSArray count](self->_items, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)typeDescription
{
  unint64_t type;
  const __CFString *v3;

  type = self->_type;
  v3 = CFSTR("Short");
  if (type == 1)
    v3 = CFSTR("Long");
  if (type == 2)
    return CFSTR("Ongoing");
  else
    return (id)v3;
}

- (double)duration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[PLTrip items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLTrip items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pl_endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pl_startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  return v10;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
