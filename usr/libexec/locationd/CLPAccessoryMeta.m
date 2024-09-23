@implementation CLPAccessoryMeta

- (CLPAccessoryMeta)initWithAccessory:(id)a3
{
  CLPAccessoryMeta *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CLPAccessoryMeta;
    v4 = -[CLPAccessoryMeta init](&v6, "init");
    if (v4)
    {
      -[CLPAccessoryMeta setMake:](v4, "setMake:", objc_msgSend(a3, "manufacturer"));
      -[CLPAccessoryMeta setModel:](v4, "setModel:", objc_msgSend(a3, "modelNumber"));
      -[CLPAccessoryMeta setVersion:](v4, "setVersion:", objc_msgSend(a3, "firmwareRevision"));
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

@end
