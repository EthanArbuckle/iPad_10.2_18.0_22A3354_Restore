@implementation TCMPSInstanceNormalizationDescriptor

- (TCMPSInstanceNormalizationDescriptor)init
{
  TCMPSInstanceNormalizationDescriptor *v2;
  NSString *v3;
  NSString *label;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TCMPSInstanceNormalizationDescriptor;
  v2 = -[TCMPSInstanceNormalizationDescriptor init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSString *)objc_alloc_init(MEMORY[0x24BDD17C8]);
    label = v2->_label;
    v2->_label = v3;

  }
  return v2;
}

- (unint64_t)channels
{
  return self->_channels;
}

- (void)setChannels:(unint64_t)a3
{
  self->_channels = a3;
}

- (unint64_t)styles
{
  return self->_styles;
}

- (void)setStyles:(unint64_t)a3
{
  self->_styles = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
