@implementation CLSCurationModelSpecification

- (CLSCurationModelSpecification)initWithSceneAnalysisVersion:(unint64_t)a3 mediaAnalysisVersion:(unint64_t)a4 faceAnalysisVersion:(unint64_t)a5
{
  CLSCurationModelSpecification *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLSCurationModelSpecification;
  result = -[CLSCurationModelSpecification init](&v9, sel_init);
  if (result)
  {
    result->_sceneAnalysisVersion = a3;
    result->_mediaAnalysisVersion = a4;
    result->_faceAnalysisVersion = a5;
  }
  return result;
}

- (CLSCurationModelSpecification)initWithAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  CLSCurationModelSpecification *v10;

  v4 = a3;
  objc_msgSend(v4, "sceneAnalysisProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "sceneAnalysisVersion");
  objc_msgSend(v4, "mediaAnalysisProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mediaAnalysisVersion");
  v9 = objc_msgSend(v4, "faceAnalysisVersion");

  v10 = -[CLSCurationModelSpecification initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:](self, "initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:", v6, v8, v9);
  return v10;
}

- (CLSCurationModelSpecification)initWithItemInfo:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sceneAnalysisVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mediaAnalysisVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("faceAnalysisVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  return -[CLSCurationModelSpecification initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:](self, "initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:", v7, v9, v11);
}

- (unint64_t)hash
{
  return (self->_mediaAnalysisVersion << 16) | (self->_sceneAnalysisVersion << 32) | self->_faceAnalysisVersion;
}

- (BOOL)isEqual:(id)a3
{
  CLSCurationModelSpecification *v4;
  uint64_t v5;
  BOOL v6;
  CLSCurationModelSpecification *v7;

  v4 = (CLSCurationModelSpecification *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v6 = self->_sceneAnalysisVersion == v7->_sceneAnalysisVersion
        && self->_mediaAnalysisVersion == v7->_mediaAnalysisVersion
        && self->_faceAnalysisVersion == v7->_faceAnalysisVersion;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (unint64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (unint64_t)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

@end
