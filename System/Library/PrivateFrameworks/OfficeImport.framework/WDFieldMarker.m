@implementation WDFieldMarker

- (WDFieldMarker)initWithParagraph:(id)a3
{
  id v4;
  WDFieldMarker *v5;
  WDCharacterProperties *v6;
  void *v7;
  WDCharacterProperties *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDFieldMarker;
  v5 = -[WDRunWithCharacterProperties initWithParagraph:](&v10, sel_initWithParagraph_, v4);
  if (v5)
  {
    v6 = [WDCharacterProperties alloc];
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WDCharacterProperties initWithDocument:](v6, "initWithDocument:", v7);

    -[WDCharacterProperties setResolveMode:](v8, "setResolveMode:", 0);
    -[WDCharacterProperties setSpecialCharacter:](v8, "setSpecialCharacter:", 1);
    -[WDCharacterProperties setResolveMode:](v8, "setResolveMode:", 2);
    -[WDRunWithCharacterProperties setProperties:](v5, "setProperties:", v8);

  }
  return v5;
}

- (void)setFieldPosition:(int)a3
{
  self->mFieldPosition = a3;
}

- (void)setFieldMarkerType:(int)a3
{
  self->mMarkerType = a3;
}

- (void)setFieldType:(unsigned __int8)a3
{
  self->mFieldType = a3;
}

- (int)runType
{
  return 7;
}

- (int)fieldMarkerType
{
  return self->mMarkerType;
}

- (unsigned)fieldType
{
  return self->mFieldType;
}

- (int)fieldPosition
{
  return self->mFieldPosition;
}

- (BOOL)zombieEmbed
{
  return *((_BYTE *)self + 48) & 1;
}

- (void)setZombieEmbed:(BOOL)a3
{
  *((_BYTE *)self + 48) = *((_BYTE *)self + 48) & 0xFE | a3;
}

- (BOOL)resultDirty
{
  return (*((unsigned __int8 *)self + 48) >> 1) & 1;
}

- (void)setResultDirty:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 48) = *((_BYTE *)self + 48) & 0xFD | v3;
}

- (BOOL)resultEdited
{
  return (*((unsigned __int8 *)self + 48) >> 2) & 1;
}

- (void)setResultEdited:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 48) = *((_BYTE *)self + 48) & 0xFB | v3;
}

- (BOOL)locked
{
  return (*((unsigned __int8 *)self + 48) >> 3) & 1;
}

- (void)setLocked:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 48) = *((_BYTE *)self + 48) & 0xF7 | v3;
}

- (BOOL)privateResult
{
  return (*((unsigned __int8 *)self + 48) >> 4) & 1;
}

- (void)setPrivateResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 48) = *((_BYTE *)self + 48) & 0xEF | v3;
}

- (BOOL)nested
{
  return (*((unsigned __int8 *)self + 48) >> 5) & 1;
}

- (void)setNested:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 48) = *((_BYTE *)self + 48) & 0xDF | v3;
}

- (BOOL)hasSeparator
{
  return (*((unsigned __int8 *)self + 48) >> 6) & 1;
}

- (void)setHasSeparator:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 48) = *((_BYTE *)self + 48) & 0xBF | v3;
}

- (id)data
{
  return self->mData;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->mData, a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDFieldMarker;
  -[WDRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mData, 0);
}

@end
