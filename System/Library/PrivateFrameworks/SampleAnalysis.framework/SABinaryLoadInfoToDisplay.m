@implementation SABinaryLoadInfoToDisplay

- (BOOL)isInKernelAddressSpace
{
  return self->_isInKernelAddressSpace;
}

- (id)exclave
{
  return self->_exclave;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)SABinaryLoadInfoToDisplay;
  -[SABinaryLoadInfo debugDescription](&v7, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@, ho:0x%llx, z:%d"), v4, self->_highestOffset, self->_isZerothAndOnlySegment);

  return v5;
}

- (unint64_t)highestOffset
{
  return self->_highestOffset;
}

- (void)setHighestOffset:(unint64_t)a3
{
  self->_highestOffset = a3;
}

- (BOOL)isZerothAndOnlySegment
{
  return self->_isZerothAndOnlySegment;
}

- (void)setIsZerothAndOnlySegment:(BOOL)a3
{
  self->_isZerothAndOnlySegment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclave, 0);
}

@end
