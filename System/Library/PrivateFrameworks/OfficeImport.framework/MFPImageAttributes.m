@implementation MFPImageAttributes

- (MFPImageAttributes)init
{
  MFPImageAttributes *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mColorAdjustMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFPImageAttributes;
  v2 = -[MFPImageAttributes init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mColorAdjustMap = v2->mColorAdjustMap;
    v2->mColorAdjustMap = v3;

  }
  return v2;
}

- (id)colorAdjustWithType:(int)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", *(_QWORD *)&a3);
  -[NSMutableDictionary objectForKey:](self->mColorAdjustMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ensureColorAdjustWithType:(int)a3
{
  void *v4;
  MFPColorAdjust *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", *(_QWORD *)&a3);
  -[NSMutableDictionary objectForKey:](self->mColorAdjustMap, "objectForKey:", v4);
  v5 = (MFPColorAdjust *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MFPColorAdjust);
    -[NSMutableDictionary setObject:forKey:](self->mColorAdjustMap, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColorAdjustMap, 0);
}

@end
