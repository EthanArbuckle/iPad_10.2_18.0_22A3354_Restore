@implementation TSMTIEMaskError

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSMTIEMaskError observationInterval](self, "observationInterval");
  v7 = v6;
  -[TSMTIEMaskError mask](self, "mask");
  v9 = v8;
  -[TSMTIEMaskError mtie](self, "mtie");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: {%.9f,%.9f,%0.9f}>"), v5, self, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)observationInterval
{
  return self->_observationInterval;
}

- (void)setObservationInterval:(double)a3
{
  self->_observationInterval = a3;
}

- (double)mask
{
  return self->_mask;
}

- (void)setMask:(double)a3
{
  self->_mask = a3;
}

- (double)mtie
{
  return self->_mtie;
}

- (void)setMtie:(double)a3
{
  self->_mtie = a3;
}

@end
