@implementation PFAINavigationState

- (PFAINavigationState)initWithEntry:(id)a3 inArchive:(id)a4
{
  PFAINavigationState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFAINavigationState;
  v4 = -[PFXXmlStreamReaderState initWithEntry:inArchive:](&v6, "initWithEntry:inArchive:", a3, a4);
  if (v4)
  {
    v4->mNodesByGuid = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->mNodesByAbsoluteEntry = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->mMetadataDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAINavigationState;
  -[PFXXmlStreamReaderState dealloc](&v3, "dealloc");
}

- (void)setContentNode:(id)a3 forEntry:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mNodesByAbsoluteEntry, "setObject:forKey:", a3, a4);
}

- (id)contentNodeForEntry:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mNodesByAbsoluteEntry, "objectForKey:", a3);
}

- (void)clearNodesByEntry
{

  self->mNodesByAbsoluteEntry = 0;
  self->mNodesByAbsoluteEntry = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
}

- (void)addContentNodeToCache:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->mNodesByGuid, "setObject:forKey:", a3, objc_msgSend(a3, "nodeGUID"));
}

- (id)contentNodeForNodeGUID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mNodesByGuid, "objectForKey:", a3);
}

- (void)setMetadataContents:(id)a3 forName:(id)a4
{
  if (a3)
  {
    if (a4)
      -[NSMutableDictionary setObject:forKey:](self->mMetadataDict, "setObject:forKey:");
  }
}

- (id)additionalPropertiesForNavPointId:(id)a3
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->mNcxAdditions, "objectForKey:", CFSTR("navMap")), "objectForKey:", a3);
}

- (PFAIPackageState)packageState
{
  return self->mPackageState;
}

- (void)setPackageState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (THModelContainerNode)currentContainerNode
{
  return self->mCurrentContainerNode;
}

- (void)setCurrentContainerNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (THTOCTileModel)currentTocTile
{
  return self->mCurrentTocTile;
}

- (void)setCurrentTocTile:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSDictionary)ncxAdditions
{
  return self->mNcxAdditions;
}

- (void)setNcxAdditions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSDictionary)metadataDict
{
  return &self->mMetadataDict->super;
}

- (NSString)title
{
  return self->mTitle;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSString)subtitle
{
  return self->mSubtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

@end
