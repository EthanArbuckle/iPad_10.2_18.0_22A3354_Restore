@implementation GEOTransitStepBadge

+ (id)_maps_artworkListFromStepBadges:(id)a3
{
  return sub_10039DCD4(a3, &stru_1011C1580);
}

- (id)_maps_artworkCluster
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v12;

  if ((-[GEOTransitStepBadge hasArtwork](self, "hasArtwork") & 1) == 0
    && !-[GEOTransitStepBadge hasText](self, "hasText"))
  {
    return 0;
  }
  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  if (-[GEOTransitStepBadge hasArtwork](self, "hasArtwork"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitStepBadge artwork](self, "artwork"));
    objc_msgSend(v3, "addObject:", v4);

  }
  if (-[GEOTransitStepBadge hasText](self, "hasText"))
  {
    v5 = objc_alloc((Class)MKTransitText);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitStepBadge text](self, "text"));
    v7 = objc_msgSend(v5, "initWithFormattedString:", v6);

    v8 = objc_msgSend(objc_alloc((Class)MKTransitArtwork), "initWithText:", v7);
    objc_msgSend(v3, "addObject:", v8);

  }
  v12 = v3;
  v9 = v3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  return v10;
}

@end
