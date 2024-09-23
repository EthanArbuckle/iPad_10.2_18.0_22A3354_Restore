@implementation TUEmergencyMediaItem

- (TUEmergencyMediaItem)initWithMediaItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  TUEmergencyMediaItem *v7;

  v4 = a3;
  objc_msgSend(v4, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "emergencyMediaType");

  v7 = -[TUEmergencyMediaItem initWithAssetId:mediaType:](self, "initWithAssetId:mediaType:", v5, v6);
  return v7;
}

- (TUEmergencyMediaItem)initWithAssetId:(id)a3
{
  return -[TUEmergencyMediaItem initWithAssetId:mediaType:](self, "initWithAssetId:mediaType:", a3, 0);
}

- (TUEmergencyMediaItem)initWithAssetId:(id)a3 mediaType:(int64_t)a4
{
  id v6;
  TUEmergencyMediaItem *v7;
  uint64_t v8;
  NSString *assetId;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUEmergencyMediaItem;
  v7 = -[TUEmergencyMediaItem init](&v11, sel_init);
  if (v7)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUEmergencyMediaItem initWithAssetId:mediaType:]", CFSTR("assetId"));
    v8 = objc_msgSend(v6, "copy");
    assetId = v7->_assetId;
    v7->_assetId = (NSString *)v8;

    v7->_emergencyMediaType = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUEmergencyMediaItem initWithMediaItem:](+[TUEmergencyMediaItem allocWithZone:](TUEmergencyMediaItem, "allocWithZone:", a3), "initWithMediaItem:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *assetId;
  id v5;
  void *v6;
  int64_t emergencyMediaType;
  id v8;

  assetId = self->_assetId;
  v5 = a3;
  NSStringFromSelector(sel_assetId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", assetId, v6);

  emergencyMediaType = self->_emergencyMediaType;
  NSStringFromSelector(sel_emergencyMediaType);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", emergencyMediaType, v8);

}

- (TUEmergencyMediaItem)initWithCoder:(id)a3
{
  id v4;
  TUEmergencyMediaItem *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *assetId;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUEmergencyMediaItem;
  v5 = -[TUEmergencyMediaItem init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_assetId);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v8;

    NSStringFromSelector(sel_emergencyMediaType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_emergencyMediaType = objc_msgSend(v4, "decodeIntegerForKey:", v10);

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_assetId);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUEmergencyMediaItem assetId](self, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  NSStringFromSelector(sel_emergencyMediaType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%ld"), v6, -[TUEmergencyMediaItem emergencyMediaType](self, "emergencyMediaType"));

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[TUEmergencyMediaItem assetId](self, "assetId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[TUEmergencyMediaItem emergencyMediaType](self, "emergencyMediaType") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  TUEmergencyMediaItem *v4;
  BOOL v5;

  v4 = (TUEmergencyMediaItem *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUEmergencyMediaItem isEqualToMediaItem:](self, "isEqualToMediaItem:", v4);
  }

  return v5;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  BOOL v8;

  v4 = a3;
  -[TUEmergencyMediaItem assetId](self, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    v7 = -[TUEmergencyMediaItem emergencyMediaType](self, "emergencyMediaType");
    v8 = v7 == objc_msgSend(v4, "emergencyMediaType");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (int64_t)emergencyMediaType
{
  return self->_emergencyMediaType;
}

- (void)setEmergencyMediaType:(int64_t)a3
{
  self->_emergencyMediaType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetId, 0);
}

@end
