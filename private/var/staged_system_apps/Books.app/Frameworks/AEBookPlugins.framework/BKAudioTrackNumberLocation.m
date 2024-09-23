@implementation BKAudioTrackNumberLocation

- (BKAudioTrackNumberLocation)initWithOrdinal:(int64_t)a3 offset:(double)a4 persistentID:(unint64_t)a5
{
  BKAudioTrackNumberLocation *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAudioTrackNumberLocation;
  result = -[BKAudioLocation initWithOrdinal:offset:](&v7, "initWithOrdinal:offset:", a3, a4);
  if (result)
    result->_persistentID = a5;
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAudioTrackNumberLocation;
  v3 = -[BKAudioLocation hash](&v7, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_persistentID));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class(BKAudioTrackNumberLocation);
  v6 = (objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (v8.receiver = self,
        v8.super_class = (Class)BKAudioTrackNumberLocation,
        -[BKAudioLocation isEqual:](&v8, "isEqual:", v4))
    && objc_msgSend(v4, "persistentID") == (id)self->_persistentID;

  return v6;
}

- (id)stringValue
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAudioTrackNumberLocation;
  v3 = -[BKAudioLocation stringValue](&v7, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{ %@, persistentID:%llu }"), v4, self->_persistentID));

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAudioTrackNumberLocation;
  v3 = -[BKAudioLocation description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, persistentID:%llu"), v4, self->_persistentID));

  return v5;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

@end
