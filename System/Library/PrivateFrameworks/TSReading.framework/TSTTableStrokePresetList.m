@implementation TSTTableStrokePresetList

+ (id)init
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSTTableStrokePresetList;
  return objc_msgSendSuper2(&v3, sel_init);
}

- (void)dealloc
{
  unint64_t v3;
  objc_super v4;

  if (self->mCount)
  {
    v3 = 0;
    do

    while (v3 < self->mCount);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSTTableStrokePresetList;
  -[TSTTableStrokePresetList dealloc](&v4, sel_dealloc);
}

- (unint64_t)count
{
  return self->mCount;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  unint64_t v5;
  TSTTableStrokePresetData **mPresets;
  char *v7;
  BOOL result;

  v3 = *((_QWORD *)a3 + 1);
  if (v3 != self->mCount)
    return 0;
  if (!v3)
    return 1;
  v5 = 0;
  mPresets = self->mPresets;
  v7 = (char *)a3 + 16;
  do
  {
    result = -[TSTTableStrokePresetData isEqual:](mPresets[v5], "isEqual:", *(_QWORD *)&v7[8 * v5]);
    if (!result)
      break;
    ++v5;
  }
  while (v5 < self->mCount);
  return result;
}

- (id)presetAtIndex:(unint64_t)a3
{
  return self->mPresets[a3];
}

- (void)setStrokePreset:(id)a3 atIndex:(unint64_t)a4
{
  TSTTableStrokePresetData **mPresets;
  TSTTableStrokePresetData *v7;
  id v8;
  void *v9;
  uint64_t v10;

  if (self->mCount <= a4)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStrokePresetList setStrokePreset:atIndex:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStrokePresetList.mm"), 109, CFSTR("preset index higher than count"));
  }
  else
  {
    mPresets = self->mPresets;
    v7 = self->mPresets[a4];
    v8 = a3;
    if (v7)

    mPresets[a4] = (TSTTableStrokePresetData *)a3;
  }
}

+ (id)strokePresetListForDefaultPropertyMapForTablePresetIndex:(unint64_t)a3 colors:(id)a4
{
  uint64_t v6;
  TSDStroke *v7;
  TSDStroke *v8;
  uint64_t v9;

  if (a4)
  {
    v6 = s_TSTStrokePresetColors[a3];
    v7 = +[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", objc_msgSend(a4, "objectAtIndex:", v6), 1.0);
    v8 = +[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", objc_msgSend(a4, "objectAtIndex:", v6), 1.0);
    v9 = objc_msgSend(a4, "objectAtIndex:", v6);
  }
  else
  {
    v7 = +[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", objc_msgSend(MEMORY[0x24BEB3C40], "blackColor", a3), 1.0);
    v8 = +[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"), 1.0);
    v9 = objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
  }
  return (id)objc_msgSend(a1, "strokePresetListForDefaultPropertyMapWithHorizontalStroke:verticalStroke:exteriorStroke:", v7, v8, +[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", v9, 1.0));
}

+ (id)strokePresetListForDefaultPropertyMapWithHorizontalStroke:(id)a3 verticalStroke:(id)a4 exteriorStroke:(id)a5
{
  TSTTableStrokePresetList *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  TSTTableStrokePresetData *v12;

  v8 = objc_alloc_init(TSTTableStrokePresetList);
  v8->mCount = 15;
  v9 = -[TSTTableStrokePresetList count](v8, "count");
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
    {
      v12 = -[TSTTableStrokePresetData initWithMask:horizontalStroke:verticalStroke:exteriorStroke:]([TSTTableStrokePresetData alloc], "initWithMask:horizontalStroke:verticalStroke:exteriorStroke:", sHardCodedMasks[i], a3, a4, a5);
      -[TSTTableStrokePresetList setStrokePreset:atIndex:](v8, "setStrokePreset:atIndex:", v12, i);

    }
  }
  return v8;
}

+ (id)strokePresetListForDefaultPropertyMapWithFatStroke:(id)a3 andThinStroke:(id)a4
{
  TSTTableStrokePresetList *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  id v10;
  TSTTableStrokePresetData *v11;

  v6 = objc_alloc_init(TSTTableStrokePresetList);
  v6->mCount = 15;
  v7 = -[TSTTableStrokePresetList count](v6, "count");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      if (i >= 3)
        v10 = a3;
      else
        v10 = a4;
      v11 = -[TSTTableStrokePresetData initWithMask:horizontalStroke:verticalStroke:exteriorStroke:]([TSTTableStrokePresetData alloc], "initWithMask:horizontalStroke:verticalStroke:exteriorStroke:", sHardCodedMasks[i], v10, v10, v10);
      -[TSTTableStrokePresetList setStrokePreset:atIndex:](v6, "setStrokePreset:atIndex:", v11, i);

    }
  }
  return v6;
}

- (id)horizontalStrokeForStrokePreset:(unint64_t)a3
{
  void *v5;
  uint64_t v6;

  if (self->mCount <= a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStrokePresetList horizontalStrokeForStrokePreset:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStrokePresetList.mm"), 225, CFSTR("illegal preset index"));
  }
  return -[TSTTableStrokePresetData horizontalStroke](self->mPresets[a3], "horizontalStroke");
}

- (id)verticalStrokeForStrokePreset:(unint64_t)a3
{
  void *v5;
  uint64_t v6;

  if (self->mCount <= a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStrokePresetList verticalStrokeForStrokePreset:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStrokePresetList.mm"), 234, CFSTR("illegal preset index"));
  }
  return -[TSTTableStrokePresetData verticalStroke](self->mPresets[a3], "verticalStroke");
}

- (id)exteriorStrokeForStrokePreset:(unint64_t)a3
{
  void *v5;
  uint64_t v6;

  if (self->mCount <= a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStrokePresetList exteriorStrokeForStrokePreset:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStrokePresetList.mm"), 244, CFSTR("illegal preset index"));
  }
  return -[TSTTableStrokePresetData exteriorStroke](self->mPresets[a3], "exteriorStroke");
}

- (unsigned)maskForStrokePreset:(unint64_t)a3
{
  void *v5;
  uint64_t v6;

  if (self->mCount <= a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStrokePresetList maskForStrokePreset:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStrokePresetList.mm"), 253, CFSTR("illegal preset index"));
  }
  return -[TSTTableStrokePresetData mask](self->mPresets[a3], "mask");
}

- (void)setStroke:(id)a3 forPresetIndex:(unint64_t)a4
{
  TSTTableStrokePresetData *v6;

  v6 = -[TSTTableStrokePresetData initWithMask:horizontalStroke:verticalStroke:exteriorStroke:]([TSTTableStrokePresetData alloc], "initWithMask:horizontalStroke:verticalStroke:exteriorStroke:", objc_msgSend(-[TSTTableStrokePresetList presetAtIndex:](self, "presetAtIndex:", a4), "mask"), a3, a3, a3);
  -[TSTTableStrokePresetList setStrokePreset:atIndex:](self, "setStrokePreset:atIndex:", v6, a4);

}

@end
