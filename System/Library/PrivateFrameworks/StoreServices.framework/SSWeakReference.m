@implementation SSWeakReference

- (id)object
{
  return objc_loadWeak(&self->_object);
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak(&self->_object, 0);
  v3.receiver = self;
  v3.super_class = (Class)SSWeakReference;
  -[SSWeakReference dealloc](&v3, sel_dealloc);
}

+ (id)weakReferenceWithObject:(id)a3
{
  id *v4;

  v4 = (id *)objc_alloc_init((Class)a1);
  objc_storeWeak(v4 + 1, a3);
  v4[2] = a3;
  return v4;
}

- (unint64_t)hash
{
  return self->_objectAddress;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && *((_QWORD *)a3 + 2) == self->_objectAddress;
}

@end
