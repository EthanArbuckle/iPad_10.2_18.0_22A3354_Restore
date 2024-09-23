@implementation PNPromoterFaceGroup

- (PNPromoterFaceGroup)initWithGroupIdentifier:(id)a3 andFaceIdentifiers:(id)a4
{
  id v7;
  id v8;
  PNPromoterFaceGroup *v9;
  PNPromoterFaceGroup *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PNPromoterFaceGroup;
  v9 = -[PNPromoterFaceGroup init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_groupIdentifier, a3);
    objc_storeStrong((id *)&v10->_faceIdentifiers, a4);
  }

  return v10;
}

- (NSString)localIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), self->_groupIdentifier);
}

- (unint64_t)faceCountInFaceGroup
{
  return -[NSArray count](self->_faceIdentifiers, "count");
}

- (BOOL)isDirty
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIdentifiers, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
