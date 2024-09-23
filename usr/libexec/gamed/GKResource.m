@implementation GKResource

+ (id)resourceForRemoveGames:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[GKResource resourceWithID:representedItem:](GKMutableResource, "resourceWithID:representedItem:", a3, a3));
}

+ (GKResource)resourceWithID:(id)a3
{
  return (GKResource *)objc_msgSend(a1, "resourceWithID:representedItem:TTL:", a3, 0, 0.0);
}

+ (GKResource)resourceWithID:(id)a3 representedItem:(id)a4
{
  return (GKResource *)objc_msgSend(a1, "resourceWithID:representedItem:TTL:", a3, a4, 0.0);
}

+ (GKResource)resourceWithID:(id)a3 representedItem:(id)a4 TTL:(double)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v8 = a4;
  v9 = a3;
  v11 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v10)), "initWithResourceID:representedItem:TTL:", v9, v8, a5);

  return (GKResource *)v11;
}

- (GKResource)initWithResourceID:(id)a3 representedItem:(id)a4 TTL:(double)a5
{
  id v8;
  id v9;
  GKResource *v10;
  NSObject *v11;
  NSObject *resourceID;
  NSMutableDictionary *v13;
  NSMutableDictionary *metadataLookup;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GKResource;
  v10 = -[GKResource init](&v16, "init");
  if (v10)
  {
    v11 = objc_msgSend(v8, "copyWithZone:", 0);
    resourceID = v10->_resourceID;
    v10->_resourceID = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    metadataLookup = v10->_metadataLookup;
    v10->_metadataLookup = v13;

    v10->_TTL = a5;
    -[GKResource setRepresentedItem:](v10, "setRepresentedItem:", v9);
  }

  return v10;
}

- (GKResource)init
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, CFSTR("Can't use init on GKDataResource. Use resourceWithID: instead."), 0));
  objc_exception_throw(v2);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  GKMutableResource *v4;
  GKMutableResource *v5;
  id v6;

  v4 = -[GKResource initWithResourceID:representedItem:TTL:]([GKMutableResource alloc], "initWithResourceID:representedItem:TTL:", self->_resourceID, self->_representedItem, self->_TTL);
  v5 = v4;
  if (v4)
  {
    v4->super._invalid = self->_invalid;
    v6 = -[NSMutableDictionary copy](self->_metadataLookup, "copy");
    -[GKResource setMetadataLookup:](v5, "setMetadataLookup:", v6);

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  NSObject *resourceID;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  if (qword_100317F30 != -1)
    dispatch_once(&qword_100317F30, &stru_1002C2028);
  v11.receiver = self;
  v11.super_class = (Class)GKResource;
  v3 = -[GKResource description](&v11, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  resourceID = self->_resourceID;
  v6 = (void *)qword_100317F28;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", self->_TTL));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ID: %@ TTL: %@\nitem: %@"), v4, resourceID, v8, self->_representedItem));

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSObject hash](self->_resourceID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *resourceID;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v6 = objc_opt_class(GKResource, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    resourceID = self->_resourceID;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resourceID"));
    v9 = -[NSObject isEqual:](resourceID, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_metadataLookup, "objectForKeyedSubscript:", a3);
}

- (BOOL)isExpired
{
  BOOL v3;
  void *v4;
  double v5;

  if (-[GKResource isInvalid](self, "isInvalid"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", self->_TTL));
  objc_msgSend(v4, "timeIntervalSinceNow");
  v3 = v5 <= 0.0;

  return v3;
}

- (BOOL)isInvalid
{
  return !self->_representedItem || self->_invalid;
}

- (NSObject)resourceID
{
  return self->_resourceID;
}

- (void)setResourceID:(id)a3
{
  objc_storeStrong((id *)&self->_resourceID, a3);
}

- (id)representedItem
{
  return self->_representedItem;
}

- (void)setRepresentedItem:(id)a3
{
  objc_storeStrong(&self->_representedItem, a3);
}

- (double)TTL
{
  return self->_TTL;
}

- (void)setTTL:(double)a3
{
  self->_TTL = a3;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (NSMutableDictionary)metadataLookup
{
  return self->_metadataLookup;
}

- (void)setMetadataLookup:(id)a3
{
  objc_storeStrong((id *)&self->_metadataLookup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_representedItem, 0);
  objc_storeStrong((id *)&self->_resourceID, 0);
  objc_storeStrong((id *)&self->_metadataLookup, 0);
}

+ (id)resourceForPlayer:(id)a3
{
  return _objc_msgSend(a1, "resourceForPlayer:TTL:", a3, 0.0);
}

+ (id)resourceForPlayer:(id)a3 TTL:(double)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v8 = (void *)objc_opt_class(a1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playerID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resourceWithID:representedItem:TTL:", v9, v6, a4));

  return v10;
}

@end
