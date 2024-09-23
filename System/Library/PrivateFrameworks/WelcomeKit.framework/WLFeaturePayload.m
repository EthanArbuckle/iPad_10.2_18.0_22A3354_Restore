@implementation WLFeaturePayload

- (WLFeaturePayload)init
{
  WLFeaturePayload *v2;
  WLFeaturePayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLFeaturePayload;
  v2 = -[WLFeaturePayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[WLFeaturePayload setState:](v2, "setState:", CFSTR("?"));
  return v3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(unint64_t)a3
{
  self->_elapsedTime = a3;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

@end
