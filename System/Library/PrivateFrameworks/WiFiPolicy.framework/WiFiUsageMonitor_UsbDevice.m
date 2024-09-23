@implementation WiFiUsageMonitor_UsbDevice

- (unint64_t)controllerID
{
  return self->_locationID >> 24;
}

- (WiFiUsageMonitor_UsbDevice)initWithName:(id)a3 vid:(unint64_t)a4 isApple:(BOOL)a5 locationID:(unint64_t)a6
{
  _BOOL8 v7;
  id v9;
  WiFiUsageMonitor_UsbDevice *v10;
  objc_super v12;

  v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)WiFiUsageMonitor_UsbDevice;
  v9 = a3;
  v10 = -[WiFiUsageMonitor_UsbDevice init](&v12, sel_init);
  -[WiFiUsageMonitor_UsbDevice setName:](v10, "setName:", v9, v12.receiver, v12.super_class);

  -[WiFiUsageMonitor_UsbDevice setVid:](v10, "setVid:", a4);
  -[WiFiUsageMonitor_UsbDevice setVidIsApple:](v10, "setVidIsApple:", v7);
  -[WiFiUsageMonitor_UsbDevice setLocationID:](v10, "setLocationID:", a6);
  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)vid
{
  return self->_vid;
}

- (void)setVid:(unint64_t)a3
{
  self->_vid = a3;
}

- (BOOL)vidIsApple
{
  return self->_vidIsApple;
}

- (void)setVidIsApple:(BOOL)a3
{
  self->_vidIsApple = a3;
}

- (unint64_t)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(unint64_t)a3
{
  self->_locationID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
