@implementation TransparencyGPBEnumArray

+ (id)array
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithValidationFunction:", 0);
}

+ (id)arrayWithValidationFunction:(void *)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithValidationFunction:", a3);
}

+ (id)arrayWithValidationFunction:(void *)a3 rawValue:(int)a4
{
  int v5;

  v5 = a4;
  return objc_msgSend(objc_alloc((Class)a1), "initWithValidationFunction:rawValues:count:", a3, &v5, 1);
}

+ (id)arrayWithValueArray:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithValueArray:", a3);
}

+ (id)arrayWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithValidationFunction:capacity:", a3, a4);
}

- (TransparencyGPBEnumArray)init
{
  return -[TransparencyGPBEnumArray initWithValidationFunction:](self, "initWithValidationFunction:", 0);
}

- (TransparencyGPBEnumArray)initWithValueArray:(id)a3
{
  return -[TransparencyGPBEnumArray initWithValidationFunction:rawValues:count:](self, "initWithValidationFunction:rawValues:count:", *((_QWORD *)a3 + 2), *((_QWORD *)a3 + 3), *((_QWORD *)a3 + 4));
}

- (TransparencyGPBEnumArray)initWithValidationFunction:(void *)a3
{
  TransparencyGPBEnumArray *result;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransparencyGPBEnumArray;
  result = -[TransparencyGPBEnumArray init](&v6, "init");
  if (result)
  {
    v5 = sub_1000DB130;
    if (a3)
      v5 = a3;
    result->_validationFunc = v5;
  }
  return result;
}

- (TransparencyGPBEnumArray)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 count:(unint64_t)a5
{
  TransparencyGPBEnumArray *v7;
  TransparencyGPBEnumArray *v8;
  int *v9;

  v7 = -[TransparencyGPBEnumArray initWithValidationFunction:](self, "initWithValidationFunction:", a3);
  v8 = v7;
  if (v7 && a4 && a5)
  {
    v9 = (int *)reallocf(v7->_values, 4 * a5);
    v8->_values = v9;
    if (v9)
    {
      v8->_capacity = a5;
      memcpy(v9, a4, 4 * a5);
      v8->_count = a5;
    }
    else
    {

      +[NSException raise:format:](NSException, "raise:format:", NSMallocException, CFSTR("Failed to allocate %lu bytes"), 4 * a5);
    }
  }
  return v8;
}

- (TransparencyGPBEnumArray)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  TransparencyGPBEnumArray *v5;
  TransparencyGPBEnumArray *v6;

  v5 = -[TransparencyGPBEnumArray initWithValidationFunction:](self, "initWithValidationFunction:", a3);
  v6 = v5;
  if (a4 && v5)
    -[TransparencyGPBEnumArray internalResizeToCapacity:](v5, "internalResizeToCapacity:", a4);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBEnumArray initWithValidationFunction:rawValues:count:](+[TransparencyGPBEnumArray allocWithZone:](TransparencyGPBEnumArray, "allocWithZone:", a3), "initWithValidationFunction:rawValues:count:", self->_validationFunc, self->_values, self->_count);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_values);
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBEnumArray;
  -[TransparencyGPBEnumArray dealloc](&v3, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  unint64_t count;
  BOOL result;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBEnumArray, a2);
  result = (objc_opt_isKindOfClass(a3, v5) & 1) != 0
        && (count = self->_count, count == *((_QWORD *)a3 + 4))
        && memcmp(self->_values, *((const void **)a3 + 3), 4 * count) == 0;
  return result;
}

- (unint64_t)hash
{
  return self->_count;
}

- (id)description
{
  NSMutableString *v3;
  unint64_t count;
  uint64_t i;
  const __CFString *v6;

  v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@ %p> { "), objc_opt_class(self, a2), self);
  count = self->_count;
  if (count)
  {
    for (i = 0; i != count; ++i)
    {
      if (i)
        v6 = CFSTR(", %d");
      else
        v6 = CFSTR("%d");
      -[NSMutableString appendFormat:](v3, "appendFormat:", v6, self->_values[i]);
    }
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" }"));
  return v3;
}

- (void)enumerateRawValuesWithBlock:(id)a3
{
  -[TransparencyGPBEnumArray enumerateRawValuesWithOptions:usingBlock:](self, "enumerateRawValuesWithOptions:usingBlock:", 0, a3);
}

- (void)enumerateRawValuesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  unint64_t count;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  char v11;

  v11 = 0;
  count = self->_count;
  if ((a3 & 2) != 0)
  {
    if (count)
    {
      v10 = count - 1;
      do
      {
        if (v10 == -1)
          break;
        (*((void (**)(id, _QWORD, unint64_t, char *))a4 + 2))(a4, self->_values[v10], v10, &v11);
        --v10;
      }
      while (!v11);
    }
  }
  else if (count)
  {
    v7 = 0;
    v8 = count - 1;
    do
    {
      (*((void (**)(id, _QWORD, uint64_t, char *))a4 + 2))(a4, self->_values[v7], v7, &v11);
      if (v11)
        v9 = 1;
      else
        v9 = v8 == v7;
      ++v7;
    }
    while (!v9);
  }
}

- (int)valueAtIndex:(unint64_t)a3
{
  unint64_t count;
  uint64_t v6;

  count = self->_count;
  if (count <= a3)
    +[NSException raise:format:](NSException, "raise:format:", NSRangeException, CFSTR("Index (%lu) beyond bounds (%lu)"), a3, count);
  v6 = self->_values[a3];
  if (((unsigned int (*)(uint64_t))self->_validationFunc)(v6))
    return v6;
  else
    return -72499473;
}

- (int)rawValueAtIndex:(unint64_t)a3
{
  unint64_t count;

  count = self->_count;
  if (count <= a3)
    +[NSException raise:format:](NSException, "raise:format:", NSRangeException, CFSTR("Index (%lu) beyond bounds (%lu)"), a3, count);
  return self->_values[a3];
}

- (void)enumerateValuesWithBlock:(id)a3
{
  -[TransparencyGPBEnumArray enumerateValuesWithOptions:usingBlock:](self, "enumerateValuesWithOptions:usingBlock:", 0, a3);
}

- (void)enumerateValuesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  unsigned int (*validationFunc)(_QWORD, SEL);
  int64_t v6;
  uint64_t v7;
  int *v8;
  int *v9;
  int *v10;
  unsigned int v11;
  uint64_t v12;
  BOOL v13;
  unint64_t count;
  unint64_t v15;
  int *values;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  BOOL v20;
  char v21;

  v21 = 0;
  validationFunc = (unsigned int (*)(_QWORD, SEL))self->_validationFunc;
  if ((a3 & 2) != 0)
  {
    count = self->_count;
    if (count)
    {
      v15 = count - 1;
      if ((uint64_t)(count - 1) >= 0)
      {
        values = self->_values;
        v17 = (unint64_t)&values[count - 2];
        do
        {
          v18 = *(_DWORD *)(v17 + 4);
          if (validationFunc(v18, a2))
            v19 = v18;
          else
            v19 = 4222467823;
          (*((void (**)(id, uint64_t, unint64_t, char *))a4 + 2))(a4, v19, v15--, &v21);
          if (v21)
            v20 = 0;
          else
            v20 = v17 >= (unint64_t)values;
          v17 -= 4;
        }
        while (v20);
      }
    }
  }
  else
  {
    v6 = self->_count;
    if (v6 >= 1)
    {
      v7 = 0;
      v8 = self->_values;
      v9 = &v8[v6];
      v10 = v8 + 1;
      do
      {
        v11 = *(v10 - 1);
        if (validationFunc(v11, a2))
          v12 = v11;
        else
          v12 = 4222467823;
        (*((void (**)(id, uint64_t, uint64_t, char *))a4 + 2))(a4, v12, v7++, &v21);
        if (v21)
          v13 = 1;
        else
          v13 = v10 >= v9;
        ++v10;
      }
      while (!v13);
    }
  }
}

- (void)internalResizeToCapacity:(unint64_t)a3
{
  unint64_t v5;
  int *v6;

  v5 = 4 * a3;
  v6 = (int *)reallocf(self->_values, 4 * a3);
  self->_values = v6;
  if (!v6)
  {
    self->_count = 0;
    self->_capacity = 0;
    +[NSException raise:format:](NSException, "raise:format:", NSMallocException, CFSTR("Failed to allocate %lu bytes"), v5);
  }
  self->_capacity = a3;
}

- (void)addRawValue:(int)a3
{
  int v3;

  v3 = a3;
  -[TransparencyGPBEnumArray addRawValues:count:](self, "addRawValues:count:", &v3, 1);
}

- (void)addRawValues:(const int *)a3 count:(unint64_t)a4
{
  unint64_t count;
  unint64_t v8;
  TransparencyGPBMessage *autocreator;

  if (a3 && a4)
  {
    count = self->_count;
    v8 = count + a4;
    if (count + a4 > self->_capacity)
      -[TransparencyGPBEnumArray internalResizeToCapacity:](self, "internalResizeToCapacity:", (v8 & 0xFFFFFFFFFFFFFFF0) + 16);
    self->_count = v8;
    memcpy(&self->_values[count], a3, 4 * a4);
    autocreator = self->_autocreator;
    if (autocreator)
      sub_1000FE314(autocreator, (uint64_t)self);
  }
}

- (void)insertRawValue:(int)a3 atIndex:(unint64_t)a4
{
  unint64_t count;
  unint64_t v8;
  TransparencyGPBMessage *autocreator;

  count = self->_count;
  v8 = count + 1;
  if (count + 1 <= a4)
  {
    +[NSException raise:format:](NSException, "raise:format:", NSRangeException, CFSTR("Index (%lu) beyond bounds (%lu)"), a4, count + 1);
    count = self->_count;
    v8 = count + 1;
  }
  if (v8 > self->_capacity)
    -[TransparencyGPBEnumArray internalResizeToCapacity:](self, "internalResizeToCapacity:", (v8 & 0xFFFFFFFFFFFFFFF0) + 16);
  self->_count = v8;
  if (count != a4)
    memmove(&self->_values[a4 + 1], &self->_values[a4], 4 * (count - a4));
  self->_values[a4] = a3;
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000FE314(autocreator, (uint64_t)self);
}

- (void)replaceValueAtIndex:(unint64_t)a3 withRawValue:(int)a4
{
  unint64_t count;

  count = self->_count;
  if (count <= a3)
    +[NSException raise:format:](NSException, "raise:format:", NSRangeException, CFSTR("Index (%lu) beyond bounds (%lu)"), a3, count);
  self->_values[a3] = a4;
}

- (void)addRawValuesFromArray:(id)a3
{
  -[TransparencyGPBEnumArray addRawValues:count:](self, "addRawValues:count:", *((_QWORD *)a3 + 3), *((_QWORD *)a3 + 4));
}

- (void)removeValueAtIndex:(unint64_t)a3
{
  unint64_t count;
  unint64_t v6;

  count = self->_count;
  if (count <= a3)
  {
    +[NSException raise:format:](NSException, "raise:format:", NSRangeException, CFSTR("Index (%lu) beyond bounds (%lu)"), a3, count);
    count = self->_count;
  }
  v6 = count - 1;
  if (count - 1 != a3)
    memmove(&self->_values[a3], &self->_values[a3 + 1], 4 * (count - 1 - a3));
  self->_count = v6;
  if (count + 31 < self->_capacity)
    -[TransparencyGPBEnumArray internalResizeToCapacity:](self, "internalResizeToCapacity:", (v6 & 0xFFFFFFFFFFFFFFF0) + 16);
}

- (void)removeAll
{
  self->_count = 0;
  if (self->_capacity >= 0x21)
    -[TransparencyGPBEnumArray internalResizeToCapacity:](self, "internalResizeToCapacity:", 16);
}

- (void)exchangeValueAtIndex:(unint64_t)a3 withValueAtIndex:(unint64_t)a4
{
  unint64_t count;
  int *values;
  int v9;

  count = self->_count;
  if (count <= a3)
  {
    +[NSException raise:format:](NSException, "raise:format:", NSRangeException, CFSTR("Index (%lu) beyond bounds (%lu)"), a3, count);
    count = self->_count;
  }
  if (count <= a4)
    +[NSException raise:format:](NSException, "raise:format:", NSRangeException, CFSTR("Index (%lu) beyond bounds (%lu)"), a4, count);
  values = self->_values;
  v9 = values[a3];
  values[a3] = values[a4];
  values[a4] = v9;
}

- (void)addValue:(int)a3
{
  int v3;

  v3 = a3;
  -[TransparencyGPBEnumArray addValues:count:](self, "addValues:count:", &v3, 1);
}

- (void)addValues:(const int *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t (*validationFunc)(_QWORD, SEL);
  unint64_t count;
  unint64_t v10;
  TransparencyGPBMessage *autocreator;

  if (a3 && a4)
  {
    v7 = 0;
    validationFunc = (uint64_t (*)(_QWORD, SEL))self->_validationFunc;
    do
    {
      if ((validationFunc(a3[v7], a2) & 1) == 0)
        +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("%@: Attempt to set an unknown enum value (%d)"), objc_opt_class(self, a2), a3[v7]);
      ++v7;
    }
    while (a4 != v7);
    count = self->_count;
    v10 = count + a4;
    if (count + a4 > self->_capacity)
      -[TransparencyGPBEnumArray internalResizeToCapacity:](self, "internalResizeToCapacity:", (v10 & 0xFFFFFFFFFFFFFFF0) + 16);
    self->_count = v10;
    memcpy(&self->_values[count], a3, 4 * a4);
    autocreator = self->_autocreator;
    if (autocreator)
      sub_1000FE314(autocreator, (uint64_t)self);
  }
}

- (void)insertValue:(int)a3 atIndex:(unint64_t)a4
{
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  unint64_t count;
  unint64_t v10;
  TransparencyGPBMessage *autocreator;

  v5 = *(_QWORD *)&a3;
  v7 = self->_count + 1;
  if (v7 <= a4)
    +[NSException raise:format:](NSException, "raise:format:", NSRangeException, CFSTR("Index (%lu) beyond bounds (%lu)"), a4, v7);
  if ((((uint64_t (*)(uint64_t))self->_validationFunc)(v5) & 1) == 0)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("%@: Attempt to set an unknown enum value (%d)"), objc_opt_class(self, v8), v5);
  count = self->_count;
  v10 = count + 1;
  if (count + 1 > self->_capacity)
    -[TransparencyGPBEnumArray internalResizeToCapacity:](self, "internalResizeToCapacity:", (v10 & 0xFFFFFFFFFFFFFFF0) + 16);
  self->_count = v10;
  if (count != a4)
    memmove(&self->_values[a4 + 1], &self->_values[a4], 4 * (count - a4));
  self->_values[a4] = v5;
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000FE314(autocreator, (uint64_t)self);
}

- (void)replaceValueAtIndex:(unint64_t)a3 withValue:(int)a4
{
  uint64_t v4;
  unint64_t count;
  uint64_t v8;

  v4 = *(_QWORD *)&a4;
  count = self->_count;
  if (count <= a3)
    +[NSException raise:format:](NSException, "raise:format:", NSRangeException, CFSTR("Index (%lu) beyond bounds (%lu)"), a3, count);
  if ((((uint64_t (*)(uint64_t))self->_validationFunc)(v4) & 1) == 0)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("%@: Attempt to set an unknown enum value (%d)"), objc_opt_class(self, v8), v4);
  self->_values[a3] = v4;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)validationFunc
{
  return self->_validationFunc;
}

@end
