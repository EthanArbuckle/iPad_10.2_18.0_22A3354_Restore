@implementation PTCinematographyNetworkRectSignal

- (PTCinematographyNetworkRectSignal)initWithModelDictionary:(id)a3
{
  id v4;
  PTCinematographyNetworkRectSignal *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTCinematographyNetworkRectSignal;
  v5 = -[PTCinematographyNetworkSignal initWithModelDictionary:](&v9, sel_initWithModelDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("params"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("width_height"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useSqrtForArea = objc_msgSend(v7, "isEqualToString:", CFSTR("geomean"));

  }
  return v5;
}

- (void)writePayload:(id)a3 toStream:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  float Area;
  float MidX;
  float MidY;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;

  v6 = a3;
  v7 = a4;
  if (-[PTCinematographyNetworkSignal checkSignalForStream:](self, "checkSignalForStream:", v7))
  {
    if (objc_msgSend(v6, "isMissingDetection"))
    {
      objc_msgSend(v7, "writeZerosWithCount:", 3);
    }
    else
    {
      objc_msgSend(v6, "detection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rect");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;

      Area = CGRectGetArea(v11, v13, v15, v17);
      v25.origin.x = v11;
      v25.origin.y = v13;
      v25.size.width = v15;
      v25.size.height = v17;
      MidX = CGRectGetMidX(v25);
      v26.origin.x = v11;
      v26.origin.y = v13;
      v26.size.width = v15;
      v26.size.height = v17;
      MidY = CGRectGetMidY(v26);
      v21 = -[PTCinematographyNetworkRectSignal useSqrtForArea](self, "useSqrtForArea");
      *(float *)&v22 = sqrtf(Area);
      if (!v21)
        *(float *)&v22 = Area;
      objc_msgSend(v7, "writeFloat:", v22);
      *(float *)&v23 = MidX;
      objc_msgSend(v7, "writeFloat:", v23);
      *(float *)&v24 = MidY;
      objc_msgSend(v7, "writeFloat:", v24);
    }
  }
  else
  {
    _PTLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PTCinematographyNetworkNamedSignal writePayload:toStream:].cold.2(v8);

  }
}

- (BOOL)useSqrtForArea
{
  return self->_useSqrtForArea;
}

- (void)setUseSqrtForArea:(BOOL)a3
{
  self->_useSqrtForArea = a3;
}

@end
