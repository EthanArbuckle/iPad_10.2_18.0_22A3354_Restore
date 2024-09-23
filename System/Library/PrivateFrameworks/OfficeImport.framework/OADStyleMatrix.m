@implementation OADStyleMatrix

- (OADStyleMatrix)init
{
  OADStyleMatrix *v2;
  NSMutableArray *v3;
  NSMutableArray *mFills;
  NSMutableArray *v5;
  NSMutableArray *mStrokes;
  NSMutableArray *v7;
  NSMutableArray *mEffects;
  NSMutableArray *v9;
  NSMutableArray *mBgFills;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)OADStyleMatrix;
  v2 = -[OADStyleMatrix init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mFills = v2->mFills;
    v2->mFills = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mStrokes = v2->mStrokes;
    v2->mStrokes = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mEffects = v2->mEffects;
    v2->mEffects = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mBgFills = v2->mBgFills;
    v2->mBgFills = v9;

  }
  return v2;
}

- (void)addFill:(id)a3
{
  -[NSMutableArray addObject:](self->mFills, "addObject:", a3);
}

- (void)addStroke:(id)a3
{
  -[NSMutableArray addObject:](self->mStrokes, "addObject:", a3);
}

- (void)addEffects:(id)a3
{
  -[NSMutableArray addObject:](self->mEffects, "addObject:", a3);
}

- (void)addBgFill:(id)a3
{
  -[NSMutableArray addObject:](self->mBgFills, "addObject:", a3);
}

- (id)strokeAtIndex:(unint64_t)a3
{
  unint64_t v3;
  NSMutableArray *mStrokes;
  unint64_t v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = a3 - 1000;
    if (a3 <= 0x3E8)
      v3 = a3;
    mStrokes = self->mStrokes;
    v5 = v3 - 1;
    +[OADStroke blackStroke](OADStroke, "blackStroke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OADStyleMatrix objectInArray:withPossiblyOutOfRangeIndex:defaultValue:](OADStyleMatrix, "objectInArray:withPossiblyOutOfRangeIndex:defaultValue:", mStrokes, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)objectInArray:(id)a3 withPossiblyOutOfRangeIndex:(unint64_t)a4 defaultValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "count") <= a4)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)fillAtIndex:(unint64_t)a3
{
  void *v3;
  NSMutableArray *mFills;
  unint64_t v5;
  void *v6;

  if (a3)
  {
    if (a3 < 0x3E9)
    {
      mFills = self->mFills;
      v5 = a3 - 1;
      +[OADSolidFill whiteFill](OADSolidFill, "whiteFill");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[OADStyleMatrix objectInArray:withPossiblyOutOfRangeIndex:defaultValue:](OADStyleMatrix, "objectInArray:withPossiblyOutOfRangeIndex:defaultValue:", mFills, v5, v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[OADStyleMatrix bgFillAtIndex:](self, "bgFillAtIndex:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)effectsAtIndex:(unint64_t)a3
{
  unint64_t v3;
  NSMutableArray *mEffects;
  unint64_t v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = a3 - 1000;
    if (a3 <= 0x3E8)
      v3 = a3;
    mEffects = self->mEffects;
    v5 = v3 - 1;
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OADStyleMatrix objectInArray:withPossiblyOutOfRangeIndex:defaultValue:](OADStyleMatrix, "objectInArray:withPossiblyOutOfRangeIndex:defaultValue:", mEffects, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)bgFillAtIndex:(unint64_t)a3
{
  NSMutableArray *mBgFills;
  unint64_t v4;
  void *v5;
  void *v6;

  mBgFills = self->mBgFills;
  v4 = a3 - 1001;
  +[OADSolidFill whiteFill](OADSolidFill, "whiteFill");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OADStyleMatrix objectInArray:withPossiblyOutOfRangeIndex:defaultValue:](OADStyleMatrix, "objectInArray:withPossiblyOutOfRangeIndex:defaultValue:", mBgFills, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)fillCount
{
  return -[NSMutableArray count](self->mFills, "count");
}

- (id)fillAtIndex:(unint64_t)a3 color:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[OADStyleMatrix fillAtIndex:](self, "fillAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_msgSend(v7, "copy");

    if (v6)
      objc_msgSend(v9, "setStyleColor:", v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)strokeCount
{
  return -[NSMutableArray count](self->mStrokes, "count");
}

- (id)strokeAtIndex:(unint64_t)a3 color:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[OADStyleMatrix strokeAtIndex:](self, "strokeAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_msgSend(v7, "copy");

    if (v6)
      objc_msgSend(v9, "setStyleColor:", v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)effectsCount
{
  return -[NSMutableArray count](self->mEffects, "count");
}

- (id)effectsAtIndex:(unint64_t)a3 color:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[OADStyleMatrix effectsAtIndex:](self, "effectsAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v7, 1);

    if (v6)
      objc_msgSend(v8, "makeObjectsPerformSelector:withObject:", sel_setStyleColor_, v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)bgFillCount
{
  return -[NSMutableArray count](self->mBgFills, "count");
}

- (void)padArray:(id)a3 withContentsOfArray:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = objc_msgSend(v8, "count");
  if (v6 < objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "subarrayWithRange:", objc_msgSend(v8, "count"), objc_msgSend(v5, "count") - objc_msgSend(v8, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v7);

  }
}

- (void)validateStyleMatrix
{
  xmlDoc *v3;
  xmlNodePtr v4;
  _QWORD *v5;
  OAXDrawingState *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  +[TCXmlUtilities bundlePathForXmlResource:](TCXmlUtilities, "bundlePathForXmlResource:", CFSTR("DefaultStyleMatrix"));
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (xmlDoc *)sfaxmlParseFile(objc_msgSend(v10, "fileSystemRepresentation"));
  v4 = OCXGetRootElement(v3);
  if (v4)
  {
    v5 = (_QWORD *)objc_opt_new();
    v6 = -[OAXDrawingState initWithClient:]([OAXDrawingState alloc], "initWithClient:", 0);
    +[OAXStyleMatrix readFromNode:toStyleMatrix:packagePart:drawingState:](OAXStyleMatrix, "readFromNode:toStyleMatrix:packagePart:drawingState:", v4, v5, 0, v6);
    xmlFreeDoc(v3);
    -[OADStyleMatrix name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (!v8)
    {
      objc_msgSend(v5, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADStyleMatrix setName:](self, "setName:", v9);

    }
    -[OADStyleMatrix padArray:withContentsOfArray:](self, "padArray:withContentsOfArray:", self->mFills, v5[2]);
    -[OADStyleMatrix padArray:withContentsOfArray:](self, "padArray:withContentsOfArray:", self->mStrokes, v5[3]);
    -[OADStyleMatrix padArray:withContentsOfArray:](self, "padArray:withContentsOfArray:", self->mEffects, v5[4]);
    -[OADStyleMatrix padArray:withContentsOfArray:](self, "padArray:withContentsOfArray:", self->mBgFills, v5[5]);

  }
}

- (BOOL)isEmpty
{
  return !-[NSMutableArray count](self->mBgFills, "count")
      && !-[NSMutableArray count](self->mEffects, "count")
      && !-[NSMutableArray count](self->mStrokes, "count")
      && -[NSMutableArray count](self->mFills, "count") == 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADStyleMatrix;
  -[OADStyleMatrix description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBgFills, 0);
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mStrokes, 0);
  objc_storeStrong((id *)&self->mFills, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end
