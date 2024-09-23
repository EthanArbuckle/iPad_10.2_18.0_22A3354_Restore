@implementation SBIconListViewPlaceholderAssertion

- (SBIconListViewPlaceholderAssertion)initWithGridCellIndex:(unint64_t)a3 gridSizeClass:(id)a4 reason:(id)a5 options:(unint64_t)a6 listView:(id)a7
{
  id v12;
  id v13;
  id v14;
  SBIconListViewPlaceholderAssertion *v15;
  SBIconListViewPlaceholderAssertion *v16;
  uint64_t v17;
  NSString *gridSizeClass;
  uint64_t v19;
  NSString *reason;
  objc_super v22;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SBIconListViewPlaceholderAssertion;
  v15 = -[SBIconListViewPlaceholderAssertion init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_gridCellIndex = a3;
    v17 = objc_msgSend(v12, "copy");
    gridSizeClass = v16->_gridSizeClass;
    v16->_gridSizeClass = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    reason = v16->_reason;
    v16->_reason = (NSString *)v19;

    v16->_options = a6;
    objc_storeStrong((id *)&v16->_listView, a7);
  }

  return v16;
}

- (SBIconListViewPlaceholderAssertion)initWithGridCellIndex:(unint64_t)a3 representedIcon:(id)a4 reason:(id)a5 options:(unint64_t)a6 listView:(id)a7
{
  id v13;
  id v14;
  id v15;
  SBIconListViewPlaceholderAssertion *v16;
  SBIconListViewPlaceholderAssertion *v17;
  void *v18;
  uint64_t v19;
  NSString *gridSizeClass;
  uint64_t v21;
  NSString *reason;
  objc_super v24;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SBIconListViewPlaceholderAssertion;
  v16 = -[SBIconListViewPlaceholderAssertion init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_gridCellIndex = a3;
    objc_msgSend(v13, "gridSizeClass");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    gridSizeClass = v17->_gridSizeClass;
    v17->_gridSizeClass = (NSString *)v19;

    objc_storeStrong((id *)&v17->_representedIcon, a4);
    v21 = objc_msgSend(v14, "copy");
    reason = v17->_reason;
    v17->_reason = (NSString *)v21;

    v17->_options = a6;
    objc_storeStrong((id *)&v17->_listView, a7);
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  if (!-[SBIconListViewPlaceholderAssertion isInvalidated](self, "isInvalidated"))
  {
    NSLog(CFSTR("SBIconListViewPlaceholderAssertion deallocated but not invalidated! Reason: %@"), self->_reason);
    -[SBIconListViewPlaceholderAssertion invalidate](self, "invalidate");
  }
  v3.receiver = self;
  v3.super_class = (Class)SBIconListViewPlaceholderAssertion;
  -[SBIconListViewPlaceholderAssertion dealloc](&v3, sel_dealloc);
}

- (unint64_t)effectiveGridCellIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  -[SBIconListViewPlaceholderAssertion placeholderIcon](self, "placeholderIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListViewPlaceholderAssertion listView](self, "listView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridCellInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexForIcon:", v3);
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    v9 = objc_msgSend(v6, "gridCellIndexForIconIndex:", v8);

  return v9;
}

- (void)setGridCellIndex:(unint64_t)a3
{
  if (self->_gridCellIndex != a3 || -[SBIconListViewPlaceholderAssertion positioningType](self, "positioningType"))
  {
    self->_gridCellIndex = a3;
    -[SBIconListViewPlaceholderAssertion setPositioningType:](self, "setPositioningType:", 0);
    -[SBIconListViewPlaceholderAssertion didChangePlaceholderPosition](self, "didChangePlaceholderPosition");
  }
}

- (void)swapWithIcon:(id)a3
{
  -[SBIconListViewPlaceholderAssertion setPositioningRelativeIcon:](self, "setPositioningRelativeIcon:", a3);
  -[SBIconListViewPlaceholderAssertion setPositioningType:](self, "setPositioningType:", 1);
  -[SBIconListViewPlaceholderAssertion didChangePlaceholderPosition](self, "didChangePlaceholderPosition");
}

- (void)placeAfterIcon:(id)a3
{
  -[SBIconListViewPlaceholderAssertion setPositioningRelativeIcon:](self, "setPositioningRelativeIcon:", a3);
  -[SBIconListViewPlaceholderAssertion setPositioningType:](self, "setPositioningType:", 2);
  -[SBIconListViewPlaceholderAssertion didChangePlaceholderPosition](self, "didChangePlaceholderPosition");
}

- (void)placeBeforeIcon:(id)a3
{
  -[SBIconListViewPlaceholderAssertion setPositioningRelativeIcon:](self, "setPositioningRelativeIcon:", a3);
  -[SBIconListViewPlaceholderAssertion setPositioningType:](self, "setPositioningType:", 3);
  -[SBIconListViewPlaceholderAssertion didChangePlaceholderPosition](self, "didChangePlaceholderPosition");
}

- (void)placeAboveIcon:(id)a3
{
  -[SBIconListViewPlaceholderAssertion setPositioningRelativeIcon:](self, "setPositioningRelativeIcon:", a3);
  -[SBIconListViewPlaceholderAssertion setPositioningType:](self, "setPositioningType:", 4);
  -[SBIconListViewPlaceholderAssertion didChangePlaceholderPosition](self, "didChangePlaceholderPosition");
}

- (void)placeBelowIcon:(id)a3
{
  -[SBIconListViewPlaceholderAssertion setPositioningRelativeIcon:](self, "setPositioningRelativeIcon:", a3);
  -[SBIconListViewPlaceholderAssertion setPositioningType:](self, "setPositioningType:", 5);
  -[SBIconListViewPlaceholderAssertion didChangePlaceholderPosition](self, "didChangePlaceholderPosition");
}

- (void)setOptions:(unint64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    -[SBIconListViewPlaceholderAssertion didChangePlaceholderPosition](self, "didChangePlaceholderPosition");
  }
}

- (void)setGridSizeClass:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *gridSizeClass;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_gridSizeClass != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      gridSizeClass = self->_gridSizeClass;
      self->_gridSizeClass = v7;

      -[SBIconListViewPlaceholderAssertion placeholderIcon](self, "placeholderIcon");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setGridSizeClass:", v10);
      -[SBIconListViewPlaceholderAssertion didChangePlaceholderPosition](self, "didChangePlaceholderPosition");

      v5 = v10;
    }
  }

}

- (void)didChangePlaceholderPosition
{
  id v3;

  if (!-[SBIconListViewPlaceholderAssertion isInvalidated](self, "isInvalidated"))
  {
    -[SBIconListViewPlaceholderAssertion listView](self, "listView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeholderAssertionDidChangePosition:", self);

  }
}

- (SBPlaceholderIcon)placeholderIcon
{
  SBPlaceholderIcon *placeholderIcon;
  void *v4;
  void *v5;
  SBPlaceholderIcon *v6;
  SBPlaceholderIcon *v7;

  placeholderIcon = self->_placeholderIcon;
  if (!placeholderIcon)
  {
    -[SBIconListViewPlaceholderAssertion reason](self, "reason");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListViewPlaceholderAssertion gridSizeClass](self, "gridSizeClass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBPlaceholderIcon placeholderForReason:](SBPlaceholderIcon, "placeholderForReason:", v4);
    v6 = (SBPlaceholderIcon *)objc_claimAutoreleasedReturnValue();
    v7 = self->_placeholderIcon;
    self->_placeholderIcon = v6;

    -[SBIcon setGridSizeClass:](self->_placeholderIcon, "setGridSizeClass:", v5);
    placeholderIcon = self->_placeholderIcon;
  }
  return placeholderIcon;
}

- (unint64_t)listMutationOptions
{
  unint64_t v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  int v11;

  v3 = -[SBIconListViewPlaceholderAssertion options](self, "options");
  v4 = (v3 & 1) << 21;
  -[SBIconListViewPlaceholderAssertion gridSizeClass](self, "gridSizeClass");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == CFSTR("SBHIconGridSizeClassDefault"))
  {

  }
  else
  {
    -[SBIconListViewPlaceholderAssertion gridSizeClass](self, "gridSizeClass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

    if (!v8)
      v4 |= 0x40uLL;
  }
  v9 = ((_DWORD)v3 << 6) & 0x180 | (((v3 >> 4) & 1) << 9) | v4;
  -[SBIconListViewPlaceholderAssertion listView](self, "listView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "allowsGaps");

  if (v11)
    return v9 | 0x100000;
  else
    return v9;
}

- (unint64_t)folderMutationOptions
{
  unint64_t v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  int v11;

  v3 = -[SBIconListViewPlaceholderAssertion options](self, "options");
  if ((v3 & 1) != 0)
    v4 = 16777218;
  else
    v4 = 2;
  -[SBIconListViewPlaceholderAssertion gridSizeClass](self, "gridSizeClass");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == CFSTR("SBHIconGridSizeClassDefault"))
  {

  }
  else
  {
    -[SBIconListViewPlaceholderAssertion gridSizeClass](self, "gridSizeClass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

    if (!v8)
      v4 |= 0x80uLL;
  }
  v9 = ((_DWORD)v3 << 7) & 0x300 | (((v3 >> 4) & 1) << 10) | v4;
  -[SBIconListViewPlaceholderAssertion listView](self, "listView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "allowsGaps");

  if (v11)
    return v9 | 0x400000;
  else
    return v9;
}

- (void)invalidate
{
  void *v3;

  if (!-[SBIconListViewPlaceholderAssertion isInvalidated](self, "isInvalidated"))
  {
    -[SBIconListViewPlaceholderAssertion listView](self, "listView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removePlaceholderAssertion:", self);

    -[SBIconListViewPlaceholderAssertion setInvalidated:](self, "setInvalidated:", 1);
  }
}

- (NSString)description
{
  return (NSString *)-[SBIconListViewPlaceholderAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconListViewPlaceholderAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconListViewPlaceholderAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  __CFString *v21;
  void *v22;
  id v23;

  -[SBIconListViewPlaceholderAssertion listView](self, "listView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridSizeClassDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListViewPlaceholderAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "appendInteger:withName:", -[SBIconListViewPlaceholderAssertion gridCellIndex](self, "gridCellIndex"), CFSTR("gridCellIndex"));
  -[SBIconListViewPlaceholderAssertion gridSizeClass](self, "gridSizeClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionForGridSizeClass:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v9, CFSTR("gridSizeClass"));

  -[SBIconListViewPlaceholderAssertion representedIcon](self, "representedIcon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v10, CFSTR("representedIcon"), 1);

  -[SBIconListViewPlaceholderAssertion reason](self, "reason");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v6, "appendObject:withName:", v12, CFSTR("reason"));

  v14 = -[SBIconListViewPlaceholderAssertion options](self, "options");
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = v15;
  if ((v14 & 1) != 0)
  {
    objc_msgSend(v15, "addObject:", CFSTR("minimizing layout disruption"));
    if ((v14 & 2) == 0)
    {
LABEL_3:
      if ((v14 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v16, "addObject:", CFSTR("fixed"));
  if ((v14 & 0x10) == 0)
  {
LABEL_4:
    if ((v14 & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v16, "addObject:", CFSTR("fixed if necessary"));
  if ((v14 & 4) == 0)
  {
LABEL_5:
    if ((v14 & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_12:
  objc_msgSend(v16, "addObject:", CFSTR("displacing existing fixed icons"));
  if ((v14 & 8) != 0)
LABEL_6:
    objc_msgSend(v16, "addObject:", CFSTR("disallowing icon removal"));
LABEL_7:
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendString:withName:", v17, CFSTR("options"));
  -[SBIconListViewPlaceholderAssertion positioningRelativeIcon](self, "positioningRelativeIcon");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v18, CFSTR("positioningRelativeIcon"), 1);

  v20 = -[SBIconListViewPlaceholderAssertion positioningType](self, "positioningType");
  if (v20 > 5)
    v21 = 0;
  else
    v21 = off_1E8D898E0[v20];
  objc_msgSend(v6, "appendString:withName:", v21, CFSTR("positioningType"));
  -[SBIconListViewPlaceholderAssertion listView](self, "listView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v6, "appendPointer:withName:", v22, CFSTR("listView"));

  return v6;
}

- (unint64_t)gridCellIndex
{
  return self->_gridCellIndex;
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (SBIcon)representedIcon
{
  return self->_representedIcon;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)options
{
  return self->_options;
}

- (SBIconListView)listView
{
  return self->_listView;
}

- (SBIcon)positioningRelativeIcon
{
  return self->_positioningRelativeIcon;
}

- (void)setPositioningRelativeIcon:(id)a3
{
  objc_storeStrong((id *)&self->_positioningRelativeIcon, a3);
}

- (int64_t)positioningType
{
  return self->_positioningType;
}

- (void)setPositioningType:(int64_t)a3
{
  self->_positioningType = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positioningRelativeIcon, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_representedIcon, 0);
  objc_storeStrong((id *)&self->_placeholderIcon, 0);
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
}

@end
