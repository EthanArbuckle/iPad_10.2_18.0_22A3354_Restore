@implementation SCRCWeakReferenceContainer

- (SCRCWeakReferenceContainer)initWithObject:(id)a3
{
  SCRCWeakReferenceContainer *v4;
  SCRCWeakReferenceContainer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCRCWeakReferenceContainer;
  v4 = -[SCRCWeakReferenceContainer init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_initWeak(&v4->_weakReference, a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_destroyWeak(&self->_weakReference);
  v3.receiver = self;
  v3.super_class = (Class)SCRCWeakReferenceContainer;
  -[SCRCWeakReferenceContainer dealloc](&v3, sel_dealloc);
}

- (id)autoreleasedReference
{
  return -[SCRCWeakReferenceContainer strongReference](self, "strongReference");
}

- (id)strongReference
{
  return objc_loadWeakRetained(&self->_weakReference);
}

- (unint64_t)hash
{
  id v2;
  unint64_t v3;

  v2 = -[SCRCWeakReferenceContainer strongReference](self, "strongReference");
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  id v6;
  BOOL v7;
  objc_super v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SCRCWeakReferenceContainer strongReference](self, "strongReference");
    v6 = (id)objc_msgSend(a3, "strongReference");
    v7 = v5 == v6 || objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SCRCWeakReferenceContainer;
    return -[SCRCWeakReferenceContainer isEqual:](&v9, sel_isEqual_, a3);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = -[SCRCWeakReferenceContainer strongReference](self, "strongReference");
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithObject:", v4);

  return v5;
}

@end
