@implementation TPCachedViableBottles

- (TPCachedViableBottles)initWithViableBottles:(id)a3 partialBottles:(id)a4
{
  id v7;
  id v8;
  TPCachedViableBottles *v9;
  TPCachedViableBottles *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TPCachedViableBottles;
  v9 = -[TPCachedViableBottles init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viableBottles, a3);
    objc_storeStrong((id *)&v10->_partialBottles, a4);
  }

  return v10;
}

- (NSArray)viableBottles
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)partialBottles
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialBottles, 0);
  objc_storeStrong((id *)&self->_viableBottles, 0);
}

@end
