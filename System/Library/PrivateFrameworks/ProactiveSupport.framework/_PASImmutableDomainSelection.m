@implementation _PASImmutableDomainSelection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domains, 0);
}

- (id)allDomains
{
  return self->_domains;
}

- (BOOL)isEmpty
{
  return 0;
}

- (id)_initWithNonOverlappingDomainSet:(id)a3
{
  id v6;
  _PASImmutableDomainSelection *v7;
  void *v9;

  v6 = a3;
  v7 = -[_PASDomainSelection init](self, "init");
  if (v7)
  {
    if (!objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("_PASDomainSelection.m"), 224, CFSTR("_PASImmutableDomainSelection shouldn't be instantiated with zero domains"));

    }
    objc_storeStrong((id *)&v7->_domains, a3);
  }

  return v7;
}

- (BOOL)containsDomain:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AFDC98]();
  if (-[NSSet containsObject:](self->_domains, "containsObject:", v4))
  {
    v6 = 1;
  }
  else
  {
    while (1)
    {
      v7 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("."), 6);
      v6 = v8 != 0;
      if (!v8)
        break;
      objc_msgSend(v4, "substringToIndex:", v7);
      v9 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v5);
      v5 = (void *)MEMORY[0x1A1AFDC98]();
      v4 = (id)v9;
      if (-[NSSet containsObject:](self->_domains, "containsObject:", v9))
      {
        v6 = 1;
        v4 = (id)v9;
        break;
      }
    }
  }
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (BOOL)isEqualToDomainSelection:(id)a3
{
  id v4;
  unint64_t v5;
  NSSet *domains;
  void *v7;
  char v8;

  v4 = a3;
  if (v4 && (v5 = -[_PASDomainSelection count](self, "count"), v5 == objc_msgSend(v4, "count")))
  {
    domains = self->_domains;
    objc_msgSend(v4, "allDomains");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSSet isEqual:](domains, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
