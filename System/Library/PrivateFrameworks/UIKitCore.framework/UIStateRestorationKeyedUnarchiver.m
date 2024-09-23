@implementation UIStateRestorationKeyedUnarchiver

- (id)initForReadingWithData:(id)a3 defaultValues:(id)a4 requiresSecureCoding:(BOOL)a5
{
  _BOOL8 v5;
  _QWORD *v7;
  _QWORD *v8;
  objc_super v10;

  v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)UIStateRestorationKeyedUnarchiver;
  v7 = -[UIStateRestorationKeyedUnarchiver initForReadingFromData:error:](&v10, sel_initForReadingFromData_error_, a3, 0);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setDecodingFailurePolicy:", 0);
    objc_msgSend(v8, "setRequiresSecureCoding:", v5);
    v8[17] = a4;
  }
  return v8;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v7;
  void *v9;

  if ((-[UIStateRestorationKeyedUnarchiver requiresSecureCoding](self, "requiresSecureCoding") & 1) == 0)
    return -[UIStateRestorationKeyedUnarchiver decodeObjectForKey:](self, "decodeObjectForKey:", a4);
  v7 = -[NSDictionary objectForKey:](self->_defaultValues, "objectForKey:", a4);
  if (v7)
    return (id)verifyDecodedObject((uint64_t)v7, (uint64_t)a4, a3, -[UIStateRestorationKeyedUnarchiver decodingFailurePolicy](self, "decodingFailurePolicy"));
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Decoding object for key %@ of classes %@"), "-[UIStateRestorationKeyedUnarchiver decodeObjectOfClasses:forKey:]", a4, a3);
  v9 = (void *)decodeSomeKindOfObject(a3, (uint64_t)a4, sel_decodeObjectOfClasses_forKey_, self);
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Decoded object for key %@: %@"), "-[UIStateRestorationKeyedUnarchiver decodeObjectOfClasses:forKey:]", a4, v9);
  return v9;
}

- (id)decodeObjectForKey:(id)a3
{
  UIStateRestorationKeyedUnarchiver **v5;
  id result;
  UIStateRestorationKeyedUnarchiver *v7;
  UIStateRestorationKeyedUnarchiver *v8;

  if (-[UIStateRestorationKeyedUnarchiver requiresSecureCoding](self, "requiresSecureCoding"))
  {
    v8 = self;
    v5 = &v8;
  }
  else
  {
    result = -[NSDictionary objectForKey:](self->_defaultValues, "objectForKey:", a3);
    if (result)
      return result;
    v7 = self;
    v5 = &v7;
  }
  v5[1] = (UIStateRestorationKeyedUnarchiver *)UIStateRestorationKeyedUnarchiver;
  return objc_msgSendSuper2((objc_super *)v5, sel_decodeObjectForKey_, a3, v7);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIStateRestorationKeyedUnarchiver;
  -[UIStateRestorationKeyedUnarchiver dealloc](&v3, sel_dealloc);
}

- (id)decodeTopLevelObjectOfClasses:(id)a3 forKey:(id)a4 error:(id *)a5
{
  objc_super v10;

  if (-[UIStateRestorationKeyedUnarchiver requiresSecureCoding](self, "requiresSecureCoding"))
    return (id)decodeSomeKindOfObject(a3, (uint64_t)a4, sel_decodeTopLevelObjectOfClasses_forKey_error_, self);
  v10.receiver = self;
  v10.super_class = (Class)UIStateRestorationKeyedUnarchiver;
  return -[UIStateRestorationKeyedUnarchiver decodeTopLevelObjectOfClasses:forKey:error:](&v10, sel_decodeTopLevelObjectOfClasses_forKey_error_, a3, a4, a5);
}

@end
