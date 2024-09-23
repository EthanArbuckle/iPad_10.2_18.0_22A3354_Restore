@implementation TransitDirectionsListArtworkItem

- (TransitDirectionsListArtworkItem)initWithArtwork:(id)a3 instructions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  TransitDirectionsListArtworkItem *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, &off_1012703D8);
  v10 = -[TransitDirectionsListArtworkItem initWithArtworks:instructions:](self, "initWithArtworks:instructions:", v9, v7);

  return v10;
}

- (TransitDirectionsListArtworkItem)initWithArtworks:(id)a3 instructions:(id)a4
{
  return -[TransitDirectionsListArtworkItem initWithArtworks:alternateArtworks:instructions:](self, "initWithArtworks:alternateArtworks:instructions:", a3, 0, a4);
}

- (TransitDirectionsListArtworkItem)initWithArtworks:(id)a3 alternateArtworks:(id)a4 instructions:(id)a5
{
  id v8;
  id v9;
  TransitDirectionsListArtworkItem *v10;
  NSDictionary *v11;
  NSDictionary *artworks;
  NSDictionary *v13;
  NSDictionary *alternateArtworks;
  TransitDirectionsListArtworkItem *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TransitDirectionsListArtworkItem;
  v10 = -[TransitDirectionsListItem initWithInstructions:](&v17, "initWithInstructions:", a5);
  if (v10)
  {
    v11 = (NSDictionary *)objc_msgSend(v8, "copy");
    artworks = v10->_artworks;
    v10->_artworks = v11;

    v13 = (NSDictionary *)objc_msgSend(v9, "copy");
    alternateArtworks = v10->_alternateArtworks;
    v10->_alternateArtworks = v13;

    v10->_selectedSize = 7;
    v10->_fallbackSize = 8;
    v10->_adaptiveShieldSize = 1;
    v10->_initialAdaptiveSizeGroup = 7;
    v15 = v10;
  }

  return v10;
}

- (id)alternateImageSourceForStyle:(unint64_t)a3
{
  return -[TransitDirectionsListArtworkItem sizedAlternateArtworkForStyle:](self, "sizedAlternateArtworkForStyle:", a3);
}

- (id)sizedArtworkForStyle:(unint64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListArtworkItem artworkForStyle:](self, "artworkForStyle:", a3));
  v5 = objc_msgSend(objc_alloc((Class)MKSizedTransitArtwork), "initWithArtwork:shieldSize:fallbackShieldSize:artworkCache:", v4, -[TransitDirectionsListArtworkItem selectedSize](self, "selectedSize"), -[TransitDirectionsListArtworkItem fallbackSize](self, "fallbackSize"), 0);

  return v5;
}

- (id)sizedAlternateArtworkForStyle:(unint64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListArtworkItem alternateArtworkForStyle:](self, "alternateArtworkForStyle:", a3));
  if (v4)
    v5 = objc_msgSend(objc_alloc((Class)MKSizedTransitArtwork), "initWithArtwork:shieldSize:fallbackShieldSize:artworkCache:", v4, -[TransitDirectionsListArtworkItem selectedSize](self, "selectedSize"), -[TransitDirectionsListArtworkItem fallbackSize](self, "fallbackSize"), 0);
  else
    v5 = 0;

  return v5;
}

- (id)artworkForStyle:(unint64_t)a3
{
  NSDictionary *artworks;
  void *v6;
  void *v7;

  artworks = self->_artworks;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](artworks, "objectForKeyedSubscript:", v6));

  if (a3 && !v7)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_artworks, "objectForKeyedSubscript:", &off_1012703D8));
  return v7;
}

- (id)alternateArtworkForStyle:(unint64_t)a3
{
  NSDictionary *alternateArtworks;
  void *v6;
  void *v7;

  alternateArtworks = self->_alternateArtworks;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](alternateArtworks, "objectForKeyedSubscript:", v6));

  if (a3 && !v7)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_alternateArtworks, "objectForKeyedSubscript:", &off_1012703D8));
  return v7;
}

- (int64_t)selectedSize
{
  return self->_selectedSize;
}

- (void)setSelectedSize:(int64_t)a3
{
  self->_selectedSize = a3;
}

- (int64_t)fallbackSize
{
  return self->_fallbackSize;
}

- (void)setFallbackSize:(int64_t)a3
{
  self->_fallbackSize = a3;
}

- (BOOL)adaptiveShieldSize
{
  return self->_adaptiveShieldSize;
}

- (void)setAdaptiveShieldSize:(BOOL)a3
{
  self->_adaptiveShieldSize = a3;
}

- (int64_t)initialAdaptiveSizeGroup
{
  return self->_initialAdaptiveSizeGroup;
}

- (void)setInitialAdaptiveSizeGroup:(int64_t)a3
{
  self->_initialAdaptiveSizeGroup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateArtworks, 0);
  objc_storeStrong((id *)&self->_artworks, 0);
}

@end
