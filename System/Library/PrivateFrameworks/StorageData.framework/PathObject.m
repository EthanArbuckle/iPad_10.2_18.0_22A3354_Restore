@implementation PathObject

- (PathObject)initWithPath:(const char *)a3 component:(const char *)a4
{
  PathObject *v6;
  PathObject *v7;
  const char *v8;
  uint64_t *p_path;
  const char *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PathObject *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PathObject;
  v6 = -[PathObject init](&v20, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  v8 = "/";
  p_path = (uint64_t *)&v6->_path;
  v10 = "";
  if (a4)
    v10 = a4;
  else
    v8 = "";
  v11 = asprintf(&v6->_path, "%s%s%s", a3, v8, v10);
  v7->_len = v11;
  if (v11 == -1 || !*p_path)
    goto LABEL_9;
  if (v11 < 1024)
  {
LABEL_10:
    v18 = v7;
    goto LABEL_11;
  }
  STLog(2, CFSTR("path too long: %s"), v12, v13, v14, v15, v16, v17, *p_path);
  free((void *)*p_path);
LABEL_9:
  v18 = 0;
LABEL_11:

  return v18;
}

+ (id)pathObjectWithPath:(const char *)a3 component:(const char *)a4
{
  return -[PathObject initWithPath:component:]([PathObject alloc], "initWithPath:component:", a3, a4);
}

- (void)dealloc
{
  char *path;
  objc_super v4;

  path = self->_path;
  if (path)
    free(path);
  v4.receiver = self;
  v4.super_class = (Class)PathObject;
  -[PathObject dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", -[PathObject path](self, "path"));
}

- (char)path
{
  return self->_path;
}

- (int)len
{
  return self->_len;
}

@end
