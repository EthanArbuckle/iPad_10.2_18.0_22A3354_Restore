@implementation KCContainer

- (KCContainer)initWithKCData:(kcdata_iter)a3
{
  kcdata_item_t item;
  KCContainer *v4;
  KCContainer *v5;
  uint64_t v6;
  NSMutableDictionary *data;
  objc_super v9;

  item = a3.item;
  v9.receiver = self;
  v9.super_class = (Class)KCContainer;
  v4 = -[KCContainer init](&v9, sel_init, a3.item, a3.end);
  v5 = v4;
  if (v4)
  {
    v4->_type = item[1].type;
    v4->_tag = item->flags;
    v6 = objc_opt_new();
    data = v5->_data;
    v5->_data = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (void)omit
{
  NSMutableDictionary *data;

  data = self->_data;
  self->_data = 0;

}

- (unsigned)type
{
  return self->_type;
}

- (unint64_t)tag
{
  return self->_tag;
}

- (NSMutableDictionary)data
{
  return self->_data;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSMutableDictionary)truncated_threads
{
  return self->_truncated_threads;
}

- (int)unindexed_frames
{
  return self->_unindexed_frames;
}

- (void)setUnindexed_frames:(int)a3
{
  self->_unindexed_frames = a3;
}

- (int)invalid_images
{
  return self->_invalid_images;
}

- (void)setInvalid_images:(int)a3
{
  self->_invalid_images = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncated_threads, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
