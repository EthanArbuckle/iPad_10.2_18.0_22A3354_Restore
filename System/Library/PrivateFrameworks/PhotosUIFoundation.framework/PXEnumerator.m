@implementation PXEnumerator

- (id)firstObject
{
  return 0;
}

- (id)nextObject
{
  return 0;
}

- (unint64_t)count
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEnumerator.m"), 40, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXEnumerator copyWithZone:]", v7);

  abort();
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t recursiveEnumerationValue;
  void *v9;
  unint64_t v10;
  unint64_t v11;

  if (a3->var0 == -1)
    return 0;
  if (!a3->var0)
  {
    recursiveEnumerationValue = self->recursiveEnumerationValue;
    self->recursiveEnumerationValue = recursiveEnumerationValue + 1;
    a3->var2 = &self->recursiveEnumerationValue;
    if (recursiveEnumerationValue)
      -[PXEnumerator reset](self, "reset");
  }
  -[PXEnumerator nextObject](self, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXEnumerator setEnumeratedObject:](self, "setEnumeratedObject:", v9);
  if (v9)
  {
    a3->var1 = a4;
    *a4 = v9;
    v10 = a3->var0 + 1;
    v11 = 1;
  }
  else
  {
    v11 = 0;
    v10 = -1;
  }
  a3->var0 = v10;

  return v11;
}

- (id)enumeratedObject
{
  return self->_enumeratedObject;
}

- (void)setEnumeratedObject:(id)a3
{
  objc_storeStrong(&self->_enumeratedObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_enumeratedObject, 0);
}

@end
