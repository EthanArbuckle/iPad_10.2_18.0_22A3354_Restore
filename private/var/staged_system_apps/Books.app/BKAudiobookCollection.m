@implementation BKAudiobookCollection

- (BKAudiobookCollection)initWithStoreID:(id)a3
{
  id v5;
  BKAudiobookCollection *v6;
  BKAudiobookCollection *v7;
  uint64_t v8;
  NSMutableArray *mutableItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKAudiobookCollection;
  v6 = -[BKAudiobookCollection init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeID, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    mutableItems = v7->_mutableItems;
    v7->_mutableItems = (NSMutableArray *)v8;

  }
  return v7;
}

- (NSArray)items
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookCollection mutableItems](self, "mutableItems"));
  v3 = objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookCollection mutableItems](self, "mutableItems"));
  objc_msgSend(v5, "addObject:", v4);

}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookCollection items](self, "items"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) %@>"), v5, self, v6));

  return v7;
}

- (NSNumber)storeID
{
  return self->_storeID;
}

- (NSMutableArray)mutableItems
{
  return self->_mutableItems;
}

- (void)setMutableItems:(id)a3
{
  objc_storeStrong((id *)&self->_mutableItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableItems, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
}

@end
