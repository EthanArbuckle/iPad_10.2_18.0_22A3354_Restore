@implementation UNCSectionIcon

- (void)addVariant:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDBCF20];
    v5 = a3;
    -[UNCSectionIcon variants](self, "variants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithSet:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setByAddingObject:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UNCSectionIcon setVariants:](self, "setVariants:", v7);
  }
}

- (id)_bestVariantForFormat:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[UNCSectionIcon variants](self, "variants", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      if (objc_msgSend(v10, "format") == a3)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v10;

    if (v11)
      return v11;
  }
  else
  {
LABEL_9:

  }
  -[UNCSectionIcon variants](self, "variants");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anyObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[UNCSectionIcon variants](self, "variants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  UNCSectionIcon *v4;
  UNCSectionIcon *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (UNCSectionIcon *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[UNCSectionIcon variants](self, "variants");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNCSectionIcon variants](v5, "variants");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = BSEqualObjects();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[UNCSectionIcon variants](self, "variants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVariants:", v5);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNCSectionIcon)initWithCoder:(id)a3
{
  id v4;
  UNCSectionIcon *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[UNCSectionIcon init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("variants"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionIcon setVariants:](v5, "setVariants:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UNCSectionIcon variants](self, "variants");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("variants"));

}

- (NSSet)variants
{
  return self->_variants;
}

- (void)setVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variants, 0);
}

@end
