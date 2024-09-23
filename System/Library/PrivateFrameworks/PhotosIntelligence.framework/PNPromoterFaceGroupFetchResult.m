@implementation PNPromoterFaceGroupFetchResult

- (PNPromoterFaceGroupFetchResult)initWithFaceGroups:(id)a3
{
  id v5;
  PNPromoterFaceGroupFetchResult *v6;
  PNPromoterFaceGroupFetchResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PNPromoterFaceGroupFetchResult;
  v6 = -[PNPromoterFaceGroupFetchResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_faceGroups, a3);

  return v7;
}

- (unint64_t)count
{
  return -[NSArray count](self->_faceGroups, "count");
}

- (NSArray)fetchedObjects
{
  return self->_faceGroups;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSArray countByEnumeratingWithState:objects:count:](self->_faceGroups, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (NSArray)fetchedObjectIDs
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPromoterFaceGroup.m"), 66, CFSTR("%s not implemented"), "-[PNPromoterFaceGroupFetchResult fetchedObjectIDs]");

  abort();
}

- (PHPhotoLibrary)photoLibrary
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPromoterFaceGroup.m"), 73, CFSTR("%s not implemented"), "-[PNPromoterFaceGroupFetchResult photoLibrary]");

  abort();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceGroups, 0);
}

@end
