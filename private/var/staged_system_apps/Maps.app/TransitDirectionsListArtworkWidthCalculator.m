@implementation TransitDirectionsListArtworkWidthCalculator

- (TransitDirectionsListArtworkWidthCalculator)initWithSizedArtworks:(id)a3 sizeParameter:(ArtworkWidthCalculatorSizeParameter *)a4
{
  id v6;
  TransitDirectionsListArtworkWidthCalculator *v7;
  NSArray *v8;
  NSArray *artworks;
  double defaultArtworkViewWidth;
  double maxArtworkViewWidth;
  __int128 v13;
  __int128 v14;
  TransitDirectionsListArtworkWidthCalculator *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TransitDirectionsListArtworkWidthCalculator;
  v7 = -[TransitDirectionsListArtworkWidthCalculator init](&v17, "init");
  if (v7)
  {
    v8 = (NSArray *)objc_msgSend(v6, "copy");
    artworks = v7->_artworks;
    v7->_artworks = v8;

    defaultArtworkViewWidth = a4->defaultArtworkViewWidth;
    maxArtworkViewWidth = a4->maxArtworkViewWidth;
    if (a4->defaultArtworkViewWidth <= 0.0 || maxArtworkViewWidth < defaultArtworkViewWidth)
    {
      if (defaultArtworkViewWidth < 0.0)
      {
        a4->defaultArtworkViewWidth = 50.0;
        defaultArtworkViewWidth = 50.0;
      }
      if (maxArtworkViewWidth < defaultArtworkViewWidth)
        a4->maxArtworkViewWidth = defaultArtworkViewWidth;
    }
    v13 = *(_OWORD *)&a4->defaultArtworkViewWidth;
    v14 = *(_OWORD *)&a4->artworkInsets.bottom;
    *(_OWORD *)&v7->_sizeParameter.artworkInsets.top = *(_OWORD *)&a4->artworkInsets.top;
    *(_OWORD *)&v7->_sizeParameter.artworkInsets.bottom = v14;
    *(_OWORD *)&v7->_sizeParameter.defaultArtworkViewWidth = v13;
    v15 = v7;
  }

  return v7;
}

- (id)calculateArtworkViewWidthAndArtworkSizes:(double *)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  _QWORD *v10;
  void *v11;
  id v12;
  double defaultArtworkViewWidth;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  char *v25;
  id v26;
  void *v27;
  TransitDirectionsListArtworkWidthCalculator *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  double *v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  double v40;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "scale");
  v8 = v7;

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100C7CEA4;
  v38[3] = &unk_1011EA700;
  v9 = v5;
  v39 = v9;
  v40 = v8;
  v10 = objc_retainBlock(v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListArtworkWidthCalculator artworks](self, "artworks"));
  v12 = objc_msgSend(v11, "mutableCopy");

  v36 = v10;
  objc_msgSend(v12, "sortUsingComparator:", v10);
  defaultArtworkViewWidth = self->_sizeParameter.defaultArtworkViewWidth;
  v14 = (uint64_t)objc_msgSend(v12, "count");
  v15 = v14 - 1;
  if (v14 >= 1)
  {
    v35 = a3;
    v16 = 0;
    while (1)
    {
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v15));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v18));
      v20 = (void *)v19;
      v21 = v19 ? (void *)v19 : v18;
      v16 = v21;

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageToDisplayWithScreenScale:nightMode:", 0, v8));
      objc_msgSend(v22, "size");
      v24 = v23 + self->_sizeParameter.artworkInsets.left + self->_sizeParameter.artworkInsets.right;

      if (v24 <= self->_sizeParameter.defaultArtworkViewWidth)
        break;
      if (v24 <= self->_sizeParameter.maxArtworkViewWidth)
        goto LABEL_14;
      if ((uint64_t)objc_msgSend(v16, "shieldSize") < 1)
      {
        objc_msgSend(v12, "removeObjectAtIndex:", v15--);
      }
      else
      {
        v25 = (char *)objc_msgSend(v16, "shieldSize") - 1;
        v26 = objc_alloc((Class)MKSizedTransitArtwork);
        v37 = v15;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "artwork"));
        v28 = self;
        v29 = v12;
        v30 = v9;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "artworkCache"));
        v32 = objc_msgSend(v26, "initWithArtwork:shieldSize:artworkCache:", v27, v25, v31);

        v9 = v30;
        v12 = v29;
        self = v28;

        v15 = v37;
        objc_msgSend(v9, "setObject:forKey:", v32, v18);
        objc_msgSend(v12, "sortUsingComparator:", v36);

      }
      if (v15 < 0)
        goto LABEL_15;
    }
    v24 = defaultArtworkViewWidth;
LABEL_14:

    defaultArtworkViewWidth = v24;
LABEL_15:
    a3 = v35;

  }
  if (a3)
    *a3 = defaultArtworkViewWidth;
  v33 = v9;

  return v33;
}

- (NSArray)artworks
{
  return self->_artworks;
}

- (ArtworkWidthCalculatorSizeParameter)sizeParameter
{
  __int128 v3;

  v3 = *(_OWORD *)&self->artworkInsets.bottom;
  *(_OWORD *)&retstr->defaultArtworkViewWidth = *(_OWORD *)&self->artworkInsets.top;
  *(_OWORD *)&retstr->artworkInsets.top = v3;
  *(_OWORD *)&retstr->artworkInsets.bottom = *(_OWORD *)&self[1].defaultArtworkViewWidth;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworks, 0);
}

@end
