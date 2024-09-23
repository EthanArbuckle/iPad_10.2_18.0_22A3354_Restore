@implementation BRCServerZoneHealthState

- (BRCServerZoneHealthState)initWithCKInfo:(id)a3 state:(int)a4
{
  id v7;
  BRCServerZoneHealthState *v8;
  BRCServerZoneHealthState *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCServerZoneHealthState;
  v8 = -[BRCServerZoneHealthState init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_ckInfo, a3);
    v9->_state = a4;
  }

  return v9;
}

- (BRCServerZoneHealthState)initWithServerZoneHealthState:(id)a3
{
  id v4;
  BRCServerZoneHealthState *v5;
  BRCServerZoneHealthState *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCServerZoneHealthState;
  v5 = -[BRCServerZoneHealthState init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_ckInfo, *((id *)v4 + 2));
    v6->_state = *((_DWORD *)v4 + 2);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithServerZoneHealthState:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRCServerZoneHealthState)initWithCoder:(id)a3
{
  id v4;
  BRCServerZoneHealthState *v5;
  uint64_t v6;
  BRFieldCKInfo *ckInfo;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCServerZoneHealthState;
  v5 = -[BRCServerZoneHealthState init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ckinfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    ckInfo = v5->_ckInfo;
    v5->_ckInfo = (BRFieldCKInfo *)v6;

    v5->_state = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("state"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BRFieldCKInfo *ckInfo;
  id v5;

  ckInfo = self->_ckInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", ckInfo, CFSTR("ckinfo"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_state, CFSTR("state"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t state;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BRFieldCKInfo etag](self->_ckInfo, "etag");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  state = self->_state;
  if (state > 2)
    v7 = CFSTR("unknown");
  else
    v7 = off_24FE47C50[state];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("zone-health{etag:%@,state:%@}"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BRFieldCKInfo)ckInfo
{
  return self->_ckInfo;
}

- (int)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckInfo, 0);
}

@end
