@implementation _UICollectionLayoutListAttributes

- (BOOL)isEqual:(id)a3
{
  _UICollectionLayoutListAttributes *v4;
  _UICollectionLayoutListAttributes *v5;
  _UICollectionLayoutListAttributes *v6;
  void **p_isa;
  $73E75C5D3991E8012C8D7E8A41E2786F flags;
  $73E75C5D3991E8012C8D7E8A41E2786F v9;
  int v10;
  char v11;

  v4 = (_UICollectionLayoutListAttributes *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    p_isa = (void **)&v6->super.isa;
    if (self->_appearanceStyle == v6->_appearanceStyle
      && (flags = self->_flags, v9 = v6->_flags, ((*(_DWORD *)&v9 ^ *(_DWORD *)&flags) & 1) == 0)
      && (v10 = (*(unsigned int *)&flags >> 1) & 1, v10 == ((*(unsigned int *)&v9 >> 1) & 1))
      && (!v10 || self->_backgroundMaskedCorners == v6->_backgroundMaskedCorners)
      && vabdd_f64(self->_maxWidth, v6->_maxWidth) <= 2.22044605e-16
      && UIEqual(self->_sectionData, v6->_sectionData)
      && UIEqual(self->_sectionBackgroundColor, p_isa[5])
      && UIEqual(self->_separatorBackgroundColor, p_isa[6]))
    {
      v11 = UIEqual(self->_separatorVisualEffect, p_isa[7]);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorVisualEffect, 0);
  objc_storeStrong((id *)&self->_separatorBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sectionData, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    *($73E75C5D3991E8012C8D7E8A41E2786F *)(v4 + 8) = self->_flags;
    *(_QWORD *)(v4 + 16) = self->_appearanceStyle;
    *(_QWORD *)(v4 + 24) = self->_backgroundMaskedCorners;
    objc_storeStrong((id *)(v4 + 32), self->_sectionData);
    objc_storeStrong((id *)(v5 + 40), self->_sectionBackgroundColor);
    objc_storeStrong((id *)(v5 + 48), self->_separatorBackgroundColor);
    objc_storeStrong((id *)(v5 + 56), self->_separatorVisualEffect);
    *(double *)(v5 + 64) = self->_maxWidth;
  }
  return (id)v5;
}

- (void)setSeparatorVisualEffect:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 31;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    v2 = 0;
  return v2 ^ self->_appearanceStyle;
}

- (id)description
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("appearanceStyle = %ld"), self->_appearanceStyle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stylesFirstItemAsHeader = %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("backgroundMaskedCorners = %lu"), self->_backgroundMaskedCorners);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (self->_sectionData)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sectionData = %@"), self->_sectionData);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  if (self->_sectionBackgroundColor)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sectionBackgroundColor = %@"), self->_sectionBackgroundColor);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  if (self->_separatorBackgroundColor)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("separatorBackgroundColor = %@"), self->_separatorBackgroundColor);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  if (self->_separatorVisualEffect)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("separatorVisualEffect = %@"), self->_separatorVisualEffect);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  if (self->_maxWidth != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("maxWidth = %g"), *(_QWORD *)&self->_maxWidth);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v15, self, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
