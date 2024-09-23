@implementation APPBThirdPartySegmentUpdateResponse

+ (id)options
{
  if (qword_1002698D0 != -1)
    dispatch_once(&qword_1002698D0, &stru_100214FE8);
  return (id)qword_1002698C8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBThirdPartySegmentUpdateResponse;
  v3 = -[APPBThirdPartySegmentUpdateResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBThirdPartySegmentUpdateResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  return +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
}

- (BOOL)readFrom:(id)a3
{
  return APPBThirdPartySegmentUpdateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self));

  return (char)self;
}

- (unint64_t)hash
{
  return 0;
}

@end
