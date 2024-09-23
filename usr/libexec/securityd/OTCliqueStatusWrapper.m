@implementation OTCliqueStatusWrapper

- (OTCliqueStatusWrapper)initWithStatus:(int64_t)a3
{
  OTCliqueStatusWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OTCliqueStatusWrapper;
  result = -[OTCliqueStatusWrapper init](&v5, "init");
  if (result)
    result->_status = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class(OTCliqueStatusWrapper);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "status");
    v7 = v6 == (id)-[OTCliqueStatusWrapper status](self, "status");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = OTCliqueStatusToString(-[OTCliqueStatusWrapper status](self, "status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CliqueStatus: %@>"), v3));

  return v4;
}

- (int64_t)status
{
  return self->_status;
}

@end
