@implementation MapsUIImageGEOFeatureSpec

- (MapsUIImageGEOFeatureSpec)init
{
  MapsUIImageGEOFeatureSpec *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsUIImageGEOFeatureSpec;
  result = -[MapsUIImageGEOFeatureSpec init](&v3, "init");
  if (result)
  {
    *(&result->super._isRTL + 1) = 1;
    result->_style = (GEOFeatureStyleAttributes *)3;
    *(&result->super._isRTL + 2) = 0;
  }
  return result;
}

- (BOOL)useSearchImageFallback
{
  return 1;
}

- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageGEOFeatureSpec style](self, "style"));
  if (GEOConfigGetBOOL(MapsConfig_OverrideTransitNodeCustomPOIType, off_1014B2FC8)
    && objc_msgSend(v7, "poiType") == 225)
  {
    v20 = 0x7F00000006;
    v8 = objc_msgSend(v7, "copy");

    objc_msgSend(v8, "replaceAttributes:count:", &v20, 1);
    v7 = v8;
  }
  v9 = -[MapsUIImageGEOFeatureSpec transparent](self, "transparent");
  if (*(&self->super._isRTL + 3))
    v10 = 1;
  else
    v10 = v9;
  v11 = -[MapsUIImageGEOFeatureSpec size](self, "size");
  LOBYTE(v18) = -[MapsUIImageSpec nightMode](self, "nightMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:", v7, v11, 1, v10, 0, v4, a3, v18));
  if (!v12)
  {
    if (-[MapsUIImageGEOFeatureSpec markerFallback](self, "markerFallback"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
      v14 = -[MapsUIImageGEOFeatureSpec size](self, "size");
      v15 = -[MapsUIImageGEOFeatureSpec transparent](self, "transparent");
      LOBYTE(v19) = -[MapsUIImageSpec nightMode](self, "nightMode");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:", v13, v14, 1, v15, 0, v4, a3, v19));

    }
    else
    {
      v12 = 0;
    }
  }
  if (*(&self->super._isRTL + 3))
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_maps_invertedImage"));

    v12 = (void *)v16;
  }

  return v12;
}

- (GEOFeatureStyleAttributes)style
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = *(void **)&self->_markerFallback;
  if (!v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
    v5 = *(void **)&self->_markerFallback;
    *(_QWORD *)&self->_markerFallback = v4;

    v3 = *(void **)&self->_markerFallback;
  }
  return (GEOFeatureStyleAttributes *)v3;
}

- (void)setStyle:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4 || (v5 = -[MapsUIImageGEOFeatureSpec markerFallback](self, "markerFallback"), v4 = 0, !v5))
    v6 = objc_msgSend(v4, "copy");
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
  v7 = *(void **)&self->_markerFallback;
  *(_QWORD *)&self->_markerFallback = v6;

}

- (id)copyWithZone:(_NSZone *)a3
{
  MapsUIImageGEOFeatureSpec *v4;
  void *v5;

  v4 = objc_opt_new(MapsUIImageGEOFeatureSpec);
  -[MapsUIImageGEOFeatureSpec setMarkerFallback:](v4, "setMarkerFallback:", -[MapsUIImageGEOFeatureSpec markerFallback](self, "markerFallback"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageGEOFeatureSpec style](self, "style"));
  -[MapsUIImageGEOFeatureSpec setStyle:](v4, "setStyle:", v5);

  -[MapsUIImageGEOFeatureSpec setSize:](v4, "setSize:", -[MapsUIImageGEOFeatureSpec size](self, "size"));
  -[MapsUIImageGEOFeatureSpec setTransparent:](v4, "setTransparent:", -[MapsUIImageGEOFeatureSpec transparent](self, "transparent"));
  -[MapsUIImageGEOFeatureSpec setInverted:](v4, "setInverted:", -[MapsUIImageGEOFeatureSpec inverted](self, "inverted"));
  -[MapsUIImageSpec setNightMode:](v4, "setNightMode:", -[MapsUIImageSpec nightMode](self, "nightMode"));
  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageGEOFeatureSpec style](self, "style"));
  v4 = featureStyleAttributesHash(objc_msgSend(v3, "featureStyleAttributes"));
  v5 = -[MapsUIImageGEOFeatureSpec markerFallback](self, "markerFallback");
  v6 = 713;
  if (!v5)
    v6 = 0;
  v7 = v6 ^ v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MapsUIImageGEOFeatureSpec size](self, "size")));
  v9 = (unint64_t)objc_msgSend(v8, "hash");
  v10 = -[MapsUIImageGEOFeatureSpec transparent](self, "transparent");
  v11 = 1124;
  if (!v10)
    v11 = 0;
  v12 = v7 ^ v11;
  v13 = -[MapsUIImageGEOFeatureSpec inverted](self, "inverted");
  v14 = 2248;
  if (!v13)
    v14 = 0;
  v15 = v12 ^ v14;
  v16 = -[MapsUIImageSpec nightMode](self, "nightMode");
  v17 = 4496;
  if (!v16)
    v17 = 0;
  v18 = v15 ^ v17 ^ v9;

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v16;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = -[MapsUIImageGEOFeatureSpec markerFallback](self, "markerFallback");
    if (v7 != objc_msgSend(v6, "markerFallback"))
      goto LABEL_7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageGEOFeatureSpec style](self, "style"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "style"));
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_7;
    v11 = -[MapsUIImageGEOFeatureSpec size](self, "size");
    if (v11 == objc_msgSend(v6, "size")
      && (v12 = -[MapsUIImageGEOFeatureSpec transparent](self, "transparent"),
          v12 == objc_msgSend(v6, "transparent"))
      && (v13 = -[MapsUIImageGEOFeatureSpec inverted](self, "inverted"),
          v13 == objc_msgSend(v6, "inverted")))
    {
      v16 = -[MapsUIImageSpec nightMode](self, "nightMode");
      v14 = v16 ^ objc_msgSend(v6, "nightMode") ^ 1;
    }
    else
    {
LABEL_7:
      LOBYTE(v14) = 0;
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (id)description
{
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(self);
  v4 = CFSTR("YES");
  if (-[MapsUIImageGEOFeatureSpec markerFallback](self, "markerFallback"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = -[MapsUIImageGEOFeatureSpec size](self, "size");
  if (!-[MapsUIImageGEOFeatureSpec transparent](self, "transparent"))
    v4 = CFSTR("NO");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageGEOFeatureSpec style](self, "style"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p markerFallback=%@ size=%lu transparent=%@ style=%@>"), v3, self, v5, v6, v4, v7));

  return v8;
}

- (BOOL)markerFallback
{
  return *(&self->super._isRTL + 1);
}

- (void)setMarkerFallback:(BOOL)a3
{
  *(&self->super._isRTL + 1) = a3;
}

- (unint64_t)size
{
  return (unint64_t)self->_style;
}

- (void)setSize:(unint64_t)a3
{
  self->_style = (GEOFeatureStyleAttributes *)a3;
}

- (BOOL)transparent
{
  return *(&self->super._isRTL + 2);
}

- (void)setTransparent:(BOOL)a3
{
  *(&self->super._isRTL + 2) = a3;
}

- (BOOL)inverted
{
  return *(&self->super._isRTL + 3);
}

- (void)setInverted:(BOOL)a3
{
  *(&self->super._isRTL + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markerFallback, 0);
}

@end
