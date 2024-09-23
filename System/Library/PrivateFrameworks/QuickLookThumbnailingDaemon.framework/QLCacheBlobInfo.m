@implementation QLCacheBlobInfo

- (void)setLocation:(unint64_t)a3
{
  self->location = a3;
}

- (void)setLength:(unint64_t)a3
{
  self->length = a3;
}

- (unint64_t)length
{
  return self->length;
}

- (unint64_t)location
{
  return self->location;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %llu %llu>"), objc_opt_class(), -[QLCacheBlobInfo location](self, "location"), -[QLCacheBlobInfo length](self, "length"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "location");
    if (v6 == -[QLCacheBlobInfo location](self, "location"))
    {
      v7 = objc_msgSend(v5, "length");
      v8 = v7 == -[QLCacheBlobInfo length](self, "length");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->length ^ self->location;
}

@end
