@implementation BKLocation

- (BKLocation)initWithOrdinal:(int64_t)a3
{
  BKLocation *v4;
  BKLocation *v5;

  v4 = -[BKLocation init](self, "init");
  v5 = v4;
  if (v4)
    -[BKLocation setOrdinal:](v4, "setOrdinal:", a3);
  return v5;
}

- (BKLocation)initWithLocationDictionary:(id)a3
{
  id v4;
  BKLocation *v5;
  void *v6;

  v4 = a3;
  v5 = -[BKLocation init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("ordinal")));
    -[BKLocation setOrdinal:](v5, "setOrdinal:", (int)objc_msgSend(v6, "intValue"));

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class(BKLocation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "ordinal");
    v7 = v6 == (id)-[BKLocation ordinal](self, "ordinal");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BKLocation)initWithCoder:(id)a3
{
  id v4;
  BKLocation *v5;

  v4 = a3;
  v5 = -[BKLocation init](self, "init");
  if (v5)
    -[BKLocation setOrdinal:](v5, "setOrdinal:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ordinal")));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[BKLocation ordinal](self, "ordinal"), CFSTR("ordinal"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5;
  id v6;
  id v7;

  *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
  v7 = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  objc_msgSend(v7, "setOrdinal:", -[BKLocation ordinal](self, "ordinal"));
  return v7;
}

- (id)serializeLocationToDictionary
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[BKLocation ordinal](self, "ordinal")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v2, CFSTR("ordinal"), CFSTR("BKLocation"), CFSTR("class"), 0));

  return v3;
}

- (id)serializeLocationToData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLocation serializeLocationToDictionary](self, "serializeLocationToDictionary"));
  if (v2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v2, 200, 0, 0));
  else
    v3 = 0;

  return v3;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3;
  void *v4;
  BKLocation *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("class")));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("BKLocation")))
    v5 = -[BKLocation initWithLocationDictionary:]([BKLocation alloc], "initWithLocationDictionary:", v3);
  else
    v5 = 0;

  return v5;
}

- (id)stringValue
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{ordinal : %ld}"), -[BKLocation ordinal](self, "ordinal"));
}

- (NSString)description
{
  double v3;
  uint64_t v4;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> _ordinal:%ld"), v4, self, -[BKLocation ordinal](self, "ordinal", v3));
}

- (int64_t)ordinal
{
  return self->_ordinal;
}

- (void)setOrdinal:(int64_t)a3
{
  self->_ordinal = a3;
}

- (NSArray)selectionRects
{
  return self->_selectionRects;
}

- (void)setSelectionRects:(id)a3
{
  objc_storeStrong((id *)&self->_selectionRects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionRects, 0);
}

@end
