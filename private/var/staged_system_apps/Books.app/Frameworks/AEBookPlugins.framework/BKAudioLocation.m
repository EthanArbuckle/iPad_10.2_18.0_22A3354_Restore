@implementation BKAudioLocation

- (BKAudioLocation)initWithOrdinal:(int64_t)a3 offset:(double)a4
{
  BKAudioLocation *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAudioLocation;
  result = -[BKLocation initWithOrdinal:](&v6, "initWithOrdinal:", a3);
  if (result)
    result->_offset = a4;
  return result;
}

- (BKAudioLocation)initWithLocationDictionary:(id)a3
{
  id v4;
  void *v5;
  BKAudioLocation *v6;
  void *v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("super")));
  v10.receiver = self;
  v10.super_class = (Class)BKAudioLocation;
  v6 = -[BKLocation initWithLocationDictionary:](&v10, "initWithLocationDictionary:", v5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("offset")));
    objc_msgSend(v7, "doubleValue");
    v6->_offset = v8;

  }
  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAudioLocation;
  v3 = -[BKLocation hash](&v7, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_offset));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class(BKAudioLocation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)BKAudioLocation,
        -[BKLocation isEqual:](&v9, "isEqual:", v4)))
  {
    objc_msgSend(v4, "offset");
    v7 = v6 == self->_offset;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)stringValue
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAudioLocation;
  v3 = -[BKLocation stringValue](&v7, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{ %@, offset:%f }"), v4, *(_QWORD *)&self->_offset));

  return v5;
}

- (id)description
{
  NSString *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAudioLocation;
  v3 = -[BKLocation description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, offset:%f"), v4, *(_QWORD *)&self->_offset));

  return v5;
}

- (id)serializeLocationToDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKAudioLocation;
  v3 = -[BKLocation serializeLocationToDictionary](&v8, "serializeLocationToDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_offset));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v4, CFSTR("super"), v5, CFSTR("offset"), CFSTR("BKAudioLocation"), CFSTR("class"), 0));

  return v6;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3;
  void *v4;
  BKAudioLocation *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("class")));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("BKAudioLocation")))
    v5 = -[BKAudioLocation initWithLocationDictionary:]([BKAudioLocation alloc], "initWithLocationDictionary:", v3);
  else
    v5 = 0;

  return v5;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

@end
