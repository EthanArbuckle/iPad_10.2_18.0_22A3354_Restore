@implementation PBMutableData

- (void)dealloc
{
  objc_super v3;

  free(self->buffer);
  v3.receiver = self;
  v3.super_class = (Class)PBMutableData;
  -[PBMutableData dealloc](&v3, sel_dealloc);
}

- (const)bytes
{
  return self->buffer;
}

- (PBMutableData)initWithCapacity:(unint64_t)a3
{
  PBMutableData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBMutableData;
  v4 = -[PBMutableData init](&v6, sel_init);
  -[PBMutableData _pb_growCapacityBy:](v4, a3);
  return v4;
}

- (void)_pb_growCapacityBy:(_QWORD *)a1
{
  uint64_t v4;
  void *v5;
  size_t v6;
  char *v7;
  void *v8;

  if (a1)
  {
    v4 = objc_msgSend(a1, "length");
    v5 = (void *)a1[2];
    v6 = a1[3] - (_QWORD)v5 + a2;
    v7 = (char *)malloc_type_realloc(v5, v6, 0x23805BA3uLL);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    a1[2] = v7;
    a1[3] = &v7[v6];
    a1[1] = &v7[v4];
  }
}

- (unint64_t)length
{
  return self->p - self->buffer;
}

- (void)setLength:(unint64_t)a3
{
  char *buffer;
  char *v6;

  buffer = self->buffer;
  v6 = (char *)(self->end - buffer);
  if (a3 > (unint64_t)v6)
  {
    -[PBMutableData _pb_growCapacityBy:](self, a3 - (_QWORD)v6);
    buffer = self->buffer;
  }
  self->p = &buffer[a3];
}

- (void)mutableBytes
{
  return self->buffer;
}

@end
