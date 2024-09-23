@implementation TTSStringEnum

- (BOOL)isEqual:(id)a3
{
  return sub_19AD53274(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))TTSStringEnum.isEqual(_:));
}

- (id)description
{
  return self->_string;
}

- (int64_t)hash
{
  TTSStringEnum *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  TTSStringEnum.hash.getter();
  v4 = v3;

  return v4;
}

- (NSString)string
{
  return self->_string;
}

- (TTSStringEnum)initWithString:(id)a3
{
  id v3;
  TTSStringEnum *v4;
  uint64_t v5;
  NSString *string;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TTSStringEnum;
  v3 = a3;
  v4 = -[TTSStringEnum init](&v8, sel_init);
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  string = v4->_string;
  v4->_string = (NSString *)v5;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
