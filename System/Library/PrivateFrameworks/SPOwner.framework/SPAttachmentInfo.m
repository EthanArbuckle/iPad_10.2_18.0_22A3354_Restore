@implementation SPAttachmentInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPAttachmentInfo *v4;
  void *v5;
  SPAttachmentInfo *v6;

  v4 = [SPAttachmentInfo alloc];
  -[SPAttachmentInfo attachedToDevice](self, "attachedToDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPAttachmentInfo initWithAttachedToDevice:](v4, "initWithAttachedToDevice:", v5);

  return v6;
}

- (SPAttachmentInfo)initWithAttachedToDevice:(id)a3
{
  id v5;
  SPAttachmentInfo *v6;
  SPAttachmentInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPAttachmentInfo;
  v6 = -[SPAttachmentInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_attachedToDevice, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_attachedToDevice, CFSTR("attachedToDevice"));
}

- (SPAttachmentInfo)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *attachedToDevice;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachedToDevice"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  attachedToDevice = self->_attachedToDevice;
  self->_attachedToDevice = v5;

  return self;
}

- (NSUUID)attachedToDevice
{
  return self->_attachedToDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachedToDevice, 0);
}

@end
