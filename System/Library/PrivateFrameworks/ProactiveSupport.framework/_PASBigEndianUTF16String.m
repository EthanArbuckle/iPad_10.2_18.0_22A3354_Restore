@implementation _PASBigEndianUTF16String

- (unint64_t)length
{
  return self->_length;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  -[_PASBigEndianUTF16String _implGetCharacters:range:](self, a3, a4.location, a4.length);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  unsigned __int16 __dst;

  __dst = 0;
  -[_PASBigEndianUTF16String _implGetCharacters:range:](self, &__dst, a3, 1);
  return __dst;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backingObject, 0);
}

- (_QWORD)_implGetCharacters:(uint64_t)a3 range:(uint64_t)a4
{
  uint64_t v4;
  _WORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (result)
  {
    v4 = a4;
    if ((unint64_t)(a3 + a4) > result[1])
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0C99858];
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Range {%tu, %tu} out of bounds; string length %tu"),
                     a3,
                     a4,
                     result[1]);
      objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v9);
    }
    if (a4)
    {
      v5 = __dst;
      result = memcpy(__dst, (const void *)(result[2] + 2 * a3), 2 * a4);
      do
      {
        *v5 = bswap32((unsigned __int16)*v5) >> 16;
        ++v5;
        --v4;
      }
      while (v4);
    }
  }
  return result;
}

- (id)initWithLength:(void *)a3 buffer:(void *)a4 backingObject:
{
  id v8;
  id *v9;
  objc_super v11;

  v8 = a4;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)_PASBigEndianUTF16String;
    v9 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v9;
    if (v9)
    {
      v9[1] = a2;
      v9[2] = a3;
      objc_storeStrong(v9 + 3, a4);
    }
  }

  return a1;
}

@end
