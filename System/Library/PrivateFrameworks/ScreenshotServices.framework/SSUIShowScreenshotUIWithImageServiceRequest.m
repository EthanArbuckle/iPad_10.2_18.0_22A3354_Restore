@implementation SSUIShowScreenshotUIWithImageServiceRequest

+ (id)entitlement
{
  return SSUIShowScreenshotUIEntitlement;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSUIShowScreenshotUIWithImageServiceRequest;
  v4 = a3;
  -[SSUIServiceRequest encodeWithBSXPCCoder:](&v8, sel_encodeWithBSXPCCoder_, v4);
  -[SSUIShowScreenshotUIWithImageServiceRequest image](self, "image", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ss_imageSurfaceFromImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SSUIServiceRequestImage"));
  -[SSUIShowScreenshotUIWithImageServiceRequest options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SSUIServiceRequestOptions"));

}

- (SSUIShowScreenshotUIWithImageServiceRequest)initWithBSXPCCoder:(id)a3
{
  id v3;
  SSUIShowScreenshotUIWithImageServiceRequest *v4;
  void *v5;
  uint64_t v6;
  UIImage *image;
  uint64_t v8;
  SSUIServiceOptions *options;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSUIShowScreenshotUIWithImageServiceRequest;
  v3 = a3;
  v4 = -[SSUIServiceRequest initWithBSXPCCoder:](&v11, sel_initWithBSXPCCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSUIServiceRequestImage"), v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "ss_cgImageBackedImageFromImageSurface:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  image = v4->_image;
  v4->_image = (UIImage *)v6;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSUIServiceRequestOptions"));
  v8 = objc_claimAutoreleasedReturnValue();

  options = v4->_options;
  v4->_options = (SSUIServiceOptions *)v8;

  return v4;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (SSUIServiceOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
