@implementation _SFPBRFMapCardSection

- (_SFPBRFMapCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFMapCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _SFPBRFMapMarker *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  _SFPBRFMapAnnotation *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  _SFPBLatLng *v29;
  _SFPBRFMapCardSection *v30;
  _SFPBRFMapCardSection *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRFMapCardSection init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasSizeFormat"))
      -[_SFPBRFMapCardSection setSizeFormat:](v5, "setSizeFormat:", objc_msgSend(v4, "sizeFormat"));
    objc_msgSend(v4, "markers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v4, "markers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBRFMapMarker initWithFacade:]([_SFPBRFMapMarker alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v10);
    }

    -[_SFPBRFMapCardSection setMarkers:](v5, "setMarkers:", v7);
    objc_msgSend(v4, "annotations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v4, "annotations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v16);
          v21 = -[_SFPBRFMapAnnotation initWithFacade:]([_SFPBRFMapAnnotation alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v18);
    }

    -[_SFPBRFMapCardSection setAnnotations:](v5, "setAnnotations:", v15);
    objc_msgSend(v4, "polyline");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v5;
    if (v22)
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v23 = 0;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v4, "polyline");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(v24);
          v29 = -[_SFPBLatLng initWithFacade:]([_SFPBLatLng alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
          if (v29)
            objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v26);
    }

    v5 = v32;
    -[_SFPBRFMapCardSection setPolylines:](v32, "setPolylines:", v23);
    if (objc_msgSend(v4, "hasCameraDistance"))
    {
      objc_msgSend(v4, "cameraDistance");
      -[_SFPBRFMapCardSection setCameraDistance:](v32, "setCameraDistance:");
    }
    if (objc_msgSend(v4, "hasShowsUserLocation"))
      -[_SFPBRFMapCardSection setShowsUserLocation:](v32, "setShowsUserLocation:", objc_msgSend(v4, "showsUserLocation"));
    v30 = v32;

  }
  return v5;
}

- (void)setSizeFormat:(int)a3
{
  self->_sizeFormat = a3;
}

- (void)setMarkers:(id)a3
{
  NSArray *v4;
  NSArray *markers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  markers = self->_markers;
  self->_markers = v4;

}

- (void)clearMarkers
{
  -[NSArray removeAllObjects](self->_markers, "removeAllObjects");
}

- (void)addMarkers:(id)a3
{
  id v4;
  NSArray *markers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  markers = self->_markers;
  v8 = v4;
  if (!markers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_markers;
    self->_markers = v6;

    v4 = v8;
    markers = self->_markers;
  }
  -[NSArray addObject:](markers, "addObject:", v4);

}

- (unint64_t)markersCount
{
  return -[NSArray count](self->_markers, "count");
}

- (id)markersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_markers, "objectAtIndexedSubscript:", a3);
}

- (void)setAnnotations:(id)a3
{
  NSArray *v4;
  NSArray *annotations;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  annotations = self->_annotations;
  self->_annotations = v4;

}

- (void)clearAnnotations
{
  -[NSArray removeAllObjects](self->_annotations, "removeAllObjects");
}

- (void)addAnnotations:(id)a3
{
  id v4;
  NSArray *annotations;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  annotations = self->_annotations;
  v8 = v4;
  if (!annotations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_annotations;
    self->_annotations = v6;

    v4 = v8;
    annotations = self->_annotations;
  }
  -[NSArray addObject:](annotations, "addObject:", v4);

}

- (unint64_t)annotationsCount
{
  return -[NSArray count](self->_annotations, "count");
}

- (id)annotationsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_annotations, "objectAtIndexedSubscript:", a3);
}

- (void)setPolyline:(id)a3
{
  NSArray *v4;
  NSArray *polylines;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  polylines = self->_polylines;
  self->_polylines = v4;

}

- (void)clearPolyline
{
  -[NSArray removeAllObjects](self->_polylines, "removeAllObjects");
}

- (void)addPolyline:(id)a3
{
  id v4;
  NSArray *polylines;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  polylines = self->_polylines;
  v8 = v4;
  if (!polylines)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_polylines;
    self->_polylines = v6;

    v4 = v8;
    polylines = self->_polylines;
  }
  -[NSArray addObject:](polylines, "addObject:", v4);

}

- (unint64_t)polylineCount
{
  return -[NSArray count](self->_polylines, "count");
}

- (id)polylineAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_polylines, "objectAtIndexedSubscript:", a3);
}

- (void)setCameraDistance:(double)a3
{
  self->_cameraDistance = a3;
}

- (void)setShowsUserLocation:(BOOL)a3
{
  self->_showsUserLocation = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFMapCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_SFPBRFMapCardSection sizeFormat](self, "sizeFormat"))
    PBDataWriterWriteInt32Field();
  -[_SFPBRFMapCardSection markers](self, "markers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  -[_SFPBRFMapCardSection annotations](self, "annotations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v12);
  }

  -[_SFPBRFMapCardSection polylines](self, "polylines");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v17);
  }

  -[_SFPBRFMapCardSection cameraDistance](self, "cameraDistance");
  if (v20 != 0.0)
    PBDataWriterWriteDoubleField();
  if (-[_SFPBRFMapCardSection showsUserLocation](self, "showsUserLocation"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int sizeFormat;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  double cameraDistance;
  double v26;
  int showsUserLocation;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  sizeFormat = self->_sizeFormat;
  if (sizeFormat != objc_msgSend(v4, "sizeFormat"))
    goto LABEL_18;
  -[_SFPBRFMapCardSection markers](self, "markers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[_SFPBRFMapCardSection markers](self, "markers");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_SFPBRFMapCardSection markers](self, "markers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "markers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[_SFPBRFMapCardSection annotations](self, "annotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[_SFPBRFMapCardSection annotations](self, "annotations");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_SFPBRFMapCardSection annotations](self, "annotations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "annotations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[_SFPBRFMapCardSection polylines](self, "polylines");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "polylines");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  -[_SFPBRFMapCardSection polylines](self, "polylines");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[_SFPBRFMapCardSection polylines](self, "polylines");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "polylines");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_18;
  }
  else
  {

  }
  cameraDistance = self->_cameraDistance;
  objc_msgSend(v4, "cameraDistance");
  if (cameraDistance == v26)
  {
    showsUserLocation = self->_showsUserLocation;
    v23 = showsUserLocation == objc_msgSend(v4, "showsUserLocation");
    goto LABEL_19;
  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  uint64_t sizeFormat;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double cameraDistance;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;

  sizeFormat = self->_sizeFormat;
  v4 = -[NSArray hash](self->_markers, "hash");
  v5 = -[NSArray hash](self->_annotations, "hash");
  v6 = -[NSArray hash](self->_polylines, "hash");
  cameraDistance = self->_cameraDistance;
  if (cameraDistance == 0.0)
  {
    v11 = 0;
  }
  else
  {
    v8 = -cameraDistance;
    if (cameraDistance >= 0.0)
      v8 = self->_cameraDistance;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v11 += (unint64_t)v10;
    }
    else
    {
      v11 -= (unint64_t)fabs(v10);
    }
  }
  if (self->_showsUserLocation)
    v12 = 2654435761;
  else
    v12 = 0;
  return v4 ^ v5 ^ v6 ^ v11 ^ v12 ^ (2654435761 * sizeFormat);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __CFString *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_annotations, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v5 = self->_annotations;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v43 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("annotations"));
  }
  if (self->_cameraDistance != 0.0)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBRFMapCardSection cameraDistance](self, "cameraDistance");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("cameraDistance"));

  }
  if (-[NSArray count](self->_markers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v15 = self->_markers;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v14, "addObject:", v20);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v21);

          }
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("markers"));
  }
  if (-[NSArray count](self->_polylines, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v23 = self->_polylines;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v35;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * k), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            objc_msgSend(v22, "addObject:", v28);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v29);

          }
        }
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("polyline"));
  }
  if (self->_showsUserLocation)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFMapCardSection showsUserLocation](self, "showsUserLocation"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("showsUserLocation"));

  }
  if (self->_sizeFormat)
  {
    v31 = -[_SFPBRFMapCardSection sizeFormat](self, "sizeFormat");
    if ((_DWORD)v31)
    {
      if ((_DWORD)v31 == 1)
      {
        v32 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v31);
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v32 = CFSTR("0");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("sizeFormat"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFMapCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBRFMapCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFMapCardSection *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBRFMapCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFMapCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFMapCardSection *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  _SFPBRFMapMarker *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  _SFPBRFMapAnnotation *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  _SFPBLatLng *v31;
  void *v32;
  void *v33;
  _SFPBRFMapCardSection *v34;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)_SFPBRFMapCardSection;
  v5 = -[_SFPBRFMapCardSection init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sizeFormat"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFMapCardSection setSizeFormat:](v5, "setSizeFormat:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("markers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v47 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[_SFPBRFMapMarker initWithDictionary:]([_SFPBRFMapMarker alloc], "initWithDictionary:", v14);
              -[_SFPBRFMapCardSection addMarkers:](v5, "addMarkers:", v15);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
        }
        while (v11);
      }

      v6 = v8;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("annotations"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v43 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = -[_SFPBRFMapAnnotation initWithDictionary:]([_SFPBRFMapAnnotation alloc], "initWithDictionary:", v22);
              -[_SFPBRFMapCardSection addAnnotations:](v5, "addAnnotations:", v23);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        }
        while (v19);
      }

      v16 = v37;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("polyline"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = v6;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v39;
        do
        {
          for (k = 0; k != v27; ++k)
          {
            if (*(_QWORD *)v39 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v31 = -[_SFPBLatLng initWithDictionary:]([_SFPBLatLng alloc], "initWithDictionary:", v30);
              -[_SFPBRFMapCardSection addPolyline:](v5, "addPolyline:", v31);

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
        }
        while (v27);
      }

      v6 = v36;
      v16 = v37;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cameraDistance"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v32, "doubleValue");
      -[_SFPBRFMapCardSection setCameraDistance:](v5, "setCameraDistance:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showsUserLocation"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFMapCardSection setShowsUserLocation:](v5, "setShowsUserLocation:", objc_msgSend(v33, "BOOLValue"));
    v34 = v5;

  }
  return v5;
}

- (int)sizeFormat
{
  return self->_sizeFormat;
}

- (NSArray)markers
{
  return self->_markers;
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (NSArray)polylines
{
  return self->_polylines;
}

- (void)setPolylines:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)cameraDistance
{
  return self->_cameraDistance;
}

- (BOOL)showsUserLocation
{
  return self->_showsUserLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polylines, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_markers, 0);
}

@end
