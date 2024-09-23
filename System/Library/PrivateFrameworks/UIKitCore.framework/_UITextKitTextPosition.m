@implementation _UITextKitTextPosition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

- (NSTextLocation)location
{
  return self->_location;
}

- (int64_t)affinity
{
  return self->_affinity;
}

- (int64_t)offset
{
  return self->_offset;
}

+ (id)positionWithTextContentManager:(id)a3 location:(id)a4 affinity:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "documentRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "offsetFromLocation:toLocation:", v11, v8);

  objc_msgSend(a1, "positionWithOffset:affinity:", v12, a5);
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13[3];
  v13[3] = v8;

  return v13;
}

+ (id)positionWithOffset:(int64_t)a3 affinity:(int64_t)a4
{
  _QWORD *v6;

  v6 = (_QWORD *)objc_opt_new();
  v6[1] = a3;
  v6[2] = a4;
  return v6;
}

- (_UITextKitTextPosition)init
{
  _UITextKitTextPosition *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITextKitTextPosition;
  result = -[_UITextKitTextPosition init](&v3, sel_init);
  if (result)
  {
    result->_offset = 0;
    result->_affinity = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  return a3 && self->_offset == *((_QWORD *)a3 + 1);
}

+ (id)positionWithOffset:(int64_t)a3
{
  return (id)objc_msgSend(a1, "positionWithOffset:affinity:", a3, 0);
}

- (int64_t)compare:(id)a3
{
  id v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextKitTextViewEditingSupport.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pos"));

  }
  v6 = -[_UITextKitTextPosition offset](self, "offset");
  if (v6 <= objc_msgSend(v5, "offset"))
  {
    v8 = -[_UITextKitTextPosition offset](self, "offset");
    if (v8 >= objc_msgSend(v5, "offset"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)_UITextKitTextPosition;
  -[_UITextKitTextPosition description](&v9, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_affinity)
    v6 = CFSTR("B");
  else
    v6 = CFSTR("F");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%li%@)"), v4, self->_offset, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
