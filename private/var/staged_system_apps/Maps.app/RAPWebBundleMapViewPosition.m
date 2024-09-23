@implementation RAPWebBundleMapViewPosition

- (RAPWebBundleMapViewPosition)initWithDictionary:(id)a3
{
  id v4;
  RAPWebBundleMapViewPosition *v5;
  uint64_t v6;
  NSString *mapId;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  float v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RAPWebBundleMapViewPosition;
  v5 = -[RAPWebBundleMapViewPosition init](&v21, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id")));
    mapId = v5->_mapId;
    v5->_mapId = (NSString *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("height")));
    objc_msgSend(v8, "floatValue");
    v5->_height = v9;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("opacity")));
    objc_msgSend(v10, "floatValue");
    v5->_opacity = v11;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("y")));
    objc_msgSend(v12, "floatValue");
    v5->_yPosition = v13;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("x")));
    objc_msgSend(v14, "floatValue");
    v5->_xPosition = v15;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("widthPadding")));
    objc_msgSend(v16, "floatValue");
    v5->_widthPadding = v17;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("widthPercent")));
    objc_msgSend(v18, "floatValue");
    v5->_widthPercent = v19;

  }
  return v5;
}

- (NSString)mapId
{
  return self->_mapId;
}

- (double)height
{
  return self->_height;
}

- (double)opacity
{
  return self->_opacity;
}

- (double)yPosition
{
  return self->_yPosition;
}

- (double)xPosition
{
  return self->_xPosition;
}

- (double)widthPadding
{
  return self->_widthPadding;
}

- (double)widthPercent
{
  return self->_widthPercent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapId, 0);
}

@end
