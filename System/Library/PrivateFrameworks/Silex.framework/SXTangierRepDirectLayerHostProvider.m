@implementation SXTangierRepDirectLayerHostProvider

- (id)directLayerHostForRep:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TSUProtocolCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "directLayerHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)directLayerHostUpdateAdditionalLayersUnderRepLayers:(id)a3
{
  CALayer *underRepsLayerHost;
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  underRepsLayerHost = self->_underRepsLayerHost;
  if (underRepsLayerHost)
  {
    -[CALayer sublayers](underRepsLayerHost, "sublayers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v8)
    {

    }
    else
    {
      -[CALayer sublayers](self->_underRepsLayerHost, "sublayers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqual:", v8);

      if ((v7 & 1) == 0)
        -[CALayer setSublayers:](self->_underRepsLayerHost, "setSublayers:", v8);
    }
  }

}

- (void)directLayerHostUpdateAdditionalLayersAboveRepLayers:(id)a3
{
  CALayer *aboveRepsLayerHost;
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  aboveRepsLayerHost = self->_aboveRepsLayerHost;
  if (aboveRepsLayerHost)
  {
    -[CALayer sublayers](aboveRepsLayerHost, "sublayers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v8)
    {

    }
    else
    {
      -[CALayer sublayers](self->_aboveRepsLayerHost, "sublayers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqual:", v8);

      if ((v7 & 1) == 0)
        -[CALayer setSublayers:](self->_aboveRepsLayerHost, "setSublayers:", v8);
    }
  }

}

- (void)directLayerHostUpdateRepOverlayLayers:(id)a3
{
  CALayer *overlayLayerHost;
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  overlayLayerHost = self->_overlayLayerHost;
  if (overlayLayerHost)
  {
    -[CALayer sublayers](overlayLayerHost, "sublayers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v8)
    {

    }
    else
    {
      -[CALayer sublayers](self->_overlayLayerHost, "sublayers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqual:", v8);

      if ((v7 & 1) == 0)
        -[CALayer setSublayers:](self->_overlayLayerHost, "setSublayers:", v8);
    }
  }

}

- (CALayer)aboveRepsLayerHost
{
  return self->_aboveRepsLayerHost;
}

- (void)setAboveRepsLayerHost:(id)a3
{
  objc_storeStrong((id *)&self->_aboveRepsLayerHost, a3);
}

- (CALayer)underRepsLayerHost
{
  return self->_underRepsLayerHost;
}

- (void)setUnderRepsLayerHost:(id)a3
{
  objc_storeStrong((id *)&self->_underRepsLayerHost, a3);
}

- (CALayer)overlayLayerHost
{
  return self->_overlayLayerHost;
}

- (void)setOverlayLayerHost:(id)a3
{
  objc_storeStrong((id *)&self->_overlayLayerHost, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayLayerHost, 0);
  objc_storeStrong((id *)&self->_underRepsLayerHost, 0);
  objc_storeStrong((id *)&self->_aboveRepsLayerHost, 0);
}

@end
