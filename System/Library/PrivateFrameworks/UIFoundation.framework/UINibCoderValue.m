@implementation UINibCoderValue

+ (id)nibValueForObjectReference:(int64_t)a3 key:(id)a4 scope:(unsigned int)a5
{
  UINibCoderValue *v8;

  v8 = objc_alloc_init(UINibCoderValue);
  v8->type = 10;
  v8->value.integerValue = a3;
  v8->key = (NSString *)objc_msgSend(a4, "copy");
  v8->scope = a5;
  return v8;
}

+ (id)nibValueForInt8:(unsigned __int8)a3 key:(id)a4 scope:(unsigned int)a5
{
  unsigned int v7;
  UINibCoderValue *v8;

  v7 = a3;
  v8 = objc_alloc_init(UINibCoderValue);
  v8->type = 0;
  v8->value.integerValue = v7;
  v8->key = (NSString *)objc_msgSend(a4, "copy");
  v8->scope = a5;
  return v8;
}

+ (id)nibValueForInt16:(unsigned __int16)a3 key:(id)a4 scope:(unsigned int)a5
{
  unsigned int v7;
  UINibCoderValue *v8;

  v7 = a3;
  v8 = objc_alloc_init(UINibCoderValue);
  v8->type = 1;
  v8->value.integerValue = v7;
  v8->key = (NSString *)objc_msgSend(a4, "copy");
  v8->scope = a5;
  return v8;
}

+ (id)nibValueForInt32:(unsigned int)a3 key:(id)a4 scope:(unsigned int)a5
{
  UINibCoderValue *v8;

  v8 = objc_alloc_init(UINibCoderValue);
  v8->type = 2;
  v8->value.integerValue = a3;
  v8->key = (NSString *)objc_msgSend(a4, "copy");
  v8->scope = a5;
  return v8;
}

+ (id)nibValueForInt64:(unint64_t)a3 key:(id)a4 scope:(unsigned int)a5
{
  UINibCoderValue *v8;

  v8 = objc_alloc_init(UINibCoderValue);
  v8->type = 3;
  v8->value.integerValue = a3;
  v8->key = (NSString *)objc_msgSend(a4, "copy");
  v8->scope = a5;
  return v8;
}

+ (id)nibValueForInteger:(unint64_t)a3 key:(id)a4 scope:(unsigned int)a5
{
  if (a3 <= 0x7F)
    return (id)objc_msgSend(a1, "nibValueForInt8:key:scope:", a3, a4, *(_QWORD *)&a5);
  if (!(a3 >> 15))
    return (id)objc_msgSend(a1, "nibValueForInt16:key:scope:", (unsigned __int16)a3, a4, *(_QWORD *)&a5);
  if (a3 >> 31)
    return (id)objc_msgSend(a1, "nibValueForInt64:key:scope:");
  return (id)objc_msgSend(a1, "nibValueForInt32:key:scope:");
}

+ (id)nibValueForBoolean:(BOOL)a3 key:(id)a4 scope:(unsigned int)a5
{
  _BOOL4 v7;
  UINibCoderValue *v8;
  UINibCoderValue *v9;
  char v10;

  v7 = a3;
  v8 = objc_alloc_init(UINibCoderValue);
  v9 = v8;
  if (v7)
    v10 = 5;
  else
    v10 = 4;
  v8->type = v10;
  v8->value.integerValue = v7;
  v8->key = (NSString *)objc_msgSend(a4, "copy");
  v9->scope = a5;
  return v9;
}

+ (id)nibValueForDouble:(double)a3 key:(id)a4 scope:(unsigned int)a5
{
  UINibCoderValue *v8;

  v8 = objc_alloc_init(UINibCoderValue);
  v8->type = 7;
  v8->value.doubleValue = a3;
  v8->key = (NSString *)objc_msgSend(a4, "copy");
  v8->scope = a5;
  return v8;
}

+ (id)nibValueForFloat:(float)a3 key:(id)a4 scope:(unsigned int)a5
{
  UINibCoderValue *v8;

  v8 = objc_alloc_init(UINibCoderValue);
  v8->type = 6;
  v8->value.floatValue = a3;
  v8->key = (NSString *)objc_msgSend(a4, "copy");
  v8->scope = a5;
  return v8;
}

+ (id)nibValueForBytes:(const void *)a3 length:(unint64_t)a4 key:(id)a5 scope:(unsigned int)a6
{
  void *v10;
  UINibCoderValue *v11;

  v10 = malloc_type_malloc(a4, 0xF240009DuLL);
  memcpy(v10, a3, a4);
  v11 = objc_alloc_init(UINibCoderValue);
  v11->type = 8;
  v11->value.integerValue = (unint64_t)v10;
  v11->key = (NSString *)objc_msgSend(a5, "copy");
  v11->length = a4;
  v11->scope = a6;
  return v11;
}

+ (id)nibValueRepresentingNilReferenceForKey:(id)a3 scope:(unsigned int)a4
{
  UINibCoderValue *v6;

  v6 = objc_alloc_init(UINibCoderValue);
  v6->type = 9;
  v6->key = (NSString *)objc_msgSend(a3, "copy");
  v6->scope = a4;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->type == 8)
    free(self->value.bytesValue);
  v3.receiver = self;
  v3.super_class = (Class)UINibCoderValue;
  -[UINibCoderValue dealloc](&v3, sel_dealloc);
}

- (unint64_t)byteLength
{
  unint64_t type;
  unint64_t result;

  type = self->type;
  if (type > 0xA)
    goto LABEL_5;
  result = UIFixedByteLengthForType_table[type];
  if (result == -1)
    return self->length;
  if (result == -2)
LABEL_5:
    -[UINibCoderValue byteLength].cold.1();
  return result;
}

- (void)byteLength
{
  __assert_rtn("-[UINibCoderValue byteLength]", "UINibCoderValue.m", 177, "typeLength != -2 && \"UIFixedByteLengthForType is out of date.\");
}

@end
