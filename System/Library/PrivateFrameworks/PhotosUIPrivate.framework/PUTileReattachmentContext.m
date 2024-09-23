@implementation PUTileReattachmentContext

- (PUDisplayVelocity)velocityForTileController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  PUDisplayVelocity result;

  v4 = a3;
  -[PUTileReattachmentContext _tileControllerVelocities](self, "_tileControllerVelocities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "pu_displayVelocityValue");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v14 = 0.0;
    v12 = 0.0;
    v10 = 0.0;
    v8 = 0.0;
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.rotation = v18;
  result.scale = v17;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)setVelocity:(PUDisplayVelocity)a3 forTileController:(id)a4
{
  double rotation;
  double scale;
  double y;
  double x;
  id v9;
  void *v10;
  id v11;

  rotation = a3.rotation;
  scale = a3.scale;
  y = a3.y;
  x = a3.x;
  v9 = a4;
  -[PUTileReattachmentContext _tileControllerVelocities](self, "_tileControllerVelocities");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->__tileControllerVelocities, v11);
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "pu_valueWithDisplayVelocity:", x, y, scale, rotation);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v10, v9);

}

- (BOOL)isZoomingIn
{
  return self->_isZoomingIn;
}

- (void)setZoomingIn:(BOOL)a3
{
  self->_isZoomingIn = a3;
}

- (BOOL)isTransitioningOverOneUp
{
  return self->_isTransitioningOverOneUp;
}

- (void)setTransitioningOverOneUp:(BOOL)a3
{
  self->_isTransitioningOverOneUp = a3;
}

- (NSMapTable)_tileControllerVelocities
{
  return self->__tileControllerVelocities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tileControllerVelocities, 0);
}

@end
