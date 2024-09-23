@implementation GEORPCorrectedLabel

- (void)populateWithLabelMarker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureHandles", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = sub_10043CD54(*(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        -[GEORPCorrectedLabel addFeatureHandle:](self, "addFeatureHandle:", v11);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  -[GEORPCorrectedLabel setUid:](self, "setUid:", objc_msgSend(v4, "featureID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapRegion"));
  -[GEORPCorrectedLabel setFeatureRegion:](self, "setFeatureRegion:", v12);

  v13 = objc_alloc_init((Class)GEOLatLng);
  -[GEORPCorrectedLabel setCoordinate:](self, "setCoordinate:", v13);

  objc_msgSend(v4, "coordinate");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPCorrectedLabel coordinate](self, "coordinate"));
  objc_msgSend(v16, "setLat:", v15);

  objc_msgSend(v4, "coordinate");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPCorrectedLabel coordinate](self, "coordinate"));
  objc_msgSend(v19, "setLng:", v18);

}

@end
