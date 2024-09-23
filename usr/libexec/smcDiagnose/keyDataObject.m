@implementation keyDataObject

- (keyDataObject)initWith:(id)a3
{
  id v4;
  keyDataObject *v5;
  uint64_t v6;
  NSString *keyString;
  NSMutableArray *v8;
  NSMutableArray *valueArray;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)keyDataObject;
  v5 = -[keyDataObject init](&v11, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v4));
    keyString = v5->keyString;
    v5->keyString = (NSString *)v6;

    v8 = objc_opt_new(NSMutableArray);
    valueArray = v5->valueArray;
    v5->valueArray = v8;

    v5->type = 1;
  }

  return v5;
}

- (keyDataObject)initWithT:(id)a3
{
  id v4;
  keyDataObject *v5;
  uint64_t v6;
  NSString *keyString;
  NSMutableArray *v8;
  NSMutableArray *valueArray;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)keyDataObject;
  v5 = -[keyDataObject init](&v11, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v4));
    keyString = v5->keyString;
    v5->keyString = (NSString *)v6;

    v8 = objc_opt_new(NSMutableArray);
    valueArray = v5->valueArray;
    v5->valueArray = v8;

    v5->type = 2;
  }

  return v5;
}

- (id)keyString
{
  return self->keyString;
}

- (id)valueStr:(int64_t)a3
{
  void *v5;

  if (self->type == 1 && (unint64_t)-[NSMutableArray count](self->valueArray, "count") > a3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->valueArray, "objectAtIndex:", a3));
  else
    v5 = 0;
  return v5;
}

- (double)valueDouble:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;

  if (self->type != 2 || (unint64_t)-[NSMutableArray count](self->valueArray, "count") <= a3)
    return -1.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->valueArray, "objectAtIndex:", a3));
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (int64_t)numValues
{
  return (int64_t)-[NSMutableArray count](self->valueArray, "count");
}

- (void)addToValueArray:(id)a3 idx:(int64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", a3, a4));
  -[NSMutableArray addObject:](self->valueArray, "addObject:", v5);

}

- (void)addToTimeArray:(double)a3 idx:(int64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4, a3));
  -[NSMutableArray addObject:](self->valueArray, "addObject:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->valueArray, 0);
  objc_storeStrong((id *)&self->keyString, 0);
}

@end
