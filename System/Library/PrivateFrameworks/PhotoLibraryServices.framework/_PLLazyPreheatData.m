@implementation _PLLazyPreheatData

- (_PLLazyPreheatData)initWithContentsOfFile:(id)a3
{
  id v5;
  _PLLazyPreheatData *v6;
  _PLLazyPreheatData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PLLazyPreheatData;
  v6 = -[_PLLazyPreheatData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_path, a3);

  return v7;
}

- (void)_loadData
{
  id v3;
  NSString *path;
  NSData *v5;
  id v6;
  NSData *data;
  id v8;

  if (!self->_data)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D50]);
    path = self->_path;
    v8 = 0;
    v5 = (NSData *)objc_msgSend(v3, "initWithContentsOfFile:options:error:", path, 2, &v8);
    v6 = v8;
    data = self->_data;
    self->_data = v5;

  }
}

- (unint64_t)length
{
  -[_PLLazyPreheatData _loadData](self, "_loadData");
  return -[NSData length](self->_data, "length");
}

- (const)bytes
{
  -[_PLLazyPreheatData _loadData](self, "_loadData");
  return -[NSData bytes](self->_data, "bytes");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

+ (id)dataWithContentsOfFile:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContentsOfFile:", v3);

  return v4;
}

@end
