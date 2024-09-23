@implementation DYGTCAMetalLayerInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYGTCAMetalLayerInfo)initWithCoder:(id)a3
{
  id v4;
  DYGTCAMetalLayerInfo *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;
  uint64_t v11;
  NSString *name;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DYGTCAMetalLayerInfo;
  v5 = -[DYGTCAMetalLayerInfo init](&v14, "init");
  if (v5)
  {
    v5->_deviceAddress = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceAddress"));
    v5->_deviceStreamRef = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceStreamRef"));
    v5->_layerAddress = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("layerAddress"));
    v5->_layerStreamRef = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("layerStreamRef"));
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("frame"));
    v5->_frame.origin.x = v6;
    v5->_frame.origin.y = v7;
    v5->_frame.size.width = v8;
    v5->_frame.size.height = v9;
    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("name"));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    name = v5->_name;
    v5->_name = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t deviceAddress;
  id v5;

  deviceAddress = self->_deviceAddress;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", deviceAddress, CFSTR("deviceAddress"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_deviceStreamRef, CFSTR("deviceStreamRef"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_layerAddress, CFSTR("layerAddress"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_layerStreamRef, CFSTR("layerStreamRef"));
  objc_msgSend(v5, "encodeRect:forKey:", CFSTR("frame"), self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));

}

- (unint64_t)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(unint64_t)a3
{
  self->_deviceAddress = a3;
}

- (unint64_t)deviceStreamRef
{
  return self->_deviceStreamRef;
}

- (void)setDeviceStreamRef:(unint64_t)a3
{
  self->_deviceStreamRef = a3;
}

- (unint64_t)layerAddress
{
  return self->_layerAddress;
}

- (void)setLayerAddress:(unint64_t)a3
{
  self->_layerAddress = a3;
}

- (unint64_t)layerStreamRef
{
  return self->_layerStreamRef;
}

- (void)setLayerStreamRef:(unint64_t)a3
{
  self->_layerStreamRef = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
