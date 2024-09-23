@implementation _PUPosterOverrideConfiguration

- (_PUPosterOverrideConfiguration)initWithSettings:(id)a3 assetURL:(id)a4 assetIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PUPosterOverrideConfiguration *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_PUPosterOverrideConfiguration;
  v11 = -[_PUPosterOverrideConfiguration init](&v14, sel_init);
  if (v11)
  {
    if (objc_msgSend(v8, "useAssetURL"))
      v12 = v9;
    else
      v12 = 0;
    objc_storeStrong((id *)&v11->_assetURL, v12);
    objc_storeStrong((id *)&v11->_assetIdentifier, a5);
    v11->_applySmartCrop = objc_msgSend(v8, "smartCropEnabled");
    v11->_includeBackfillLayers = objc_msgSend(v8, "previewEnabled");
  }

  return v11;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (BOOL)applySmartCrop
{
  return self->_applySmartCrop;
}

- (BOOL)includeBackfillLayers
{
  return self->_includeBackfillLayers;
}

- (BOOL)includeInactiveLayers
{
  return self->_includeInactiveLayers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
}

@end
