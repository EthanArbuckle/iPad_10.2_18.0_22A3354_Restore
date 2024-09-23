@implementation CLPrefetchFloorRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevancy, 0);
  objc_storeStrong((id *)&self->_venueUuid, 0);
  objc_storeStrong((id *)&self->_floorUuid, 0);
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  CLPrefetchFloorRequest *v17;
  CLPrefetchFloorRequest *v18;
  objc_super v20;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CLPrefetchFloorRequest;
  v17 = -[CLPrefetchFloorRequest init](&v20, "init");
  if (v17)
    v18 = -[CLPrefetchFloorRequest initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:priority:](v17, "initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:priority:", v14, v15, v16, v10, v9, a8, 1);
  else
    v18 = 0;

  return v18;
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8 ranking:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  CLPrefetchFloorRequest *v19;
  CLPrefetchFloorRequest *v20;
  CLPrefetchFloorRequest *v21;
  objc_super v23;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CLPrefetchFloorRequest;
  v19 = -[CLPrefetchFloorRequest init](&v23, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_floorUuid, a3);
    objc_storeStrong((id *)&v20->_venueUuid, a4);
    objc_storeStrong((id *)&v20->_relevancy, a5);
    v20->_hasCompleteFloor = a6;
    v20->_allowCellularDownload = a7;
    v20->_locationContext = a8;
    v20->_priority = a9;
    v21 = v20;
  }

  return v20;
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8 priority:(int64_t)a9
{
  return -[CLPrefetchFloorRequest initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:ranking:](self, "initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:ranking:", a3, a4, a5, 0, a7, a8);
}

- (int64_t)locationContext
{
  return self->_locationContext;
}

- (NSString)venueUuid
{
  return self->_venueUuid;
}

- (NSDate)relevancy
{
  return self->_relevancy;
}

- (BOOL)allowCellularDownload
{
  return self->_allowCellularDownload;
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)hasCompleteFloor
{
  return self->_hasCompleteFloor;
}

- (NSString)floorUuid
{
  return self->_floorUuid;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)prefetchRequestForFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  CLPrefetchFloorRequest *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[CLPrefetchFloorRequest initWithFloor:inVenue:lastRelevant:locationContext:]([CLPrefetchFloorRequest alloc], "initWithFloor:inVenue:lastRelevant:locationContext:", v9, v10, v11, a6);

  return v12;
}

- (CLPrefetchFloorRequest)init
{
  -[CLPrefetchFloorRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  abort();
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6
{
  return -[CLPrefetchFloorRequest initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:](self, "initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:", a3, a4, a5, 0, 1, a6);
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6 priority:(int64_t)a7
{
  return -[CLPrefetchFloorRequest initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:ranking:](self, "initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:ranking:", a3, a4, a5, 0, 1, a6, a7);
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6 ranking:(int64_t)a7
{
  return -[CLPrefetchFloorRequest initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:ranking:](self, "initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:ranking:", a3, a4, a5, 0, 1, a6, a7);
}

- (CLPrefetchFloorRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  CLPrefetchFloorRequest *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("floorUuid")));
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("floorUuid")));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("venueUuid")));
  if (v6)
    v7 = (__CFString *)v6;
  else
    v7 = CFSTR("mismatch between pipelined/CoreIndoor.framework");
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("relevancy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v9 = -[CLPrefetchFloorRequest initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:priority:](self, "initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:priority:", v5, v7, v8, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCompleteFloor")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowCellularDownload")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationContext")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priority")));

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_floorUuid, CFSTR("floorUuid"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_floorUuid, CFSTR("floorUuid"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_venueUuid, CFSTR("venueUuid"));
  -[NSDate timeIntervalSinceReferenceDate](self->_relevancy, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("relevancy"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasCompleteFloor, CFSTR("hasCompleteFloor"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowCellularDownload, CFSTR("allowCellularDownload"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_locationContext, CFSTR("locationContext"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_priority, CFSTR("priority"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int8 v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = -[NSString isEqualToString:](self->_floorUuid, "isEqualToString:", v4);
  else
    v6 = -[CLPrefetchFloorRequest isEqualToRequest:](self, "isEqualToRequest:", v4);
  v7 = v6;

  return v7;
}

- (BOOL)isEqualToRequest:(id)a3
{
  NSString *floorUuid;
  void *v4;

  floorUuid = self->_floorUuid;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "floorUuid"));
  LOBYTE(floorUuid) = -[NSString isEqualToString:](floorUuid, "isEqualToString:", v4);

  return (char)floorUuid;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_floorUuid, "hash");
}

- (id)description
{
  return self->_floorUuid;
}

- (id)floorUid
{
  return self->_floorUuid;
}

- (void)setFloorUid:(id)a3
{
  objc_storeStrong((id *)&self->_floorUuid, a3);
}

- (void)setFloorUuid:(id)a3
{
  objc_storeStrong((id *)&self->_floorUuid, a3);
}

- (void)setVenueUuid:(id)a3
{
  objc_storeStrong((id *)&self->_venueUuid, a3);
}

- (void)setRelevancy:(id)a3
{
  objc_storeStrong((id *)&self->_relevancy, a3);
}

- (void)setHasCompleteFloor:(BOOL)a3
{
  self->_hasCompleteFloor = a3;
}

- (void)setAllowCellularDownload:(BOOL)a3
{
  self->_allowCellularDownload = a3;
}

- (void)setLocationContext:(int64_t)a3
{
  self->_locationContext = a3;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

@end
