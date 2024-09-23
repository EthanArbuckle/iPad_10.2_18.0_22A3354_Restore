@implementation __SwiftNull

- (id)description
{
  objc_class *v3;
  const char *Name;
  const char *v5;
  char *v6;
  size_t v7;
  void *v8;
  char *__s;

  __s = 0;
  v3 = (objc_class *)objc_opt_class();
  Name = class_getName(v3);
  swift_asprintf(&__s, v5, Name, self, self->depth);
  v6 = __s;
  v7 = strlen(__s);
  v8 = (void *)swift_stdlib_NSStringFromUTF8((uint8x16_t *)__s, v7);
  free(v6);
  return v8;
}

@end
