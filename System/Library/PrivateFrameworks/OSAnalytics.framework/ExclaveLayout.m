@implementation ExclaveLayout

- (ExclaveLayout)init
{
  ExclaveLayout *v2;
  uint64_t v3;
  NSMutableArray *segments;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExclaveLayout;
  v2 = -[ExclaveLayout init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    segments = v2->_segments;
    v2->_segments = (NSMutableArray *)v3;

  }
  return v2;
}

- (NSNumber)layoutId
{
  return self->_layoutId;
}

- (void)setLayoutId:(id)a3
{
  objc_storeStrong((id *)&self->_layoutId, a3);
}

- (NSMutableArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_storeStrong((id *)&self->_segments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_layoutId, 0);
}

@end
