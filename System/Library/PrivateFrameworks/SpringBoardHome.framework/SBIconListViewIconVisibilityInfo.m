@implementation SBIconListViewIconVisibilityInfo

- (CGRect)visibleRectForIcon:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[NSMapTable objectForKey:](self->_visibleRects, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "CGRectValue");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setVisibleRect:(CGRect)a3 forIcon:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  NSMapTable *visibleRects;
  NSMapTable *v11;
  NSMapTable *v12;
  void *v13;
  _QWORD v14[4];
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  if (!CGRectIsEmpty(v15))
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    if (!CGRectIsNull(v16))
    {
      visibleRects = self->_visibleRects;
      if (!visibleRects)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v11 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        v12 = self->_visibleRects;
        self->_visibleRects = v11;

        visibleRects = self->_visibleRects;
      }
      *(CGFloat *)v14 = x;
      *(CGFloat *)&v14[1] = y;
      *(CGFloat *)&v14[2] = width;
      *(CGFloat *)&v14[3] = height;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v14, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](visibleRects, "setObject:forKey:", v13, v9);

    }
  }

}

- (void)addValuesFromIconVisibilityInfo:(id)a3
{
  id v4;
  int v5;
  id v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = -[SBIconListViewIconVisibilityInfo isNormalized](self, "isNormalized");
  if (v5 != objc_msgSend(v4, "isNormalized"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid argument to addValuesFromIconVisibilityInfo:, mismatched normalization!"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__SBIconListViewIconVisibilityInfo_addValuesFromIconVisibilityInfo___block_invoke;
  v7[3] = &unk_1E8D8BD58;
  v7[4] = self;
  objc_msgSend(v4, "enumerateVisibleIconsUsingBlock:", v7);

}

uint64_t __68__SBIconListViewIconVisibilityInfo_addValuesFromIconVisibilityInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisibleRect:forIcon:", a2);
}

- (NSMapTable)visibleIconRects
{
  return (NSMapTable *)(id)-[NSMapTable copy](self->_visibleRects, "copy");
}

- (void)enumerateVisibleIconsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *, double, double, double, double);
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *, double, double, double, double))a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_visibleRects;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9);
      -[NSMapTable objectForKey:](self->_visibleRects, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "CGRectValue");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;

      v20 = 0;
      v4[2](v4, v10, &v20, v13, v15, v17, v19);
      if (v20)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (BOOL)isEqual:(id)a3
{
  SBIconListViewIconVisibilityInfo *v4;
  void *v5;
  char isKindOfClass;
  char v7;

  v4 = (SBIconListViewIconVisibilityInfo *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0 && self->_normalized == v4->_normalized)
      v7 = BSEqualObjects();
    else
      v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  _BOOL8 normalized;

  normalized = self->_normalized;
  return -[NSMapTable hash](self->_visibleRects, "hash") + normalized;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 16) = self->_normalized;
    v7 = -[NSMapTable copyWithZone:](self->_visibleRects, "copyWithZone:", a3);
    v8 = (void *)v6[1];
    v6[1] = v7;

    v9 = v6;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)-[SBIconListViewIconVisibilityInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconListViewIconVisibilityInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconListViewIconVisibilityInfo isNormalized](self, "isNormalized"), CFSTR("isNormalized"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_visibleRects, CFSTR("visibleRects"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconListViewIconVisibilityInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (BOOL)isNormalized
{
  return self->_normalized;
}

- (void)setNormalized:(BOOL)a3
{
  self->_normalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleRects, 0);
}

@end
