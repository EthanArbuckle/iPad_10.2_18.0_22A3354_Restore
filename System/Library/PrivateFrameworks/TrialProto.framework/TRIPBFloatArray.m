@implementation TRIPBFloatArray

+ (id)array
{
  return objc_alloc_init((Class)a1);
}

+ (id)arrayWithValue:(float)a3
{
  float v4;

  v4 = a3;
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithValues:count:", &v4, 1);
}

+ (id)arrayWithValueArray:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithValueArray:", a3);
}

+ (id)arrayWithCapacity:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCapacity:", a3);
}

- (TRIPBFloatArray)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIPBFloatArray;
  return -[TRIPBFloatArray init](&v3, sel_init);
}

- (TRIPBFloatArray)initWithValueArray:(id)a3
{
  return -[TRIPBFloatArray initWithValues:count:](self, "initWithValues:count:", *((_QWORD *)a3 + 2), *((_QWORD *)a3 + 3));
}

- (TRIPBFloatArray)initWithValues:(const float *)a3 count:(unint64_t)a4
{
  TRIPBFloatArray *v6;
  TRIPBFloatArray *v7;
  float *v8;

  v6 = -[TRIPBFloatArray init](self, "init");
  v7 = v6;
  if (v6 && a3 && a4)
  {
    v8 = (float *)reallocf(v6->_values, 4 * a4);
    v7->_values = v8;
    if (v8)
    {
      v7->_capacity = a4;
      memcpy(v8, a3, 4 * a4);
      v7->_count = a4;
    }
    else
    {

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99850], CFSTR("Failed to allocate %lu bytes"), 4 * a4);
    }
  }
  return v7;
}

- (TRIPBFloatArray)initWithCapacity:(unint64_t)a3
{
  TRIPBFloatArray *v4;
  TRIPBFloatArray *v5;

  v4 = -[TRIPBFloatArray initWithValues:count:](self, "initWithValues:count:", 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[TRIPBFloatArray internalResizeToCapacity:](v4, "internalResizeToCapacity:", a3);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TRIPBFloatArray initWithValues:count:](+[TRIPBFloatArray allocWithZone:](TRIPBFloatArray, "allocWithZone:", a3), "initWithValues:count:", self->_values, self->_count);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_autocreator)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBArray.m"), 1365, CFSTR("%@: Autocreator must be cleared before release, autocreator: %@"), objc_opt_class(), self->_autocreator);
  free(self->_values);
  v3.receiver = self;
  v3.super_class = (Class)TRIPBFloatArray;
  -[TRIPBFloatArray dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t count;
  BOOL result;

  if (self == a3)
    return 1;
  objc_opt_class();
  result = (objc_opt_isKindOfClass() & 1) != 0
        && (count = self->_count, count == *((_QWORD *)a3 + 3))
        && memcmp(self->_values, *((const void **)a3 + 2), 4 * count) == 0;
  return result;
}

- (unint64_t)hash
{
  return self->_count;
}

- (id)description
{
  void *v3;
  unint64_t count;
  uint64_t i;
  const __CFString *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p> { "), objc_opt_class(), self);
  count = self->_count;
  if (count)
  {
    for (i = 0; i != count; ++i)
    {
      if (i)
        v6 = CFSTR(", %f");
      else
        v6 = CFSTR("%f");
      objc_msgSend(v3, "appendFormat:", v6, self->_values[i]);
    }
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" }"));
  return v3;
}

- (void)enumerateValuesWithBlock:(id)a3
{
  -[TRIPBFloatArray enumerateValuesWithOptions:usingBlock:](self, "enumerateValuesWithOptions:usingBlock:", 0, a3);
}

- (void)enumerateValuesWithOptions:(unint64_t)a3 usingBlock:(id)a4
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
        (*((void (**)(id, unint64_t, char *, float))a4 + 2))(a4, v10, &v11, self->_values[v10]);
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
      (*((void (**)(id, uint64_t, char *, float))a4 + 2))(a4, v7, &v11, self->_values[v7]);
      if (v11)
        v9 = 1;
      else
        v9 = v8 == v7;
      ++v7;
    }
    while (!v9);
  }
}

- (float)valueAtIndex:(unint64_t)a3
{
  unint64_t count;

  count = self->_count;
  if (count <= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Index (%lu) beyond bounds (%lu)"), a3, count);
  return self->_values[a3];
}

- (void)internalResizeToCapacity:(unint64_t)a3
{
  unint64_t v5;
  float *v6;

  v5 = 4 * a3;
  v6 = (float *)reallocf(self->_values, 4 * a3);
  self->_values = v6;
  if (!v6)
  {
    self->_count = 0;
    self->_capacity = 0;
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99850], CFSTR("Failed to allocate %lu bytes"), v5);
  }
  self->_capacity = a3;
}

- (void)addValue:(float)a3
{
  float v3;

  v3 = a3;
  -[TRIPBFloatArray addValues:count:](self, "addValues:count:", &v3, 1);
}

- (void)addValues:(const float *)a3 count:(unint64_t)a4
{
  unint64_t count;
  unint64_t v8;
  TRIPBMessage *autocreator;

  if (a3 && a4)
  {
    count = self->_count;
    v8 = count + a4;
    if (count + a4 > self->_capacity)
      -[TRIPBFloatArray internalResizeToCapacity:](self, "internalResizeToCapacity:", (v8 & 0xFFFFFFFFFFFFFFF0) + 16);
    self->_count = v8;
    memcpy(&self->_values[count], a3, 4 * a4);
    autocreator = self->_autocreator;
    if (autocreator)
      TRIPBAutocreatedArrayModified(autocreator, (uint64_t)self);
  }
}

- (void)insertValue:(float)a3 atIndex:(unint64_t)a4
{
  unint64_t count;
  unint64_t v8;
  TRIPBMessage *autocreator;

  count = self->_count;
  v8 = count + 1;
  if (count + 1 <= a4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Index (%lu) beyond bounds (%lu)"), a4, count + 1);
    count = self->_count;
    v8 = count + 1;
  }
  if (v8 > self->_capacity)
    -[TRIPBFloatArray internalResizeToCapacity:](self, "internalResizeToCapacity:", (v8 & 0xFFFFFFFFFFFFFFF0) + 16);
  self->_count = v8;
  if (count != a4)
    memmove(&self->_values[a4 + 1], &self->_values[a4], 4 * (count - a4));
  self->_values[a4] = a3;
  autocreator = self->_autocreator;
  if (autocreator)
    TRIPBAutocreatedArrayModified(autocreator, (uint64_t)self);
}

- (void)replaceValueAtIndex:(unint64_t)a3 withValue:(float)a4
{
  unint64_t count;

  count = self->_count;
  if (count <= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Index (%lu) beyond bounds (%lu)"), a3, count);
  self->_values[a3] = a4;
}

- (void)addValuesFromArray:(id)a3
{
  -[TRIPBFloatArray addValues:count:](self, "addValues:count:", *((_QWORD *)a3 + 2), *((_QWORD *)a3 + 3));
}

- (void)removeValueAtIndex:(unint64_t)a3
{
  unint64_t count;
  unint64_t v6;

  count = self->_count;
  if (count <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Index (%lu) beyond bounds (%lu)"), a3, count);
    count = self->_count;
  }
  v6 = count - 1;
  if (count - 1 != a3)
    memmove(&self->_values[a3], &self->_values[a3 + 1], 4 * (count - 1 - a3));
  self->_count = v6;
  if (count + 31 < self->_capacity)
    -[TRIPBFloatArray internalResizeToCapacity:](self, "internalResizeToCapacity:", (v6 & 0xFFFFFFFFFFFFFFF0) + 16);
}

- (void)removeAll
{
  self->_count = 0;
  if (self->_capacity >= 0x21)
    -[TRIPBFloatArray internalResizeToCapacity:](self, "internalResizeToCapacity:", 16);
}

- (void)exchangeValueAtIndex:(unint64_t)a3 withValueAtIndex:(unint64_t)a4
{
  unint64_t count;
  _QWORD *v8;
  float *values;
  float v10;

  count = self->_count;
  v8 = (_QWORD *)MEMORY[0x1E0C99858];
  if (count <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Index (%lu) beyond bounds (%lu)"), a3, count);
    count = self->_count;
  }
  if (count <= a4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v8, CFSTR("Index (%lu) beyond bounds (%lu)"), a4, count);
  values = self->_values;
  v10 = values[a3];
  values[a3] = values[a4];
  values[a4] = v10;
}

- (unint64_t)count
{
  return self->_count;
}

@end
