@implementation OfflineMapsSuggestionModelData

- (OfflineMapsSuggestionModelData)initWithTipTitle:(id)a3 tipSubtitle:(id)a4 tipActionTitle:(id)a5 tipImage:(id)a6 mapRegion:(id)a7 regionName:(id)a8 suggestionSubtitle:(id)a9 suggestionType:(int)a10
{
  id v17;
  id v18;
  OfflineMapsSuggestionModelData *v19;
  OfflineMapsSuggestionModelData *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v17 = a8;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)OfflineMapsSuggestionModelData;
  v19 = -[OfflineMapsSuggestionModelData init](&v27, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_tipTitle, a3);
    objc_storeStrong((id *)&v20->_tipSubtitle, a4);
    objc_storeStrong((id *)&v20->_tipActionTitle, a5);
    objc_storeStrong((id *)&v20->_tipImage, a6);
    objc_storeStrong((id *)&v20->_mapRegion, a7);
    objc_storeStrong((id *)&v20->_regionName, a8);
    objc_storeStrong((id *)&v20->_suggestionSubtitle, a9);
    v20->_suggestionType = a10;
  }

  return v20;
}

- (NSString)tipTitle
{
  return self->_tipTitle;
}

- (NSString)tipSubtitle
{
  return self->_tipSubtitle;
}

- (NSString)tipActionTitle
{
  return self->_tipActionTitle;
}

- (UIImage)tipImage
{
  return self->_tipImage;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (NSString)regionName
{
  return self->_regionName;
}

- (NSString)suggestionSubtitle
{
  return self->_suggestionSubtitle;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionSubtitle, 0);
  objc_storeStrong((id *)&self->_regionName, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_tipImage, 0);
  objc_storeStrong((id *)&self->_tipActionTitle, 0);
  objc_storeStrong((id *)&self->_tipSubtitle, 0);
  objc_storeStrong((id *)&self->_tipTitle, 0);
}

@end
