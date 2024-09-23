@implementation SIPersonDetectorData

- (SIPersonDetectorData)init
{
  SIPersonDetectorData *v2;
  NSMutableArray *v3;
  NSMutableArray *boundingBoxes;
  SIPersonDetectorData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SIPersonDetectorData;
  v2 = -[SIPersonDetectorData init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    boundingBoxes = v2->_boundingBoxes;
    v2->_boundingBoxes = v3;

    v5 = v2;
  }

  return v2;
}

- (NSMutableArray)boundingBoxes
{
  return self->_boundingBoxes;
}

- (void)setBoundingBoxes:(id)a3
{
  objc_storeStrong((id *)&self->_boundingBoxes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBoxes, 0);
}

@end
