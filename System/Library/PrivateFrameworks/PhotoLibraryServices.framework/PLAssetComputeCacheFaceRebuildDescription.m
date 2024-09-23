@implementation PLAssetComputeCacheFaceRebuildDescription

- (PLAssetComputeCacheFaceRebuildDescription)initWithPayloadAttributes:(id)a3
{
  id v5;
  PLAssetComputeCacheFaceRebuildDescription *v6;
  PLAssetComputeCacheFaceRebuildDescription *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAssetComputeCacheFaceRebuildDescription;
  v6 = -[PLAssetComputeCacheFaceRebuildDescription init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_payloadAttributes, a3);

  return v7;
}

- (double)centerX
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("centerX"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)centerY
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("centerY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)size
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("size"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)bodyCenterX
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("bodyCenterX"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)bodyCenterY
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("bodyCenterY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)bodyWidth
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("bodyWidth"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)bodyHeight
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("bodyHeight"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (NSNumber)detectionType
{
  return (NSNumber *)-[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("detectionType"));
}

- (BOOL)isHidden
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("hidden"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isManual
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("manual"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isRepresentative
{
  return 0;
}

- (int)nameSource
{
  void *v2;
  int v3;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("nameSource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (int)cloudNameSource
{
  void *v2;
  int v3;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("cloudNameSource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (BOOL)isClusterRejected
{
  return 0;
}

- (int)faceAlgorithmVersion
{
  void *v2;
  int v3;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("faceAlgorithmVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAttributes, 0);
}

@end
