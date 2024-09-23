@implementation _UITextInputSessionAccumulator

- (_NSRange)depthRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_depthRange.length;
  location = self->_depthRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)_increaseWithActions:(id)a3
{
  _QWORD *block;
  uint64_t (*v5)(_QWORD *, id);
  id v6;
  uint64_t v7;
  void *v8;

  block = self->_block;
  v5 = (uint64_t (*)(_QWORD *, id))block[2];
  v6 = a3;
  v7 = v5(block, v6);
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITextInputSessionAccumulator _increaseWithCount:source:](self, "_increaseWithCount:source:", v7, objc_msgSend(v8, "source"));
  return v7 != 0;
}

- (void)_increaseWithCount:(unint64_t)a3 source:(int64_t)a4
{
  unint64_t *values;

  if (self->_type)
    values = &self->_values[a4];
  else
    values = self->_values;
  *values += a3;
}

- (NSString)name
{
  return self->_name;
}

+ (id)accumulatorWithName:(id)a3 type:(int64_t)a4 depthRange:(_NSRange)a5 block:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  length = a5.length;
  location = a5.location;
  v10 = a6;
  v11 = a3;
  v12 = objc_alloc_init((Class)objc_opt_class());
  v13 = objc_msgSend(v11, "copy");

  v14 = (void *)v12[10];
  v12[10] = v13;

  v12[11] = a4;
  v12[13] = location;
  v12[14] = length;
  v15 = objc_msgSend(v10, "copy");

  v16 = (void *)v12[12];
  v12[12] = v15;

  objc_msgSend(v12, "reset");
  return v12;
}

- (void)reset
{
  self->_values[8] = 0;
  *(_OWORD *)&self->_values[6] = 0u;
  *(_OWORD *)&self->_values[4] = 0u;
  *(_OWORD *)&self->_values[2] = 0u;
  *(_OWORD *)self->_values = 0u;
}

+ (id)accumulatorWithName:(id)a3 type:(int64_t)a4 depth:(unint64_t)a5 block:(id)a6
{
  return (id)objc_msgSend(a1, "accumulatorWithName:type:depthRange:block:", a3, a4, a5, 0, a6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_msgSend((id)objc_opt_class(), "accumulatorWithName:type:depthRange:block:", self->_name, self->_type, self->_depthRange.location, self->_depthRange.length, self->_block);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setDepthRange:(_NSRange)a3
{
  self->_depthRange = a3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_UITextInputSessionAccumulator;
  -[_UITextInputSessionAccumulator description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextInputSessionAccumulator name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateAnalytics:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  if (self->_type || !self->_values[0])
  {
    for (i = 1; i != 10; ++i)
    {
      if (*((_QWORD *)&self->super.isa + i))
      {
        +[UITextInputSessionActionAnalytics stringValueForSource:](UITextInputSessionActionAnalytics, "stringValueForSource:", i - 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = CFSTR("SessionAction");
        -[_UITextInputSessionAccumulator name](self, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12[1] = CFSTR("InputSource");
        v13[0] = v7;
        v13[1] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v4[2](v4, v8, *((_QWORD *)&self->super.isa + i));
      }
    }
  }
  else
  {
    +[UITextInputSessionActionAnalytics stringValueForSource:](UITextInputSessionActionAnalytics, "stringValueForSource:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = CFSTR("SessionAction");
    -[_UITextInputSessionAccumulator name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("InputSource");
    v15[0] = v10;
    v15[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v11, self->_values[0]);
  }

}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
