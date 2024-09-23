@implementation MSUiBootHeaderV1

- (id)packStructure
{
  _DWORD v4[2];

  v4[0] = -[MSUiBootHeader headerGeneration](self, "headerGeneration");
  v4[1] = -[MSUiBootHeaderV1 valid](self, "valid");
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v4, 8);
}

- (BOOL)loadHeaderAtOffset:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  id v6;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = 0;
  v5 = -[IOServiceWriter readDataAtOffset:ofLength:](-[MSUiBootHeader serviceWriter](self, "serviceWriter"), "readDataAtOffset:ofLength:", *(_QWORD *)&a3, 8);
  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    objc_msgSend(v5, "getBytes:length:", &v8, 8);
    -[MSUiBootHeader setHeaderGeneration:](self, "setHeaderGeneration:", v8);
    -[MSUiBootHeaderV1 setValid:](self, "setValid:", HIDWORD(v8));
    -[MSUiBootHeader setStartLocation:](self, "setStartLocation:", v3);
    -[MSUiBootHeader setImageAddress:](self, "setImageAddress:", 0);
  }
  return v6 != 0;
}

- (void)invalidate
{
  -[MSUiBootHeaderV1 setValid:](self, "setValid:", 0xFFFFFFFFLL);
}

- (void)setAsFirstGeneration
{
  -[MSUiBootHeader setHeaderGeneration:](self, "setHeaderGeneration:", 1);
}

- (void)makeValid
{
  -[MSUiBootHeaderV1 setValid:](self, "setValid:", 1);
}

- (unsigned)length
{
  return 8;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Generation: 0x%08x. Valid: 0x%08x. HeaderStart: 0x%08x. PayloadAddress: 0x%08x"), -[MSUiBootHeader headerGeneration](self, "headerGeneration"), -[MSUiBootHeaderV1 valid](self, "valid"), -[MSUiBootHeader startLocation](self, "startLocation"), -[MSUiBootHeader imageAddress](self, "imageAddress"));
}

- (BOOL)isValid
{
  return -[MSUiBootHeaderV1 valid](self, "valid") != -1 && -[MSUiBootHeaderV1 valid](self, "valid") != 0;
}

- (int64_t)compareTo:(id)a3
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;

  if (-[MSUiBootHeaderV1 valid](self, "valid") == -1 && -[MSUiBootHeader headerGeneration](self, "headerGeneration"))
  {
    v6 = -[MSUiBootHeader headerGeneration](self, "headerGeneration");
    if (v6 > objc_msgSend(a3, "headerGeneration") || (objc_msgSend(a3, "isValid") & 1) == 0)
      return 1;
    goto LABEL_11;
  }
  if (objc_msgSend(a3, "valid") != -1 || !objc_msgSend(a3, "headerGeneration"))
    return 0;
  v13 = objc_msgSend(a3, "headerGeneration");
  if (v13 <= -[MSUiBootHeader headerGeneration](self, "headerGeneration")
    && -[MSUiBootHeaderV1 isValid](self, "isValid"))
  {
LABEL_11:
    iBU_LOG_real((uint64_t)CFSTR("Found a prepared header with a smaller generation than the valid header."), "-[MSUiBootHeaderV1 compareTo:]", v7, v8, v9, v10, v11, v12, v14);
    return 0;
  }
  return -1;
}

- (unsigned)valid
{
  return self->_valid;
}

- (void)setValid:(unsigned int)a3
{
  self->_valid = a3;
}

@end
