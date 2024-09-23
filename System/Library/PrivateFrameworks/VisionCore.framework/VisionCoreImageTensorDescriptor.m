@implementation VisionCoreImageTensorDescriptor

- (unsigned)pixelFormatType
{
  return self->_pixelFormatType;
}

- (VisionCoreImageTensorDescriptor)initWithName:(id)a3 pixelFormatType:(unsigned int)a4 pixelWidth:(unint64_t)a5 pixelHeight:(unint64_t)a6
{
  uint64_t v8;
  id v10;
  uint64_t v11;
  VisionCoreTensorShape *v12;
  VisionCoreImageTensorDescriptor *v13;
  unint64_t v14;
  objc_super v16;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  if ((int)v8 <= 1278226487)
  {
    if ((int)v8 <= 39)
    {
      if ((_DWORD)v8 == 8)
        goto LABEL_19;
      if ((_DWORD)v8 == 32)
        goto LABEL_18;
    }
    else
    {
      if ((_DWORD)v8 == 40)
        goto LABEL_19;
      if ((_DWORD)v8 == 1094862674 || (_DWORD)v8 == 1111970369)
        goto LABEL_18;
    }
LABEL_21:
    v11 = 0;
    goto LABEL_22;
  }
  if ((int)v8 <= 1380401728)
  {
    if ((_DWORD)v8 != 1278226488)
    {
      if ((_DWORD)v8 == 1278226534)
      {
        v11 = 983072;
        goto LABEL_22;
      }
      if ((_DWORD)v8 == 1278226536)
      {
        v11 = 983056;
        goto LABEL_22;
      }
      goto LABEL_21;
    }
LABEL_19:
    v11 = 983048;
    goto LABEL_22;
  }
  if ((_DWORD)v8 == 1380401729)
  {
LABEL_18:
    v11 = 196640;
    goto LABEL_22;
  }
  v11 = 65600;
  if ((_DWORD)v8 != 1647719521 && (_DWORD)v8 != 1815491698)
    goto LABEL_21;
LABEL_22:
  v12 = -[VisionCoreTensorShape initWithPixelFormatType:width:height:]([VisionCoreTensorShape alloc], "initWithPixelFormatType:width:height:", v8, a5, a6);
  v16.receiver = self;
  v16.super_class = (Class)VisionCoreImageTensorDescriptor;
  v13 = -[VisionCoreTensorDescriptor initWithName:dataType:shape:strides:](&v16, sel_initWithName_dataType_shape_strides_, v10, v11, v12, 0);

  if (v13)
  {
    v13->_pixelFormatType = v8;
    v13->_pixelWidth = a5;
    v13->_pixelHeight = a6;
    if ((v8 & 0xF0000) != 0)
      v14 = ((unsigned __int16)v8 >> 3) * a5;
    else
      v14 = 0;
    v13->_bytesPerRow = v14;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VisionCoreImageTensorDescriptor;
  v3 = -[VisionCoreTensorDescriptor hash](&v8, sel_hash);
  v4 = -[VisionCoreImageTensorDescriptor pixelFormatType](self, "pixelFormatType");
  v5 = v4 ^ -[VisionCoreImageTensorDescriptor pixelWidth](self, "pixelWidth");
  v6 = v5 ^ -[VisionCoreImageTensorDescriptor pixelHeight](self, "pixelHeight");
  return v3 ^ v6 ^ -[VisionCoreImageTensorDescriptor bytesPerRow](self, "bytesPerRow");
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreImageTensorDescriptor *v4;
  VisionCoreImageTensorDescriptor *v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;

  v4 = (VisionCoreImageTensorDescriptor *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VisionCoreImageTensorDescriptor pixelFormatType](self, "pixelFormatType");
      if (v6 == -[VisionCoreImageTensorDescriptor pixelFormatType](v5, "pixelFormatType")
        && (v7 = -[VisionCoreImageTensorDescriptor pixelWidth](self, "pixelWidth"),
            v7 == -[VisionCoreImageTensorDescriptor pixelWidth](v5, "pixelWidth"))
        && (v8 = -[VisionCoreImageTensorDescriptor pixelHeight](self, "pixelHeight"),
            v8 == -[VisionCoreImageTensorDescriptor pixelHeight](v5, "pixelHeight")))
      {
        v9 = -[VisionCoreImageTensorDescriptor bytesPerRow](self, "bytesPerRow");
        v10 = v9 == -[VisionCoreImageTensorDescriptor bytesPerRow](v5, "bytesPerRow");
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)VisionCoreImageTensorDescriptor;
  -[VisionCoreTensorDescriptor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VisionCoreFourCharCodeToString(-[VisionCoreImageTensorDescriptor pixelFormatType](self, "pixelFormatType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ %lu x %lu"), v4, v5, -[VisionCoreImageTensorDescriptor pixelWidth](self, "pixelWidth"), -[VisionCoreImageTensorDescriptor pixelHeight](self, "pixelHeight"));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VisionCoreTensorDescriptor name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("name"));

  objc_msgSend(v5, "encodeInt32:forKey:", -[VisionCoreImageTensorDescriptor pixelFormatType](self, "pixelFormatType"), CFSTR("pixelFormat"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[VisionCoreImageTensorDescriptor pixelWidth](self, "pixelWidth"), CFSTR("w"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[VisionCoreImageTensorDescriptor pixelHeight](self, "pixelHeight"), CFSTR("h"));

}

- (VisionCoreImageTensorDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  VisionCoreImageTensorDescriptor *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[VisionCoreImageTensorDescriptor initWithName:pixelFormatType:pixelWidth:pixelHeight:](self, "initWithName:pixelFormatType:pixelWidth:pixelHeight:", v5, objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pixelFormat")), (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("w")), (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("h")));
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VisionCoreImageTensorDescriptor)initWithANSTPixelBufferDescriptor:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  VisionCoreImageTensorDescriptor *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "pixelFormatType");
  v6 = objc_msgSend(v4, "width");
  v7 = objc_msgSend(v4, "height");
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[VisionCoreImageTensorDescriptor initWithName:pixelFormatType:pixelWidth:pixelHeight:](self, "initWithName:pixelFormatType:pixelWidth:pixelHeight:", v8, v5, v6, v7);
  return v9;
}

- (id)E5RTExecutionContextNewIOSurfacePropertiesAndReturnError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VisionCoreImageTensorDescriptor;
  -[VisionCoreTensorDescriptor E5RTExecutionContextNewIOSurfacePropertiesAndReturnError:](&v11, sel_E5RTExecutionContextNewIOSurfacePropertiesAndReturnError_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", -[VisionCoreImageTensorDescriptor pixelWidth](self, "pixelWidth"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD8FD0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", -[VisionCoreImageTensorDescriptor pixelHeight](self, "pixelHeight"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD8EB0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", -[VisionCoreImageTensorDescriptor bytesPerRow](self, "bytesPerRow"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD8E38]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[VisionCoreImageTensorDescriptor pixelFormatType](self, "pixelFormatType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD8EF8]);

    v9 = v4;
  }

  return v4;
}

@end
