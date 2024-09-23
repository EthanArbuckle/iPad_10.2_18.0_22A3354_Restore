@implementation BKAnchorLocation

- (BKAnchorLocation)initWithCoder:(id)a3
{
  id v4;
  BKAnchorLocation *v5;
  double v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  NSString *anchor;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKAnchorLocation;
  v5 = -[BKLocation initWithCoder:](&v12, "initWithCoder:", v4);
  if (v5)
  {
    *(_QWORD *)&v6 = objc_opt_class(NSString).n128_u64[0];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("anchor"), v6));
    v9 = (NSString *)objc_msgSend(v8, "copy");
    anchor = v5->_anchor;
    v5->_anchor = v9;

  }
  return v5;
}

- (BKAnchorLocation)initWithLocationDictionary:(id)a3
{
  id v4;
  void *v5;
  BKAnchorLocation *v6;
  void *v7;
  NSString *v8;
  NSString *anchor;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("super")));
  v11.receiver = self;
  v11.super_class = (Class)BKAnchorLocation;
  v6 = -[BKLocation initWithLocationDictionary:](&v11, "initWithLocationDictionary:", v5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("anchor")));
    v8 = (NSString *)objc_msgSend(v7, "copy");
    anchor = v6->_anchor;
    v6->_anchor = v8;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class(BKAnchorLocation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)BKAnchorLocation,
        -[BKLocation isEqual:](&v10, "isEqual:", v4)))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnchorLocation anchor](self, "anchor"));
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKAnchorLocation;
  v3 = -[BKLocation hash](&v5, "hash");
  return -[NSString hash](self->_anchor, "hash") ^ v3;
}

- (id)serializeLocationToDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKAnchorLocation;
  v3 = -[BKLocation serializeLocationToDictionary](&v8, "serializeLocationToDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnchorLocation anchor](self, "anchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v4, CFSTR("super"), v5, CFSTR("anchor"), CFSTR("BKAnchorLocation"), CFSTR("class"), 0));

  return v6;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3;
  void *v4;
  BKAnchorLocation *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("class")));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("BKAnchorLocation")))
    v5 = -[BKAnchorLocation initWithLocationDictionary:]([BKAnchorLocation alloc], "initWithLocationDictionary:", v3);
  else
    v5 = 0;

  return v5;
}

- (BKAnchorLocation)initWithOrdinal:(int64_t)a3 andAnchor:(id)a4
{
  id v6;
  BKAnchorLocation *v7;
  NSString *v8;
  NSString *anchor;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BKAnchorLocation;
  v7 = -[BKLocation initWithOrdinal:](&v11, "initWithOrdinal:", a3);
  if (v7)
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    anchor = v7->_anchor;
    v7->_anchor = v8;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKAnchorLocation;
  v4 = a3;
  -[BKLocation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchor, CFSTR("anchor"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)stringValue
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAnchorLocation;
  v3 = -[BKLocation stringValue](&v7, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{ %@, anchor:%@ }"), v4, self->_anchor));

  return v5;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAnchorLocation;
  v3 = -[BKLocation description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, _anchor:%@"), v4, self->_anchor));

  return (NSString *)v5;
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end
