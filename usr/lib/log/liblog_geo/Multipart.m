@implementation Multipart

- (id)copyWithIndex:(unsigned __int8)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)result + 1) = self->identifier;
  *((_BYTE *)result + 16) = a3;
  *((_BYTE *)result + 17) = self->partCount;
  return result;
}

- (unint64_t)hash
{
  return self->identifier ^ self->partIndex ^ ((unint64_t)self->partCount << 8);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[Multipart isEqualToMultipart:](self, "isEqualToMultipart:", v4);

  return v5;
}

- (BOOL)isEqualToMultipart:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = v4[1] == self->identifier
    && *((unsigned __int8 *)v4 + 17) == self->partCount
    && *((unsigned __int8 *)v4 + 16) == self->partIndex;

  return v5;
}

@end
