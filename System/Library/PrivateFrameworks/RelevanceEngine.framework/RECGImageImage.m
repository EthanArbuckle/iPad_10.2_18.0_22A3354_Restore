@implementation RECGImageImage

- (RECGImageImage)initWithImage:(CGImage *)a3 scale:(double)a4
{
  RECGImageImage *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RECGImageImage;
  v6 = -[RECGImageImage init](&v8, sel_init);
  if (v6)
  {
    v6->_CGImage = CGImageCreateCopy(a3);
    v6->_scale = a4;
  }
  return v6;
}

- (void)dealloc
{
  CGImage *CGImage;
  objc_super v4;

  CGImage = self->_CGImage;
  if (CGImage)
    CGImageRelease(CGImage);
  v4.receiver = self;
  v4.super_class = (Class)RECGImageImage;
  -[RECGImageImage dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithImage:scale:", self->_CGImage, self->_scale);
}

- (unint64_t)hash
{
  unint64_t scale;

  scale = (unint64_t)self->_scale;
  return CFHash(self->_CGImage) ^ scale;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  double v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_retainAutorelease(v4);
    if ((CGImage *)objc_msgSend(v5, "CGImage") == self->_CGImage)
    {
      objc_msgSend(v5, "scale");
      *(float *)&v7 = v7 - self->_scale;
      v6 = fabsf(*(float *)&v7) < 0.00000011921;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (RECGImageImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  const __CFData *v6;
  CGDataProvider *v7;
  CGImageRef v8;
  RECGImageImage *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image-data"));
  v6 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  v7 = CGDataProviderCreateWithCFData(v6);
  v8 = CGImageCreateWithPNGDataProvider(v7, 0, 0, kCGRenderingIntentDefault);
  CFAutorelease(v8);
  CFRelease(v7);
  objc_msgSend(v5, "doubleValue");
  v9 = -[RECGImageImage initWithImage:scale:](self, "initWithImage:scale:", v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  __CFData *v5;
  __CFString *v6;
  CGImageDestination *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_scale);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("scale"));

  v5 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = CGImageDestinationCreateWithData(v5, v6, 0, 0);

  CGImageDestinationAddImage(v7, self->_CGImage, 0);
  if (CGImageDestinationFinalize(v7))
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("image-data"));
  CFRelease(v7);

}

- (CGImage)CGImage
{
  return self->_CGImage;
}

- (double)scale
{
  return self->_scale;
}

@end
