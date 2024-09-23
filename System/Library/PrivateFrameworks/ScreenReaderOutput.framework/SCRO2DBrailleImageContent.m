@implementation SCRO2DBrailleImageContent

- (SCRO2DBrailleImageContent)initWithBrailleData:(id)a3 canvas:(id)a4
{
  id v5;
  SCRO2DBrailleImageContent *v6;
  uint64_t v7;
  NSData *imageData;
  SCRO2DBrailleImageContent *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCRO2DBrailleImageContent;
  v6 = -[SCRO2DBrailleImageContent init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "imageData");
    v7 = objc_claimAutoreleasedReturnValue();
    imageData = v6->_imageData;
    v6->_imageData = (NSData *)v7;

    v9 = v6;
  }

  return v6;
}

- (void)drawOnCanvas:(id)a3
{
  NSData *imageData;

  imageData = self->_imageData;
  if (imageData)
    objc_msgSend(a3, "setImageData:", imageData);
}

- (BOOL)canPanLeft
{
  return 0;
}

- (BOOL)canPanRight
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
