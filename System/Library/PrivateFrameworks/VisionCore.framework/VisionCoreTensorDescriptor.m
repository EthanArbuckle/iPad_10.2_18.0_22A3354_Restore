@implementation VisionCoreTensorDescriptor

- (NSString)name
{
  return self->_name;
}

- (VisionCoreTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 shape:(id)a5 strides:(id)a6
{
  id v10;
  id v11;
  VisionCoreTensorStrides *v12;
  VisionCoreTensorDescriptor *v13;
  uint64_t v14;
  NSString *name;
  VisionCoreTensorStrides *v16;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  v12 = (VisionCoreTensorStrides *)a6;
  v18.receiver = self;
  v18.super_class = (Class)VisionCoreTensorDescriptor;
  v13 = -[VisionCoreTensorDescriptor init](&v18, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v13->_dataType = a4;
    objc_storeStrong((id *)&v13->_shape, a5);
    v16 = v12;
    if (!v12)
      v16 = -[VisionCoreTensorStrides initWithShape:dataType:]([VisionCoreTensorStrides alloc], "initWithShape:dataType:", v11, a4);
    objc_storeStrong((id *)&v13->_strides, v16);
    if (!v12)

  }
  return v13;
}

- (BOOL)getByteOffset:(unint64_t *)a3 forPosition:(const unint64_t *)a4 rank:(unint64_t)a5 error:(id *)a6
{
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;

  -[VisionCoreTensorDescriptor shape](self, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "rank") == a5)
  {
    v12 = objc_retainAutorelease(v11);
    v13 = objc_msgSend(v12, "sizes");
    -[VisionCoreTensorDescriptor strides](self, "strides");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "byteOffsets");

    if (a5)
    {
      v16 = 0;
      v17 = 0;
      while (1)
      {
        v18 = a4[v16];
        if (v18 >= *(_QWORD *)(v13 + 8 * v16))
          break;
        v17 += *(_QWORD *)(v15 + 8 * v16++) * v18;
        if (a5 == v16)
          goto LABEL_10;
      }
      if (a6)
      {
        v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("A position of %lu at index %lu is out of range for a shape of %@"), a4[v16], v16, v12);
        goto LABEL_13;
      }
    }
    else
    {
      v17 = 0;
LABEL_10:
      *a3 = v17;
      LOBYTE(a6) = 1;
    }
  }
  else if (a6)
  {
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("A rank of %lu is out of range for a shape of %@"), a5, v11, v22);
LABEL_13:
    v20 = (void *)v19;
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v19);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a6) = 0;
  }

  return (char)a6;
}

- (VisionCoreTensorShape)shape
{
  return self->_shape;
}

- (unint64_t)storageByteCount
{
  void *v3;
  uint64_t v4;

  -[VisionCoreTensorDescriptor shape](self, "shape");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "elementCount");

  return ((unsigned __int16)-[VisionCoreTensorDescriptor dataType](self, "dataType") >> 3) * v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VisionCoreTensorDescriptor name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreTensorDescriptor *v4;
  VisionCoreTensorDescriptor *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;

  v4 = (VisionCoreTensorDescriptor *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VisionCoreTensorDescriptor name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreTensorDescriptor name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (!v8)
        goto LABEL_9;
      v9 = -[VisionCoreTensorDescriptor dataType](self, "dataType");
      if (v9 != -[VisionCoreTensorDescriptor dataType](v5, "dataType"))
        goto LABEL_9;
      -[VisionCoreTensorDescriptor shape](self, "shape");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreTensorDescriptor shape](v5, "shape");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
      {
        -[VisionCoreTensorDescriptor strides](self, "strides");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VisionCoreTensorDescriptor strides](v5, "strides");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

      }
      else
      {
LABEL_9:
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v10.receiver = self;
  v10.super_class = (Class)VisionCoreTensorDescriptor;
  -[VisionCoreDescriptor description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreTensorDescriptor name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromVisionCoreTensorDataType(-[VisionCoreTensorDescriptor dataType](self, "dataType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreTensorDescriptor shape](self, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ \"%@\" %@ %@"), v4, v5, v6, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dataType, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shape, CFSTR("shape"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_strides, CFSTR("strides"));

}

- (VisionCoreTensorDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  VisionCoreTensorDescriptor *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shape"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("strides"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        self = -[VisionCoreTensorDescriptor initWithName:dataType:shape:strides:](self, "initWithName:dataType:shape:strides:", v5, v6, v7, v8);
        v9 = self;
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (VisionCoreTensorStrides)strides
{
  return self->_strides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)descriptorForEspressoBlobDimensions:(id *)a3 dataType:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  __int128 v9;
  void *v10;
  void *v11;
  _OWORD v14[2];
  unint64_t var4;

  if (a3->var0)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a3->var0);
    v9 = *(_OWORD *)&a3->var2;
    v14[0] = *(_OWORD *)&a3->var0;
    v14[1] = v9;
    var4 = a3->var4;
    +[VisionCoreEspressoTensorShape shapeForBlobDimensions:](VisionCoreEspressoTensorShape, "shapeForBlobDimensions:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:dataType:shape:strides:", v8, a4, v10, 0);

    return v11;
  }
  else
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", CFSTR("name cannot be NULL"), a4);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)confidencesDescriptorWithLabelsFileURL:(id)a3 error:(id *)a4
{
  id v6;
  VisionCoreTensorDescriptor *v7;
  void *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  VisionCoreLabeledConfidencesDescriptor *v13;
  void *v14;
  void *v15;
  VisionCoreLabeledConfidencesDescriptor *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v27;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = self;
    -[VisionCoreTensorDescriptor labelsFileURL](v7, "labelsFileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v6);

    if ((v9 & 1) != 0)
      goto LABEL_17;

  }
  v10 = -[VisionCoreTensorDescriptor dataType](self, "dataType");
  v11 = v10;
  if (v10 == 65552 || v10 == 65568)
  {
    -[VisionCoreTensorDescriptor shape](self, "shape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v7 = 0;
    if (objc_msgSend(v12, "getOneDimensionalArrayDimensionIndex:error:", &v27, a4))
    {
      v13 = [VisionCoreLabeledConfidencesDescriptor alloc];
      -[VisionCoreTensorDescriptor name](self, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreTensorDescriptor strides](self, "strides");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[VisionCoreLabeledConfidencesDescriptor initWithName:dataType:shape:strides:labelsFileURL:](v13, "initWithName:dataType:shape:strides:labelsFileURL:", v14, v11, v12, v15, v6);

      v17 = objc_msgSend(v12, "elementCount");
      -[VisionCoreLabeledConfidencesDescriptor labels](v16, "labels");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19 == v17)
      {
        v7 = v16;
      }
      else
      {
        if (a4)
        {
          v23 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v6, "path");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("Labels file %@ contains %lu entries but the confidences descriptor has %lu elements"), v24, v19, v17);

          objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v25);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        v7 = 0;
      }

    }
  }
  else
  {
    if (a4)
    {
      v20 = objc_alloc(MEMORY[0x24BDD17C8]);
      NSStringFromVisionCoreTensorDataType(v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@ is not a supported confidences type"), v21);

      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v7 = 0;
  }
LABEL_17:

  return v7;
}

- (id)E5RTExecutionContextNewIOSurfacePropertiesAndReturnError:(id *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", -[VisionCoreTensorDescriptor storageByteCount](self, "storageByteCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD8E18]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unsigned __int16)-[VisionCoreTensorDescriptor dataType](self, "dataType") >> 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD8E30]);

  return v4;
}

- (BOOL)E5RTExecutionContextAssignNewTensorInstanceToNamedObjects:(id)a3 error:(id *)a4
{
  id v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  IOSurfaceRef v9;
  IOSurfaceRef v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[VisionCoreTensorDescriptor E5RTExecutionContextNewIOSurfacePropertiesAndReturnError:](self, "E5RTExecutionContextNewIOSurfacePropertiesAndReturnError:", a4);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_6;
  v9 = IOSurfaceCreate(v7);
  if (!v9)
  {
    if (!a4)
      goto LABEL_7;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Could not create IOSurfaceRef with properties %@"), v8);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidOperationWithLocalizedDescription:", v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  v10 = v9;
  -[VisionCoreTensorDescriptor name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "assignSurface:toName:error:", v10, v11, a4);

  CFRelease(v10);
LABEL_7:

  return a4 & 1;
}

- (VisionCoreTensorDescriptor)initWithANSTTensorDescriptor:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  VisionCoreTensorShape *v7;
  VisionCoreTensorStrides *v8;
  void *v9;
  VisionCoreTensorDescriptor *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "dataType");
  v6 = 131080;
  switch(v5)
  {
    case 'c':
      break;
    case 'd':
      v6 = 65600;
      break;
    case 'e':
    case 'g':
      goto LABEL_6;
    case 'f':
      v6 = 65568;
      break;
    case 'h':
      v6 = 65552;
      break;
    case 'i':
      v6 = 131104;
      break;
    default:
      if (v5 == 73)
      {
        v6 = 196640;
      }
      else if (v5 == 67)
      {
        v6 = 196616;
      }
      else
      {
LABEL_6:
        v6 = 0;
      }
      break;
  }
  v7 = -[VisionCoreTensorShape initWithBatchNumber:channels:height:width:]([VisionCoreTensorShape alloc], "initWithBatchNumber:channels:height:width:", objc_msgSend(v4, "lengthOfDimensionAt:", 0), objc_msgSend(v4, "lengthOfDimensionAt:", 1), objc_msgSend(v4, "lengthOfDimensionAt:", 2), objc_msgSend(v4, "lengthOfDimensionAt:", 3));
  v8 = -[VisionCoreTensorStrides initWithShape:dataType:]([VisionCoreTensorStrides alloc], "initWithShape:dataType:", v7, v6);
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VisionCoreTensorDescriptor initWithName:dataType:shape:strides:](self, "initWithName:dataType:shape:strides:", v9, v6, v7, v8);

  return v10;
}

@end
