@implementation RCPScreenSnapshot

- (RCPScreenSnapshot)init
{
  RCPScreenSnapshot *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCPScreenSnapshot;
  v2 = -[RCPScreenSnapshot init](&v5, sel_init);
  v2->_timestamp = mach_absolute_time();
  v3 = init_i++;
  v2->_index = v3;
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p timestamp=%llu>"), v5, self, -[RCPScreenSnapshot timestamp](self, "timestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (UIImage)snapshotImage
{
  return self->_snapshotImage;
}

- (void)setSnapshotImage:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotImage, a3);
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotImage, 0);
}

@end
