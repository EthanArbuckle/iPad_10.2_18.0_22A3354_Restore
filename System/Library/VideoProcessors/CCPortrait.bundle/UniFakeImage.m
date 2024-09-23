@implementation UniFakeImage

- (UniFakeImage)initWithCIImage:(id)a3 format:(unint64_t)a4
{
  const char *v5;
  UniFakeImage *v6;
  void *v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UniFakeImage;
  v6 = -[UniImage initWithCIImage:](&v10, sel_initWithCIImage_, a3);
  if (v6)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v5, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFakeFormat_(v6, v8, (uint64_t)v7);

  }
  return v6;
}

+ (id)imageWithCIImage:(id)a3 format:(unint64_t)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;

  v5 = a3;
  v6 = objc_alloc((Class)objc_opt_class());
  v8 = (void *)objc_msgSend_initWithCIImage_format_(v6, v7, (uint64_t)v5, a4);

  return v8;
}

- (NSNumber)fakeFormat
{
  return self->fakeFormat;
}

- (void)setFakeFormat:(id)a3
{
  objc_storeStrong((id *)&self->fakeFormat, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fakeFormat, 0);
}

@end
