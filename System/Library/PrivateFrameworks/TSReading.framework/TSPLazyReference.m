@implementation TSPLazyReference

+ (id)referenceForObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTSPObject:", v4);

  return v5;
}

- (TSPLazyReference)init
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPLazyReference init]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPLazyReference.mm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 39, CFSTR("Do not call method"));

  v5 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSPLazyReference init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (TSPLazyReference)initWithDelegate:(id)a3 identifier:(int64_t)a4 isWeak:(BOOL)a5 allowUnknownObject:(BOOL)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  TSPLazyReference *v14;
  TSPLazyReference *v15;
  objc_super v17;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPLazyReference initWithDelegate:identifier:isWeak:allowUnknownObject:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPLazyReference.mm");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 44, CFSTR("invalid nil value for '%s'"), "delegate");

  }
  v17.receiver = self;
  v17.super_class = (Class)TSPLazyReference;
  v14 = -[TSPLazyReference init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v10);
    v15->_identifier = a4;
    v15->_isWeak = a5;
    v15->_allowUnknownObject = a6;
  }

  return v15;
}

- (TSPLazyReference)initWithTSPObject:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  TSPLazyReference *v9;
  TSPLazyReference *v10;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "tsp_identifier");
    objc_opt_class();
    v9 = -[TSPLazyReference initWithDelegate:identifier:isWeak:allowUnknownObject:](self, "initWithDelegate:identifier:isWeak:allowUnknownObject:", v7, v8, 0, objc_opt_isKindOfClass() & 1);

    if (v9)
    {
      objc_storeStrong((id *)&v9->_strongObject, a3);
      objc_storeWeak((id *)&v9->_weakObject, v6);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)object
{
  TSPObject *strongObject;

  strongObject = self->_strongObject;
  if (strongObject)
    return strongObject;
  else
    return objc_loadWeakRetained((id *)&self->_weakObject);
}

- (id)objectIfLoaded
{
  TSPObject *strongObject;
  TSPObject *WeakRetained;
  TSPObject **p_weakObject;
  id v6;

  strongObject = self->_strongObject;
  if (strongObject)
  {
    WeakRetained = strongObject;
  }
  else
  {
    p_weakObject = &self->_weakObject;
    WeakRetained = (TSPObject *)objc_loadWeakRetained((id *)&self->_weakObject);
    if (!WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "objectForIdentifier:", self->_identifier);
      WeakRetained = (TSPObject *)objc_claimAutoreleasedReturnValue();

      if (WeakRetained)
        objc_storeWeak((id *)p_weakObject, WeakRetained);
    }
  }
  return WeakRetained;
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[TSPLazyReference isEqualToLazyReference:](self, "isEqualToLazyReference:", v4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TSPLazyReference;
    v5 = -[TSPLazyReference isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

- (BOOL)isEqualToLazyReference:(id)a3
{
  int64_t identifier;

  identifier = self->_identifier;
  return identifier == objc_msgSend(a3, "identifier");
}

- (BOOL)referencesObject:(id)a3
{
  int64_t identifier;

  identifier = self->_identifier;
  return identifier == objc_msgSend(a3, "tsp_identifier");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id WeakRetained;
  TSPLazyReference *v6;
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = -[TSPLazyReference initWithDelegate:identifier:isWeak:allowUnknownObject:](+[TSPLazyReference allocWithZone:](TSPLazyReference, "allocWithZone:", a3), "initWithDelegate:identifier:isWeak:allowUnknownObject:", WeakRetained, self->_identifier, self->_isWeak, self->_allowUnknownObject);
  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_component);
    objc_storeWeak((id *)&v6->_component, v7);

    objc_storeStrong((id *)&v6->_strongObject, self->_strongObject);
    v8 = objc_loadWeakRetained((id *)&self->_weakObject);
    objc_storeWeak((id *)&v6->_weakObject, v8);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "lazyReference:didCreateCopy:", self, v6);
  }

  return v6;
}

- (TSPObject)weakObject
{
  return (TSPObject *)objc_loadWeakRetained((id *)&self->_weakObject);
}

- (TSPObject)strongObject
{
  return self->_strongObject;
}

- (void)setStrongObject:(id)a3
{
  id obj;

  obj = a3;
  if (!self->_allowUnknownObject)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!self->_isWeak)
        TSULogErrorInFunction();

      obj = 0;
    }
  }
  if (!self->_isWeak)
    objc_storeStrong((id *)&self->_strongObject, obj);
  objc_storeWeak((id *)&self->_weakObject, obj);

}

- (void)setIsWeak:(BOOL)a3
{
  self->_isWeak = a3;
}

- (BOOL)discardStrongObjectIfPossible
{
  return self->_strongObject == 0;
}

- (void)resetIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[TSPLazyReference weakObject](self, "weakObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3)
  {
    self->_identifier = objc_msgSend(v3, "tsp_identifier");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPLazyReference resetIdentifier]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPLazyReference.mm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 256, CFSTR("You should not reset the lazy reference's identifier when its object isn't loaded in memory."));

  }
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_super v10;
  objc_super v11;

  -[TSPLazyReference weakObject](self, "weakObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
  {
    v11.receiver = self;
    v11.super_class = (Class)TSPLazyReference;
    -[TSPLazyReference debugDescription](&v11, sel_debugDescription);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@; object class: %@; identifier: %qu"),
      v5,
      v7,
      objc_msgSend(v3, "tsp_identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TSPLazyReference;
    -[TSPLazyReference debugDescription](&v10, sel_debugDescription);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@; unloaded object identifier: %qu"),
      v5,
      -[TSPLazyReference identifier](self, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (TSPLazyReferenceDelegate)delegate
{
  return (TSPLazyReferenceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (TSPComponent)component
{
  return (TSPComponent *)objc_loadWeakRetained((id *)&self->_component);
}

- (void)setComponent:(id)a3
{
  objc_storeWeak((id *)&self->_component, a3);
}

- (BOOL)isWeak
{
  return self->_isWeak;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_component);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_weakObject);
  objc_storeStrong((id *)&self->_strongObject, 0);
}

@end
