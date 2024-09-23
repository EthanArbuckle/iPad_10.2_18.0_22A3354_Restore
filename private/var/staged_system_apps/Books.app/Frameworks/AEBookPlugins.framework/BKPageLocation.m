@implementation BKPageLocation

- (BKPageLocation)initWithCoder:(id)a3
{
  id v4;
  BKPageLocation *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKPageLocation;
  v5 = -[BKLocation initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
    v5->_pageOffset = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pageOffset"));

  return v5;
}

- (BKPageLocation)initWithLocationDictionary:(id)a3
{
  id v4;
  void *v5;
  BKPageLocation *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("super")));
  v9.receiver = self;
  v9.super_class = (Class)BKPageLocation;
  v6 = -[BKLocation initWithLocationDictionary:](&v9, "initWithLocationDictionary:", v5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("pageOffset")));
    v6->_pageOffset = (int)objc_msgSend(v7, "intValue");

  }
  return v6;
}

- (BKPageLocation)initWithOrdinal:(int64_t)a3 andOffset:(unint64_t)a4
{
  BKPageLocation *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKPageLocation;
  result = -[BKLocation initWithOrdinal:](&v6, "initWithOrdinal:", a3);
  if (result)
    result->_pageOffset = a4;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class(BKPageLocation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)BKPageLocation,
        -[BKLocation isEqual:](&v9, "isEqual:", v4)))
  {
    v6 = objc_msgSend(v4, "pageOffset");
    v7 = v6 == (id)-[BKPageLocation pageOffset](self, "pageOffset");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKPageLocation;
  return self->_pageOffset ^ -[BKLocation hash](&v3, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKPageLocation;
  v4 = -[BKLocation copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setPageOffset:", -[BKPageLocation pageOffset](self, "pageOffset"));
  return v4;
}

- (id)serializeLocationToDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKPageLocation;
  v3 = -[BKLocation serializeLocationToDictionary](&v8, "serializeLocationToDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKPageLocation pageOffset](self, "pageOffset")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v4, CFSTR("super"), v5, CFSTR("pageOffset"), CFSTR("BKPageLocation"), CFSTR("class"), 0));

  return v6;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3;
  void *v4;
  BKPageLocation *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("class")));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("BKPageLocation")))
    v5 = -[BKPageLocation initWithLocationDictionary:]([BKPageLocation alloc], "initWithLocationDictionary:", v3);
  else
    v5 = 0;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPageLocation;
  v4 = a3;
  -[BKLocation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_pageOffset, CFSTR("pageOffset"), v5.receiver, v5.super_class);

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
  v7.super_class = (Class)BKPageLocation;
  v3 = -[BKLocation stringValue](&v7, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{ %@, pageOffset:%lu }"), v4, self->_pageOffset));

  return v5;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKPageLocation;
  v3 = -[BKLocation description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, _pageOffset:%lu"), v4, self->_pageOffset));

  return (NSString *)v5;
}

- (unint64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(unint64_t)a3
{
  self->_pageOffset = a3;
}

@end
