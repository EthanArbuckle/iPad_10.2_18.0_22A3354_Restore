@implementation PXGSpriteReference

- (void)setSpriteIndex:(unsigned int)a3
{
  self->_spriteIndex = a3;
}

- (void)setObjectReference:(id)a3
{
  objc_storeStrong(&self->_objectReference, a3);
}

- (void)setLayoutVersion:(int64_t)a3
{
  self->_layoutVersion = a3;
}

- (void)setLayout:(id)a3
{
  objc_storeWeak((id *)&self->_layout, a3);
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGSpriteReference;
  result = -[PXGSpriteReference init](&v3, sel_init);
  if (result)
    *((_DWORD *)result + 3) = -1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectReference, 0);
  objc_destroyWeak((id *)&self->_layout);
}

- (unsigned)spriteIndex
{
  return self->_spriteIndex;
}

- (id)objectReference
{
  return self->_objectReference;
}

- (PXGLayout)layout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

- (int64_t)layoutVersion
{
  return self->_layoutVersion;
}

- (PXGSpriteReference)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSpriteReference.m"), 26, CFSTR("%s is not available as initializer"), "-[PXGSpriteReference init]");

  abort();
}

- (BOOL)isValid
{
  void *v2;
  unsigned int v4;
  void *v5;
  BOOL v6;

  v4 = -[PXGSpriteReference spriteIndex](self, "spriteIndex");
  if (v4 == -1)
  {
    -[PXGSpriteReference objectReference](self, "objectReference");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v6 = 0;
LABEL_6:

      return v6;
    }
  }
  -[PXGSpriteReference layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  if (v4 == -1)
    goto LABEL_6;
  return v6;
}

- (BOOL)hasObjectReference
{
  void *v2;
  BOOL v3;

  -[PXGSpriteReference objectReference](self, "objectReference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXGSpriteReference spriteIndex](self, "spriteIndex");
  -[PXGSpriteReference objectReference](self, "objectReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGSpriteReference layout](self, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, spriteIndex=%li, objRef=%@, layout=%@, version=%li>"), v5, self, v6, v7, v8, -[PXGSpriteReference layoutVersion](self, "layoutVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  void *v5;

  v3 = -[PXGSpriteReference layoutVersion](self, "layoutVersion");
  v4 = v3 ^ -[PXGSpriteReference spriteIndex](self, "spriteIndex");
  if (-[PXGSpriteReference hasObjectReference](self, "hasObjectReference"))
  {
    -[PXGSpriteReference objectReference](self, "objectReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 ^= objc_msgSend(v5, "hash");

  }
  return -[PXGSpriteReference isDynamic](self, "isDynamic") | (unint64_t)(2 * v4);
}

- (BOOL)isEqual:(id)a3
{
  PXGSpriteReference *v4;
  PXGSpriteReference *v5;
  _BOOL4 v6;
  int64_t v7;
  unsigned int v8;
  _BOOL4 v9;
  char v10;
  void *v12;
  void *v13;

  v4 = (PXGSpriteReference *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXGSpriteReference isDynamic](self, "isDynamic");
      if (v6 == -[PXGSpriteReference isDynamic](v5, "isDynamic")
        && (v7 = -[PXGSpriteReference layoutVersion](self, "layoutVersion"),
            v7 == -[PXGSpriteReference layoutVersion](v5, "layoutVersion"))
        && (v8 = -[PXGSpriteReference spriteIndex](self, "spriteIndex"),
            v8 == -[PXGSpriteReference spriteIndex](v5, "spriteIndex"))
        && (v9 = -[PXGSpriteReference hasObjectReference](self, "hasObjectReference"),
            v9 == -[PXGSpriteReference hasObjectReference](v5, "hasObjectReference")))
      {
        if (-[PXGSpriteReference hasObjectReference](self, "hasObjectReference"))
        {
          -[PXGSpriteReference objectReference](self, "objectReference");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXGSpriteReference objectReference](v5, "objectReference");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v12, "isEqual:", v13);

        }
        else
        {
          v10 = 1;
        }
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)adjustReferencedSpriteIndexesWithChangeDetails:(id)a3 appliedToLayout:(id)a4
{
  id v6;
  unsigned int v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = -[PXGSpriteReference spriteIndex](self, "spriteIndex");
  if (v7 != -1)
  {
    v8 = v7;
    -[PXGSpriteReference layout](self, "layout");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v6)
    {
      if (-[PXGSpriteReference isDynamic](self, "isDynamic")
        || (v10 = objc_msgSend(v12, "indexAfterApplyingChangesToIndex:", v8), v10 == 0x7FFFFFFFFFFFFFFFLL))
      {
        -[PXGSpriteReference setSpriteIndex:](self, "setSpriteIndex:", 0xFFFFFFFFLL);
      }
      else
      {
        -[PXGSpriteReference setSpriteIndex:](self, "setSpriteIndex:", v10);
        -[PXGSpriteReference layout](self, "layout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGSpriteReference setLayoutVersion:](self, "setLayoutVersion:", objc_msgSend(v11, "version"));

      }
    }
  }

}

- (BOOL)isDynamic
{
  return self->_isDynamic;
}

- (void)setIsDynamic:(BOOL)a3
{
  self->_isDynamic = a3;
}

@end
