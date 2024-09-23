@implementation SBSHomeScreenSilhouetteLayout

- (SBSHomeScreenSilhouetteLayout)initWithIcons:(id)a3 dock:(id)a4
{
  id v6;
  id v7;
  SBSHomeScreenSilhouetteLayout *v8;
  uint64_t v9;
  NSArray *icons;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSHomeScreenSilhouetteLayout;
  v8 = -[SBSHomeScreenSilhouetteLayout init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    icons = v8->_icons;
    v8->_icons = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_dock, a4);
  }

  return v8;
}

- (SBSHomeScreenSilhouetteLayout)init
{
  return -[SBSHomeScreenSilhouetteLayout initWithIcons:dock:](self, "initWithIcons:dock:", MEMORY[0x1E0C9AA60], 0);
}

- (BOOL)isEqual:(id)a3
{
  SBSHomeScreenSilhouetteLayout *v4;
  void *v5;
  char isKindOfClass;
  SBSHomeScreenSilhouetteLayout *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (SBSHomeScreenSilhouetteLayout *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[SBSHomeScreenSilhouetteLayout icons](self, "icons");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSHomeScreenSilhouetteLayout icons](v7, "icons");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (v10)
      {
        -[SBSHomeScreenSilhouetteLayout dock](self, "dock");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSHomeScreenSilhouetteLayout dock](v7, "dock");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = BSEqualObjects();

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SBSHomeScreenSilhouetteLayout icons](self, "icons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SBSHomeScreenSilhouetteLayout dock](self, "dock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SBSHomeScreenSilhouetteLayout *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __44__SBSHomeScreenSilhouetteLayout_description__block_invoke;
  v10 = &unk_1E288D940;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __44__SBSHomeScreenSilhouetteLayout_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBSHomeScreenSilhouetteLayout icons](self, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("icons"));

  -[SBSHomeScreenSilhouetteLayout dock](self, "dock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("dock"));

}

- (SBSHomeScreenSilhouetteLayout)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBSHomeScreenSilhouetteLayout *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeArrayOfObjectsOfClasses:forKey:", v7, CFSTR("icons"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", v9, CFSTR("dock"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SBSHomeScreenSilhouetteLayout initWithIcons:dock:](self, "initWithIcons:dock:", v8, v10);
  return v11;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBSHomeScreenSilhouetteLayout icons](self, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("icons"));

  -[SBSHomeScreenSilhouetteLayout dock](self, "dock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("dock"));

}

- (SBSHomeScreenSilhouetteLayout)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBSHomeScreenSilhouetteLayout *v10;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v5, v6, CFSTR("icons"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("dock"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SBSHomeScreenSilhouetteLayout initWithIcons:dock:](self, "initWithIcons:dock:", v7, v9);
  return v10;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[SBSHomeScreenSilhouetteLayout icons](self, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v8, "appendObject:withName:", v4, CFSTR("icons"));

  -[SBSHomeScreenSilhouetteLayout dock](self, "dock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "appendObject:withName:", v6, CFSTR("dock"));

}

- (NSArray)icons
{
  return self->_icons;
}

- (SBSHomeScreenRectangleSilhouette)dock
{
  return self->_dock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dock, 0);
  objc_storeStrong((id *)&self->_icons, 0);
}

@end
