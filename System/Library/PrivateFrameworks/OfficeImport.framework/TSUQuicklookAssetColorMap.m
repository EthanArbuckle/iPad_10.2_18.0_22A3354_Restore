@implementation TSUQuicklookAssetColorMap

+ (id)quicklookAssetMap
{
  id result;
  objc_super v4;

  result = (id)sharedInstance;
  if (!sharedInstance)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___TSUQuicklookAssetColorMap;
    result = (id)objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "init");
    sharedInstance = (uint64_t)result;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(a1, "quicklookAssetMap", a3);
}

- (unint64_t)retainCount
{
  return -1;
}

+ (BOOL)hasAppAssets
{
  return objc_msgSend((id)objc_msgSend(a1, "quicklookAssetMap"), "appAssetPath") != 0;
}

+ (id)colorForResource:(id)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "quicklookAssetMap"), "assetMap"), "objectForKey:", a3);
  if (!result)
    return +[OITSUColor grayColor](OITSUColor, "grayColor");
  return result;
}

+ (id)locatorForSageChartTextureSet:(id)a3 image:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Charts/Fills/Textures/%@/%@"), a3, a4);
}

- (NSMutableDictionary)assetMap
{
  return self->mAssetMap;
}

- (void)setAssetMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)appAssetPath
{
  return self->mAppAssetPath;
}

- (void)setAppAssetPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
