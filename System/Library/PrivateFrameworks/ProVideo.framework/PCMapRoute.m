@implementation PCMapRoute

- (PCMapRoute)initWithCoder:(id)a3
{
  PCMapRoute *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PCMapRoute;
  v4 = -[PCMapRoute init](&v6, sel_init);
  if (v4)
  {
    -[PCMapRoute setStartLocation:](v4, "setStartLocation:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startLocation")));
    -[PCMapRoute setEndLocation:](v4, "setEndLocation:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endLocation")));
    -[PCMapRoute setHasEndLocation:](v4, "setHasEndLocation:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("hasEndLocation")));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCMapRoute;
  -[PCMapRoute dealloc](&v3, sel_dealloc);
}

+ (id)decodeFromBlindChannelData:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", a3, &v6);
  v4 = (void *)objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Custom Data"));
  if (!v4)
    v4 = (void *)objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Custom Data"));
  objc_msgSend(v3, "finishDecoding");

  return v4;
}

- (id)encodeAsBlindChannelData
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeObject:forKey:", self, CFSTR("Custom Data"));
  v4 = (void *)objc_msgSend(v3, "encodedData");
  objc_msgSend(v3, "finishEncoding");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStartLocation:", (id)-[PCMapLocation copy](self->_startLocation, "copy"));
  objc_msgSend(v4, "setEndLocation:", (id)-[PCMapLocation copy](self->_endLocation, "copy"));
  objc_msgSend(v4, "setHasEndLocation:", self->_hasEndLocation);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_startLocation, CFSTR("startLocation"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_endLocation, CFSTR("endLocation"));
  if (self->_hasEndLocation)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("hasEndLocation"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCMapLocation)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (PCMapLocation)endLocation
{
  return self->_endLocation;
}

- (void)setEndLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)hasEndLocation
{
  return self->_hasEndLocation;
}

- (void)setHasEndLocation:(BOOL)a3
{
  self->_hasEndLocation = a3;
}

@end
