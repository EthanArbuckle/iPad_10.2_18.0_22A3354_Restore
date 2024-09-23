@implementation MTPlayerItemList

- (MTPlayerItemList)initWithPlayerItems:(id)a3
{
  id v4;
  MTPlayerItemList *v5;
  MTPlayerItemList *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTPlayerItemList;
  v5 = -[MTPlayerItemList init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MTPlayerItemList setPlayerItems:](v5, "setPlayerItems:", v4);

  return v6;
}

- (id)metricsContentIdentifier
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItemList playerItems](self, "playerItems"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItemList playerItems](self, "playerItems"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v6));

      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metricsContentIdentifier"));
      v10 = (void *)v9;
      if (v9)
        v11 = (void *)v9;
      else
        v11 = &__NSDictionary0__struct;
      v12 = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v6));
      objc_msgSend(v3, "setObject:forKey:", v12, v13);

      ++v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItemList playerItems](self, "playerItems"));
      v15 = objc_msgSend(v14, "count");

    }
    while ((unint64_t)v15 > v6);
  }
  return v3;
}

- (NSArray)playerItems
{
  return self->_playerItems;
}

- (void)setPlayerItems:(id)a3
{
  objc_storeStrong((id *)&self->_playerItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerItems, 0);
}

@end
