@implementation SCROIOUSBElement

- (SCROIOUSBElement)initWithIOObject:(unsigned int)a3
{
  SCROIOUSBElement *v4;
  SCROIOUSBElement *v5;
  SCROIOUSBElement *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCROIOUSBElement;
  v4 = -[SCROIOElement initWithIOObject:](&v8, sel_initWithIOObject_);
  v5 = v4;
  if (a3 && v4 && !IOObjectConformsTo(a3, "IOUSBDevice") && !IOObjectConformsTo(a3, "IOUSBDevice"))
    v6 = 0;
  else
    v6 = v5;

  return v6;
}

- (int)transport
{
  return 1;
}

@end
