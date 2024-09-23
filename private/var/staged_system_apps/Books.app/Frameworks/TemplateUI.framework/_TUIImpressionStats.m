@implementation _TUIImpressionStats

- (_TUIImpressionStats)init
{
  _TUIImpressionStats *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *impressions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TUIImpressionStats;
  v2 = -[_TUIImpressionStats init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    impressions = v2->_impressions;
    v2->_impressions = v3;

  }
  return v2;
}

- (id)impressionForData:(id)a3 size:(CGSize)a4 create:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  id v9;
  void *v10;
  uint64_t v11;
  TUIImpression *v12;
  TUIImpression *v14;
  void *v15;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_impressions, "objectForKey:", v10));
    if (v9 != 0 && v11 == 0)
      v12 = 0;
    else
      v12 = (TUIImpression *)v11;
    if (v9 != 0 && v11 == 0 && v5)
    {
      v14 = [TUIImpression alloc];
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
      v12 = -[TUIImpression initWithData:size:identifier:](v14, "initWithData:size:identifier:", v15, v10, width, height);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_impressions, "setObject:forKeyedSubscript:", v12, v10);
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)impressionForIdentifier:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_impressions, "objectForKeyedSubscript:"));
  else
    return 0;
}

- (void)clearImpressions
{
  -[NSMutableDictionary removeAllObjects](self->_impressions, "removeAllObjects");
}

- (NSMutableDictionary)impressions
{
  return self->_impressions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressions, 0);
}

@end
