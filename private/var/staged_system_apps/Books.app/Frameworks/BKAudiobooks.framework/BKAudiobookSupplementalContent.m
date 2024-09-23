@implementation BKAudiobookSupplementalContent

- (BKAudiobookSupplementalContent)initWithTitle:(id)a3 assetIdentifier:(id)a4
{
  id v6;
  id v7;
  BKAudiobookSupplementalContent *v8;
  NSString *v9;
  NSString *title;
  BKLibraryAssetIdentifier *v11;
  BKLibraryAssetIdentifier *assetIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKAudiobookSupplementalContent;
  v8 = -[BKAudiobookSupplementalContent init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = v9;

    v11 = (BKLibraryAssetIdentifier *)objc_msgSend(v7, "copy");
    assetIdentifier = v8->_assetIdentifier;
    v8->_assetIdentifier = v11;

  }
  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (BKLibraryAssetIdentifier)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
