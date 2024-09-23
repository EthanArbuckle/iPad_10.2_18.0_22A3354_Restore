@implementation VKInternedString

- (VKInternedString)initWithString:(id)a3
{
  objc_storeStrong((id *)&self->original, a3);
  return self;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)_lock, "lock");
  objc_msgSend((id)_strings, "removeObject:", self);
  objc_msgSend((id)_lock, "unlock");
  v3.receiver = self;
  v3.super_class = (Class)VKInternedString;
  -[VKInternedString dealloc](&v3, sel_dealloc);
}

- (unint64_t)length
{
  return -[NSString length](self->original, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->original, "characterAtIndex:", a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  -[NSString getCharacters:range:](self->original, "getCharacters:range:", a3, a4.location, a4.length);
}

- (id)substringFromIndex:(unint64_t)a3
{
  return -[NSString substringFromIndex:](self->original, "substringFromIndex:", a3);
}

- (id)substringToIndex:(unint64_t)a3
{
  return -[NSString substringToIndex:](self->original, "substringToIndex:", a3);
}

- (id)substringWithRange:(_NSRange)a3
{
  return -[NSString substringWithRange:](self->original, "substringWithRange:", a3.location, a3.length);
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  return -[NSString compare:options:range:locale:](self->original, "compare:options:range:locale:", a3, a4, a5.location, a5.length, a6);
}

- (BOOL)isEqualToString:(id)a3
{
  return -[NSString isEqualToString:](self->original, "isEqualToString:", a3);
}

- (unint64_t)hash
{
  return -[NSString hash](self->original, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->original, 0);
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(MEMORY[0x1E0C99E20], "_vk_newWeakSet");
    v3 = (void *)_strings;
    _strings = v2;

    v4 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    v5 = (void *)_lock;
    _lock = (uint64_t)v4;

  }
}

+ (id)stringWithString:(id)a3
{
  id v3;
  VKInternedString *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (VKInternedString *)v3;
  }
  else
  {
    objc_msgSend((id)_lock, "lock");
    objc_msgSend((id)_strings, "member:", v3);
    v4 = (VKInternedString *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = -[VKInternedString initWithString:]([VKInternedString alloc], "initWithString:", v3);
      objc_msgSend((id)_strings, "addObject:");
    }
    objc_msgSend((id)_lock, "unlock");
  }

  return v4;
}

@end
