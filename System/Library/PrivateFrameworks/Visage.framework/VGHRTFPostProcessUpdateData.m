@implementation VGHRTFPostProcessUpdateData

- (id)initEmpty
{
  VGHRTFPostProcessUpdateData *v2;
  VGHRTFPostProcessUpdateData *v3;
  VGHRTFPostProcessUpdateData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VGHRTFPostProcessUpdateData;
  v2 = -[VGHRTFPostProcessUpdateData init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSData)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
}

@end
