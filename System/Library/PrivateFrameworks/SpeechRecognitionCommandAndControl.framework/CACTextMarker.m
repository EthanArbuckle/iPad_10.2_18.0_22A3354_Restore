@implementation CACTextMarker

+ (id)markerWithIndex:(unint64_t)a3
{
  return (id)objc_msgSend(objc_allocWithZone((Class)CACTextMarker), "initWithIndex:", a3);
}

+ (id)markerWithData:(id)a3
{
  id v3;
  void *v4;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_msgSend(objc_allocWithZone((Class)CACTextMarker), "initWithData:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)marker:(id)a3 precedesOrEqualsMarker:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "index") == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "index") == 0x7FFFFFFFFFFFFFFFLL)
  {
    CACLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CACTextMarker marker:precedesOrEqualsMarker:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = 0;
  }
  else
  {
    v16 = objc_msgSend(v5, "index");
    v15 = v16 < objc_msgSend(v6, "index");
  }

  return v15;
}

+ (unint64_t)lengthFromMarker:(id)a3 toMarker:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "index") == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "index") == 0x7FFFFFFFFFFFFFFFLL)
  {
    CACLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CACTextMarker lengthFromMarker:toMarker:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v16 = objc_msgSend(v6, "index");
    v15 = v16 - objc_msgSend(v5, "index");
  }

  return v15;
}

+ (BOOL)marker:(id)a3 precedesMarker:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(a3, "index");
  v7 = objc_msgSend(v5, "index");

  return v6 < v7;
}

- (CACTextMarker)initWithData:(id)a3
{
  id v5;
  CACTextMarker *v6;
  CACTextMarker *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CACTextMarker;
  v6 = -[CACTextMarker init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_index = 0;
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (CACTextMarker)initWithIndex:(unint64_t)a3
{
  CACTextMarker *v4;
  CACTextMarker *v5;
  NSData *data;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CACTextMarker;
  v4 = -[CACTextMarker init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    data = v4->_data;
    v4->_index = a3;
    v4->_data = 0;

  }
  return v5;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  NSData *v5;
  NSData **p_data;
  NSData *data;
  NSData *v8;

  v5 = (NSData *)a3;
  data = self->_data;
  p_data = &self->_data;
  if (data != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_data, a3);
    v5 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSData *data;
  CACTextMarker *v5;

  data = self->_data;
  v5 = +[CACTextMarker allocWithZone:](CACTextMarker, "allocWithZone:", a3);
  if (data)
    return -[CACTextMarker initWithData:](v5, "initWithData:", self->_data);
  else
    return -[CACTextMarker initWithIndex:](v5, "initWithIndex:", self->_index);
}

- (unint64_t)hash
{
  NSData *data;

  data = self->_data;
  if (data)
    return CFHash(data);
  else
    return self->_index;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  unint64_t v9;

  v4 = a3;
  if (v4)
  {
    -[CACTextMarker data](self, "data");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5 | v6)
    {
      v8 = 0;
      if (v5 && v6)
        v8 = CFEqual((CFTypeRef)v5, (CFTypeRef)v6) != 0;
    }
    else
    {
      v9 = -[CACTextMarker index](self, "index");
      v8 = v9 == objc_msgSend(v4, "index");
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;

  -[CACTextMarker data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TextMarker (data): %@"), self->_data);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TextMarker: %ld"), self->_index);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

+ (void)marker:(uint64_t)a3 precedesOrEqualsMarker:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_229A40000, a1, a3, "asked if marker precedesOrEqualsMarker with invalid marker index", a5, a6, a7, a8, 0);
}

+ (void)lengthFromMarker:(uint64_t)a3 toMarker:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_229A40000, a1, a3, "asked for range between 2 markers with invalid marker index", a5, a6, a7, a8, 0);
}

@end
