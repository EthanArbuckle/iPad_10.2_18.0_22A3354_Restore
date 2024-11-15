@implementation PXNewMagazineChunk

- (PXNewMagazineChunk)initWithStartY:(int64_t)a3 startIndexOfInputs:(int64_t)a4 rectsArray:(id)a5
{
  id v9;
  PXNewMagazineChunk *v10;
  PXNewMagazineChunk *v11;
  PXNewMagazineRectArray *rectsArray;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXNewMagazineChunk;
  v10 = -[PXNewMagazineChunk init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_startY = a3;
    v10->_numOfRects = objc_msgSend(v9, "count");
    objc_storeStrong((id *)&v11->_rectsArray, a5);
    v11->_startIndexOfInputs = a4;
    rectsArray = v11->_rectsArray;
    if (rectsArray)
      -[PXNewMagazineRectArray rectAtIndex:](rectsArray, "rectAtIndex:", v11->_numOfRects - 1, 0);
    v11->_height = 0;
  }

  return v11;
}

- (int64_t)startIndexOfInputs
{
  return self->_startIndexOfInputs;
}

- (int64_t)startY
{
  return self->_startY;
}

- (unint64_t)numOfRects
{
  return self->_numOfRects;
}

- (PXNewMagazineRectArray)rectsArray
{
  return self->_rectsArray;
}

- (unint64_t)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectsArray, 0);
}

@end
