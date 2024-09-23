@implementation CFXBinding

- (void)dealloc
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  objc_super v10;

  objc_msgSend_setSourceObject_(self, a2, 0, v2);
  objc_msgSend_setKeyPathSrc_(self, v4, 0, v5);
  objc_msgSend_setKeyPathDst_(self, v6, 0, v7);
  objc_msgSend_setOptions_(self, v8, 0, v9);
  v10.receiver = self;
  v10.super_class = (Class)CFXBinding;
  -[CFXBinding dealloc](&v10, sel_dealloc);
}

- (id)sourceObject
{
  return self->sourceObject;
}

- (void)setSourceObject:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)keyPathSrc
{
  return self->keyPathSrc;
}

- (void)setKeyPathSrc:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)keyPathDst
{
  return self->keyPathDst;
}

- (void)setKeyPathDst:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSDictionary)options
{
  return self->options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
