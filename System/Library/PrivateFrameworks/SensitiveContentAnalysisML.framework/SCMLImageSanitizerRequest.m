@implementation SCMLImageSanitizerRequest

- (SCMLImageSanitizerRequest)initWithPixelBuffer:(__CVBuffer *)a3
{
  SCMLImageSanitizerRequest *v4;
  SCMLImageSanitizerRequest *v5;
  NSArray *embeddings;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCMLImageSanitizerRequest;
  v4 = -[SCMLImageSanitizerRequest init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_keepGoing = 0;
    embeddings = v4->_embeddings;
    v4->_pixelBuffer = a3;
    v4->_embeddings = 0;

    v5->_style = 0;
  }
  return v5;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (BOOL)keepGoing
{
  return self->_keepGoing;
}

- (void)setKeepGoing:(BOOL)a3
{
  self->_keepGoing = a3;
}

- (NSArray)embeddings
{
  return self->_embeddings;
}

- (void)setEmbeddings:(id)a3
{
  objc_storeStrong((id *)&self->_embeddings, a3);
}

- (unsigned)style
{
  return self->_style;
}

- (void)setStyle:(unsigned int)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddings, 0);
}

@end
