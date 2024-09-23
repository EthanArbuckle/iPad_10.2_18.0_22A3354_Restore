@implementation MSUiBootHeader

- (MSUiBootHeader)initWithIOServiceWriter:(id)a3
{
  MSUiBootHeader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSUiBootHeader;
  v4 = -[MSUiBootHeader init](&v6, "init");
  if (v4)
    v4->_serviceWriter = (IOServiceWriter *)a3;
  return v4;
}

- (id)packStructure
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  iBU_LOG_real((uint64_t)CFSTR("Unimplemented."), "-[MSUiBootHeader packStructure]", v2, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (BOOL)loadHeaderAtOffset:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  iBU_LOG_real((uint64_t)CFSTR("Unimplemented."), "-[MSUiBootHeader loadHeaderAtOffset:]", *(uint64_t *)&a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (void)writeHeaderToOffset:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  iBU_LOG_real((uint64_t)CFSTR("Unimplemented."), "-[MSUiBootHeader writeHeaderToOffset:]", *(uint64_t *)&a3, v3, v4, v5, v6, v7, v8);
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  iBU_LOG_real((uint64_t)CFSTR("Unimplemented"), "-[MSUiBootHeader invalidate]", v2, v3, v4, v5, v6, v7, v8);
}

- (void)setAsFirstGeneration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  iBU_LOG_real((uint64_t)CFSTR("Unimplemented"), "-[MSUiBootHeader setAsFirstGeneration]", v2, v3, v4, v5, v6, v7, v8);
}

- (unsigned)length
{
  return 0;
}

- (void)bumpGeneration
{
  uint64_t v3;

  if (-[MSUiBootHeader headerGeneration](self, "headerGeneration") == -1)
    v3 = 1;
  else
    v3 = -[MSUiBootHeader headerGeneration](self, "headerGeneration") + 1;
  -[MSUiBootHeader setHeaderGeneration:](self, "setHeaderGeneration:", v3);
}

- (int64_t)compareTo:(id)a3
{
  unsigned int v5;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = -[MSUiBootHeader headerGeneration](self, "headerGeneration");
  if (v5 < objc_msgSend(a3, "headerGeneration"))
    return -1;
  v7 = -[MSUiBootHeader headerGeneration](self, "headerGeneration");
  if (v7 > objc_msgSend(a3, "headerGeneration"))
    return 1;
  iBU_LOG_real((uint64_t)CFSTR("Found two headers with the same generation count."), "-[MSUiBootHeader compareTo:]", v8, v9, v10, v11, v12, v13, v14);
  return 0;
}

- (BOOL)isValid
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSUiBootHeader;
  -[MSUiBootHeader dealloc](&v3, "dealloc");
}

- (unsigned)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(unsigned int)a3
{
  self->_startLocation = a3;
}

- (unsigned)imageAddress
{
  return self->_imageAddress;
}

- (void)setImageAddress:(unsigned int)a3
{
  self->_imageAddress = a3;
}

- (IOServiceWriter)serviceWriter
{
  return (IOServiceWriter *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServiceWriter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)headerGeneration
{
  return self->_headerGeneration;
}

- (void)setHeaderGeneration:(unsigned int)a3
{
  self->_headerGeneration = a3;
}

@end
