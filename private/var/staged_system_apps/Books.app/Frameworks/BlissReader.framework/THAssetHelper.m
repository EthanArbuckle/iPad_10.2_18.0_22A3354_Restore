@implementation THAssetHelper

- (THAssetHelper)initWithBookDescription:(id)a3 bookCoverDescription:(id)a4
{
  THAssetHelper *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THAssetHelper;
  v6 = -[THAssetHelper init](&v8, "init");
  if (v6)
  {
    v6->mBookDescription = (THBookDescription *)a3;
    v6->mBookCoverDescription = (THBookCoverDescription *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->mBookDescription = 0;
  self->mBookCoverDescription = 0;
  v3.receiver = self;
  v3.super_class = (Class)THAssetHelper;
  -[THAssetHelper dealloc](&v3, "dealloc");
}

- (AEAsset)asset
{
  AEAsset *result;

  result = (AEAsset *)self->mBookDescription;
  if (result)
    return (AEAsset *)-[AEAsset asset](result, "asset");
  return result;
}

- (BOOL)needsImport
{
  return 0;
}

- (unint64_t)coverArtSources
{
  return -[NSString length](-[THBookCoverDescription embeddedArtHref](self->mBookCoverDescription, "embeddedArtHref"), "length") != 0;
}

- (id)coverArtForSize:(CGSize)a3 source:(int)a4 options:(int)a5
{
  id result;
  id v7;

  result = self->mBookCoverDescription;
  if (result)
  {
    v7 = objc_msgSend(result, "embeddedArtURL", *(_QWORD *)&a4, *(_QWORD *)&a5, a3.width, a3.height);
    result = +[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", objc_msgSend(v7, "path"));
    if (!result)
    {
      result = -[THBookCoverDescription drmContext](self->mBookCoverDescription, "drmContext");
      if (result)
      {
        result = -[PFDContext dataWithContentsOfFile:error:](-[THBookCoverDescription drmContext](self->mBookCoverDescription, "drmContext"), "dataWithContentsOfFile:error:", objc_msgSend(v7, "path"), 0);
        if (result)
          return +[UIImage imageWithData:](UIImage, "imageWithData:", result);
      }
    }
  }
  return result;
}

- (id)genericCoverArtForSize:(CGSize)a3
{
  return 0;
}

- (BOOL)canImport
{
  return 1;
}

- (BOOL)coverArtSerializable
{
  return 1;
}

- (BKLocation)currentLocation
{
  return 0;
}

- (id)bookmarks
{
  return 0;
}

- (id)highlights
{
  return 0;
}

- (id)notes
{
  return 0;
}

- (NSArray)syncKeys
{
  return 0;
}

- (NSArray)liteSyncKeys
{
  return 0;
}

- (NSArray)dirtySyncKeys
{
  return 0;
}

- (id)metadataForKey:(id)a3
{
  return 0;
}

- (BOOL)purgeCache
{
  return 0;
}

- (BOOL)purgeAsset
{
  return 0;
}

- (unint64_t)numberOfSectionsForAnnotations
{
  return 0;
}

- (unint64_t)numberOfAnnotationsInSection:(unint64_t)a3 withType:(int)a4
{
  return 0;
}

- (id)annotationsInSection:(unint64_t)a3 withType:(int)a4 sortedBy:(int)a5 ascending:(BOOL)a6 range:(_NSRange)a7
{
  return 0;
}

@end
