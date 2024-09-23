@implementation TUIImpressionSnapshot

- (TUIImpressionSnapshot)initWithMap:(id)a3
{
  id v4;
  TUIImpressionSnapshot *v5;
  NSDictionary *v6;
  NSDictionary *map;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIImpressionSnapshot;
  v5 = -[TUIImpressionSnapshot init](&v9, "init");
  if (v5)
  {
    v6 = (NSDictionary *)objc_msgSend(v4, "copy");
    map = v5->_map;
    v5->_map = v6;

  }
  return v5;
}

- (id)impressionForIdentifier:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:"));
  else
    return 0;
}

- (id)impressions
{
  return -[NSDictionary allValues](self->_map, "allValues");
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ impressions=%@>"), v5, self->_map));

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
}

@end
