@implementation TCMPSImageAllocator

- (id)imageForCommandBuffer:(id)a3 imageDescriptor:(id)a4 kernel:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_format)
    objc_msgSend(v9, "setChannelFormat:");
  v11 = objc_alloc(MEMORY[0x24BDDE368]);
  objc_msgSend(v8, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithDevice:imageDescriptor:", v12, v9);

  return v13;
}

- (TCMPSImageAllocator)initWithFormat:(unint64_t)a3
{
  TCMPSImageAllocator *v4;
  TCMPSImageAllocator *v5;
  TCMPSImageAllocator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TCMPSImageAllocator;
  v4 = -[TCMPSImageAllocator init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_format = a3;
    v6 = v4;
  }

  return v5;
}

- (TCMPSImageAllocator)initWithCoder:(id)a3
{
  id v4;
  TCMPSImageAllocator *v5;
  TCMPSImageAllocator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TCMPSImageAllocator;
  v5 = -[TCMPSImageAllocator init](&v8, sel_init);
  if (v5)
  {
    v5->_format = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pixelFormat"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_format, CFSTR("pixelFormat"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
