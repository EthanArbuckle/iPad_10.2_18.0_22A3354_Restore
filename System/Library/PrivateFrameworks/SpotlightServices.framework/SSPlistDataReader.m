@implementation SSPlistDataReader

- (SSPlistDataReader)initWithPlistContainer:(_MDPlistContainer *)a3 obj:(id *)a4
{
  SSPlistDataReader *v6;
  SSPlistDataReader *v7;
  $89967B733E8F0E8859294B5D59E7AF0F var2;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSPlistDataReader;
  v6 = -[SSPlistDataReader init](&v10, sel_init);
  v7 = v6;
  if (a3 && v6)
  {
    v6->_container = (_MDPlistContainer *)CFRetain(a3);
    var2 = a4->var2;
    *(_OWORD *)&v7->_obj.containerBytes = *(_OWORD *)&a4->var0;
    v7->_obj.reference = ($37FF168C8709F524D812460C59637AB1)var2;
  }
  return v7;
}

- (SSPlistDataReader)initWithPlistContainer:(_MDPlistContainer *)a3
{
  SSPlistDataReader *v4;
  SSPlistDataReader *v5;
  __int128 v7;
  $37FF168C8709F524D812460C59637AB1 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSPlistDataReader;
  v4 = -[SSPlistDataReader init](&v9, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    v4->_container = (_MDPlistContainer *)CFRetain(a3);
    _MDPlistGetRootPlistObjectFromPlist();
    *(_OWORD *)&v5->_obj.containerBytes = v7;
    v5->_obj.reference = v8;
  }
  return v5;
}

- (void)dealloc
{
  _MDPlistContainer *container;
  objc_super v4;

  container = self->_container;
  if (container)
    CFRelease(container);
  v4.receiver = self;
  v4.super_class = (Class)SSPlistDataReader;
  -[SSPlistDataReader dealloc](&v4, sel_dealloc);
}

- (unint64_t)count
{
  if (self->_container)
    return _MDPlistDictionaryGetCount();
  else
    return 0;
}

- (NSMutableArray)allKeys
{
  void *v3;
  void *v4;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[SSPlistDataReader count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_container)
  {
    v6 = v3;
    _MDPlistDictionaryIterate();

  }
  return (NSMutableArray *)v4;
}

void __28__SSPlistDataReader_allKeys__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (NSArray)blocklist
{
  void *v3;
  void *v4;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_container)
  {
    v6 = v3;
    _MDPlistDictionaryIterate();

  }
  return (NSArray *)v4;
}

void __30__SSPlistDataReader_blocklist__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  double v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;

  v9 = *a4;
  v10 = *((_QWORD *)a4 + 2);
  _MDPlistNumberGetDoubleValue();
  if (v6 < 0.0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2, v9, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (BOOL)doesBundleExistInAppAllowList:(id)a3
{
  if (!self->_container)
    return 0;
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  return _MDPlistDictionaryGetPlistObjectForKey() != 0;
}

- (double)doubleValueForKey:(const char *)a3
{
  double v3;
  double v4;

  v3 = -1.0;
  if (a3 && self->_container && _MDPlistDictionaryGetPlistObjectForKey())
  {
    _MDPlistNumberGetDoubleValue();
    return v4;
  }
  return v3;
}

- (double)doubleValueForBundle:(id)a3
{
  id v4;
  double v5;
  double v6;

  objc_msgSend(a3, "lowercaseString");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[SSPlistDataReader doubleValueForKey:](self, "doubleValueForKey:", objc_msgSend(v4, "UTF8String"));
  v6 = v5;

  return v6;
}

- (int64_t)intValueForKey:(const char *)a3 defaultValue:(int64_t)a4
{
  if (a3 && self->_container && _MDPlistDictionaryGetPlistObjectForKey())
    return _MDPlistNumberGetIntValue();
  return a4;
}

- (int64_t)intValueForBundle:(id)a3 defaultValue:(int64_t)a4
{
  id v6;
  int64_t v7;

  objc_msgSend(a3, "lowercaseString");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = -[SSPlistDataReader intValueForKey:defaultValue:](self, "intValueForKey:defaultValue:", objc_msgSend(v6, "UTF8String"), a4);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> : (count=%d)"), objc_opt_class(), self, -[SSPlistDataReader count](self, "count"));
}

- (_MDPlistContainer)container
{
  return self->_container;
}

@end
