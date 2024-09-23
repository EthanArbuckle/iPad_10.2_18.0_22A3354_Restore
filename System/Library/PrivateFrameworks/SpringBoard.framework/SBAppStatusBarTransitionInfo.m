@implementation SBAppStatusBarTransitionInfo

- (id)description
{
  __CFString *v3;
  __CFString *v4;
  int64_t endOrientation;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t transition;
  __CFString *v14;
  void *v15;
  uint64_t v17;

  if (self->_zoomOther)
    v3 = CFSTR("(zoomOther) :");
  else
    v3 = CFSTR(":");
  v4 = v3;
  endOrientation = self->_endOrientation;
  if (self->_startOrientation == endOrientation)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), self->_startOrientation, v17);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i -> %i"), self->_startOrientation, endOrientation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[UIStatusBarStyleRequest isEqual:](self->_startStyleRequest, "isEqual:", self->_endStyleRequest) & 1) != 0)
  {
    __stringForStyleRequest(self->_startStyleRequest);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    __stringForStyleRequest(self->_startStyleRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __stringForStyleRequest(self->_endStyleRequest);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ -> %@"), v9, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = objc_opt_class();
  transition = self->_transition;
  if (transition > 4)
    v14 = 0;
  else
    v14 = off_1E8EB6E50[transition];
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@:%p transition=%@ %@ orientation=%@ : styleRequest=%@>"), v12, self, v14, v4, v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (UIStatusBarStyleRequest)startStyleRequest
{
  return self->_startStyleRequest;
}

- (void)setStartStyleRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)startOrientation
{
  return self->_startOrientation;
}

- (void)setStartOrientation:(int64_t)a3
{
  self->_startOrientation = a3;
}

- (UIStatusBarStyleRequest)endStyleRequest
{
  return self->_endStyleRequest;
}

- (void)setEndStyleRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)endOrientation
{
  return self->_endOrientation;
}

- (void)setEndOrientation:(int64_t)a3
{
  self->_endOrientation = a3;
}

- (int)transition
{
  return self->_transition;
}

- (void)setTransition:(int)a3
{
  self->_transition = a3;
}

- (BOOL)zoomOther
{
  return self->_zoomOther;
}

- (void)setZoomOther:(BOOL)a3
{
  self->_zoomOther = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endStyleRequest, 0);
  objc_storeStrong((id *)&self->_startStyleRequest, 0);
}

@end
