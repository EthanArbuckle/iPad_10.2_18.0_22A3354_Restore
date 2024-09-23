@implementation CRIntermediateDetectorResult

- (CRIntermediateDetectorResult)initWithNumberOfScales:(int64_t)a3
{
  CRIntermediateDetectorResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CRIntermediateDetectorResult;
  v4 = -[CRIntermediateDetectorResult init](&v18, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRIntermediateDetectorResult setPyramidScaleSize:](v4, "setPyramidScaleSize:", v5);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRIntermediateDetectorResult setPyramidScaleName:](v4, "setPyramidScaleName:", v6);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRIntermediateDetectorResult setPyramidPreIntraScaleNMSTextFeatures:](v4, "setPyramidPreIntraScaleNMSTextFeatures:", v7);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRIntermediateDetectorResult setPyramidPostIntraScaleNMSTextFeatures:](v4, "setPyramidPostIntraScaleNMSTextFeatures:", v8);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRIntermediateDetectorResult setPyramidPostInterScaleNMSTextFeatures:](v4, "setPyramidPostInterScaleNMSTextFeatures:", v9);

    if (a3)
    {
      v10 = 0;
      do
      {
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[CRIntermediateDetectorResult pyramidPreIntraScaleNMSTextFeatures](v4, "pyramidPreIntraScaleNMSTextFeatures");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:atIndexedSubscript:", v11, v10);

        v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[CRIntermediateDetectorResult pyramidPostIntraScaleNMSTextFeatures](v4, "pyramidPostIntraScaleNMSTextFeatures");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v13, v10);

        v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[CRIntermediateDetectorResult pyramidPostInterScaleNMSTextFeatures](v4, "pyramidPostInterScaleNMSTextFeatures");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:atIndexedSubscript:", v15, v10);

        ++v10;
      }
      while (a3 != v10);
    }
  }
  return v4;
}

- (NSMutableArray)pyramidPreIntraScaleNMSTextFeatures
{
  return self->_pyramidPreIntraScaleNMSTextFeatures;
}

- (void)setPyramidPreIntraScaleNMSTextFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_pyramidPreIntraScaleNMSTextFeatures, a3);
}

- (NSMutableArray)pyramidPostIntraScaleNMSTextFeatures
{
  return self->_pyramidPostIntraScaleNMSTextFeatures;
}

- (void)setPyramidPostIntraScaleNMSTextFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_pyramidPostIntraScaleNMSTextFeatures, a3);
}

- (NSMutableArray)pyramidPostInterScaleNMSTextFeatures
{
  return self->_pyramidPostInterScaleNMSTextFeatures;
}

- (void)setPyramidPostInterScaleNMSTextFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_pyramidPostInterScaleNMSTextFeatures, a3);
}

- (NSMutableArray)pyramidScaleSize
{
  return self->_pyramidScaleSize;
}

- (void)setPyramidScaleSize:(id)a3
{
  objc_storeStrong((id *)&self->_pyramidScaleSize, a3);
}

- (NSMutableArray)pyramidScaleName
{
  return self->_pyramidScaleName;
}

- (void)setPyramidScaleName:(id)a3
{
  objc_storeStrong((id *)&self->_pyramidScaleName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pyramidScaleName, 0);
  objc_storeStrong((id *)&self->_pyramidScaleSize, 0);
  objc_storeStrong((id *)&self->_pyramidPostInterScaleNMSTextFeatures, 0);
  objc_storeStrong((id *)&self->_pyramidPostIntraScaleNMSTextFeatures, 0);
  objc_storeStrong((id *)&self->_pyramidPreIntraScaleNMSTextFeatures, 0);
}

@end
