@implementation VisionCoreLabeledConfidencesDescriptor

- (VisionCoreLabeledConfidencesDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 shape:(id)a5 strides:(id)a6 labelsFileURL:(id)a7
{
  id v13;
  VisionCoreLabeledConfidencesDescriptor *v14;
  VisionCoreLabeledConfidencesDescriptor *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)VisionCoreLabeledConfidencesDescriptor;
  v14 = -[VisionCoreTensorDescriptor initWithName:dataType:shape:strides:](&v17, sel_initWithName_dataType_shape_strides_, a3, a4, a5, a6);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_labelsFileURL, a7);

  return v15;
}

- (Class)labelsFileParserClass
{
  return (Class)objc_opt_class();
}

- (NSArray)labels
{
  VisionCoreLabeledConfidencesDescriptor *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[VisionCoreLabeledConfidencesDescriptor _parseLabelsFileWhenSynchronizedIfNecessary](v2);
  v3 = v2->_lazilyAcquiredLabels;
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)validLabelsCount
{
  VisionCoreLabeledConfidencesDescriptor *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  -[VisionCoreLabeledConfidencesDescriptor _parseLabelsFileWhenSynchronizedIfNecessary](v2);
  v3 = -[NSIndexSet count](v2->_lazilyAcquiredValidLabelIndexs, "count");
  objc_sync_exit(v2);

  return v3;
}

- (NSIndexSet)validLabelIndexes
{
  VisionCoreLabeledConfidencesDescriptor *v2;
  NSIndexSet *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[VisionCoreLabeledConfidencesDescriptor _parseLabelsFileWhenSynchronizedIfNecessary](v2);
  v3 = v2->_lazilyAcquiredValidLabelIndexs;
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)sortedValidLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[VisionCoreLabeledConfidencesDescriptor labels](self, "labels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreLabeledConfidencesDescriptor validLabelIndexes](self, "validLabelIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VisionCoreLabeledConfidencesDescriptor;
  -[VisionCoreTensorDescriptor description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreLabeledConfidencesDescriptor labelsFileURL](self, "labelsFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VisionCoreLabeledConfidencesDescriptor;
  v3 = -[VisionCoreTensorDescriptor hash](&v7, sel_hash);
  -[VisionCoreLabeledConfidencesDescriptor labelsFileURL](self, "labelsFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreLabeledConfidencesDescriptor *v4;
  VisionCoreLabeledConfidencesDescriptor *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (VisionCoreLabeledConfidencesDescriptor *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VisionCoreLabeledConfidencesDescriptor labelsFileURL](self, "labelsFileURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreLabeledConfidencesDescriptor labelsFileURL](v5, "labelsFileURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VisionCoreLabeledConfidencesDescriptor;
  v4 = a3;
  -[VisionCoreTensorDescriptor encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[VisionCoreLabeledConfidencesDescriptor labelsFileURL](self, "labelsFileURL", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("labelsURL"));

}

- (VisionCoreLabeledConfidencesDescriptor)initWithCoder:(id)a3
{
  id v4;
  VisionCoreLabeledConfidencesDescriptor *v5;
  uint64_t v6;
  NSURL *labelsFileURL;
  VisionCoreLabeledConfidencesDescriptor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VisionCoreLabeledConfidencesDescriptor;
  v5 = -[VisionCoreTensorDescriptor initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("labelsURL")),
        v6 = objc_claimAutoreleasedReturnValue(),
        labelsFileURL = v5->_labelsFileURL,
        v5->_labelsFileURL = (NSURL *)v6,
        labelsFileURL,
        !v5->_labelsFileURL))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (NSURL)labelsFileURL
{
  return self->_labelsFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazilyAcquiredValidLabelIndexs, 0);
  objc_storeStrong((id *)&self->_lazilyAcquiredLabels, 0);
  objc_storeStrong((id *)&self->_labelsFileURL, 0);
}

- (void)_parseLabelsFileWhenSynchronizedIfNecessary
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;

  if (a1 && !a1[6])
  {
    objc_msgSend(a1, "labelsFileURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(a1, "labelsFileParserClass");
    v33 = 0;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v32 = 0;
    v5 = objc_msgSend(v3, "parseLabels:fromContentsOfURL:invalidLabelPlaceholderObject:validLabelIndexes:error:", &v33, v2, v4, &v32, &v31);
    v6 = v33;
    v7 = v32;
    v8 = v31;

    if (v5)
    {
      objc_msgSend(a1, "shape");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "elementCount");

      v11 = objc_msgSend(v6, "count");
      if (v10 == v11)
      {
LABEL_8:
        v26 = objc_msgSend(v6, "copy");
        v27 = (void *)a1[6];
        a1[6] = v26;

        v28 = objc_msgSend(v7, "copy");
        v29 = (void *)a1[7];
        a1[7] = v28;

        return;
      }
      VisionCoreValidatedLog(v11, (uint64_t)CFSTR("%@ does not have the expected total label count of %lu"), v12, v13, v14, v15, v16, v17, (uint64_t)v2);
    }
    else
    {
      objc_msgSend(v8, "localizedDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      VisionCoreValidatedLog((uint64_t)v30, (uint64_t)CFSTR("Could not obtain labels from %@ - %@"), v18, v19, v20, v21, v22, v23, (uint64_t)v2);

    }
    v24 = objc_alloc_init(MEMORY[0x24BDBCE30]);

    v25 = objc_alloc_init(MEMORY[0x24BDD15E0]);
    v7 = v25;
    v6 = v24;
    goto LABEL_8;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
