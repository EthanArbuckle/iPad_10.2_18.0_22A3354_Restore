@implementation PCLockscreenControlsDevice

- (PCLockscreenControlsDevice)initWithMediaRouteID:(id)a3 distance:(id)a4
{
  id v7;
  id v8;
  PCLockscreenControlsDevice *v9;
  PCLockscreenControlsDevice *v10;
  PCLockscreenControlsDevice *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PCLockscreenControlsDevice;
  v9 = -[PCLockscreenControlsDevice init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaRouteID, a3);
    objc_storeStrong((id *)&v10->_distance, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PCLockscreenControlsDevice mrID=%@ dist=%@"), self->_mediaRouteID, self->_distance);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSNumber *distance;
  NSString *mediaRouteID;
  id v7;

  v4 = a3;
  distance = self->_distance;
  v7 = v4;
  if (distance)
  {
    objc_msgSend(v4, "encodeObject:forKey:", distance, CFSTR("dist"));
    v4 = v7;
  }
  mediaRouteID = self->_mediaRouteID;
  if (mediaRouteID)
  {
    objc_msgSend(v7, "encodeObject:forKey:", mediaRouteID, CFSTR("mrID"));
    v4 = v7;
  }

}

- (PCLockscreenControlsDevice)initWithCoder:(id)a3
{
  id v4;
  PCLockscreenControlsDevice *v5;
  id v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCLockscreenControlsDevice;
  v5 = -[PCLockscreenControlsDevice init](&v9, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

  }
  return v5;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
  objc_storeStrong((id *)&self->_distance, a3);
}

- (NSString)mediaRouteID
{
  return self->_mediaRouteID;
}

- (void)setMediaRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRouteID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRouteID, 0);
  objc_storeStrong((id *)&self->_distance, 0);
}

@end
