@implementation PXSectionedLayoutContent

- (PXSectionedLayoutContent)init
{

  return 0;
}

- (PXSectionedLayoutContent)initWithAxis:(int64_t)a3 insets:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  PXSectionedLayoutContent *v10;
  PXSectionedLayoutContent *v11;
  uint64_t v12;
  NSMutableArray *sections;
  void *v16;
  objc_super v17;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutContent.m"), 36, CFSTR("axis cannot be PXAxisUndefined"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PXSectionedLayoutContent;
  v10 = -[PXSectionedLayoutContent init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_axis = a3;
    v10->_edgeInsets.top = top;
    v10->_edgeInsets.left = left;
    v10->_edgeInsets.bottom = bottom;
    v10->_edgeInsets.right = right;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    sections = v11->_sections;
    v11->_sections = (NSMutableArray *)v12;

  }
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t axis;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  CGSize v13;

  v12.receiver = self;
  v12.super_class = (Class)PXSectionedLayoutContent;
  -[PXSectionedLayoutContent description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  axis = self->_axis;
  if (axis > 2)
    v6 = 0;
  else
    v6 = off_1E5136698[axis];
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("axis %@\n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSectionedLayoutContent contentSize](self, "contentSize");
  NSStringFromCGSize(v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("contentSize %@\n"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("sections %@\n"), self->_sections);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)sections
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_sections, "copy");
}

- (CGSize)contentSize
{
  float64x2_t v3;
  int64_t axis;
  void *v6;
  double v7;
  float64x2_t v8;
  CGSize result;

  v3 = (float64x2_t)vextq_s8((int8x16_t)self->_internalContentSize, (int8x16_t)self->_internalContentSize, 8uLL);
  axis = self->_axis;
  if (axis)
  {
    if (axis == 2 || axis == 1)
      v3 = vaddq_f64(v3, vaddq_f64(*(float64x2_t *)&self->_edgeInsets.top, *(float64x2_t *)&self->_edgeInsets.bottom));
  }
  else
  {
    v8 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutContent.m"), 90, CFSTR("axis == PXAxisUndefined"));

    v3 = v8;
  }
  v7 = v3.f64[1];
  result.height = v3.f64[0];
  result.width = v7;
  return result;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3);
}

- (void)removeAllSections
{
  -[NSMutableArray removeAllObjects](self->_sections, "removeAllObjects");
  -[PXSectionedLayoutContent _adjustSectionsFromIndex:](self, "_adjustSectionsFromIndex:", 0);
}

- (void)removeSections:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[PXSectionedLayoutContent _removeSection:](self, "_removeSection:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)updateSections:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "index");
        if (v8 >= v10)
          v11 = v10;
        else
          v11 = v8;
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
          v8 = v10;
        else
          v8 = v11;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[PXSectionedLayoutContent _adjustSectionsFromIndex:](self, "_adjustSectionsFromIndex:", v8);

}

- (void)insertSection:(id)a3 atIndex:(int64_t)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a3;
  v9 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutContent.m"), 138, CFSTR("section to insert is nil"));

    v7 = 0;
  }
  -[PXSectionedLayoutContent _insertSection:atIndex:](self, "_insertSection:atIndex:", v7, a4);

}

- (void)_addSection:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (-[NSMutableArray containsObject:](self->_sections, "containsObject:"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutContent.m"), 143, CFSTR("section already inserted."));

  }
  -[NSMutableArray addObject:](self->_sections, "addObject:", v6);
  -[PXSectionedLayoutContent _adjustSectionsFromIndex:](self, "_adjustSectionsFromIndex:", -[NSMutableArray count](self->_sections, "count") - 1);

}

- (void)_removeSection:(id)a3
{
  NSMutableArray *sections;
  id v6;
  uint64_t v7;
  void *v8;

  sections = self->_sections;
  v6 = a3;
  if ((-[NSMutableArray containsObject:](sections, "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutContent.m"), 150, CFSTR("section is not contained."));

  }
  v7 = objc_msgSend(v6, "index");
  -[NSMutableArray removeObject:](self->_sections, "removeObject:", v6);

  -[PXSectionedLayoutContent _adjustSectionsFromIndex:](self, "_adjustSectionsFromIndex:", v7);
}

- (void)_insertSection:(id)a3 atIndex:(unint64_t)a4
{
  void *v7;
  id v8;

  v8 = a3;
  if (-[NSMutableArray count](self->_sections, "count") < a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutContent.m"), 157, CFSTR("index %lu out of bounds %lu"), a4, -[NSMutableArray count](self->_sections, "count"));

  }
  -[NSMutableArray insertObject:atIndex:](self->_sections, "insertObject:atIndex:", v8, a4);
  -[PXSectionedLayoutContent _adjustSectionsFromIndex:](self, "_adjustSectionsFromIndex:", a4);

}

- (void)_exchangeSectionAtIndex:(unint64_t)a3 withSectionAtIndex:(unint64_t)a4
{
  unint64_t v7;

  -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->_sections, "exchangeObjectAtIndex:withObjectAtIndex:");
  if (a3 >= a4)
    v7 = a4;
  else
    v7 = a3;
  -[PXSectionedLayoutContent _adjustSectionsFromIndex:](self, "_adjustSectionsFromIndex:", v7);
}

- (void)_adjustSectionsFromIndex:(int64_t)a3
{
  int64_t v3;
  double height;
  double width;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double left;
  double v13;
  double top;
  int64_t axis;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  int64_t v32;
  void *v33;

  v3 = a3;
  width = *MEMORY[0x1E0C9D820];
  height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (-[NSMutableArray count](self->_sections, "count") > (unint64_t)a3)
  {
    if (v3 <= 1)
      v8 = 1;
    else
      v8 = v3;
    -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v8 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v3)
    {
      objc_msgSend(v9, "frame");
      left = v11;
      top = v13;
      if (v3 >= 1)
      {
        axis = self->_axis;
        if (axis)
        {
          if (axis == 2)
          {
            objc_msgSend(v10, "frame");
            left = left + v19;
            objc_msgSend(v10, "frame");
            if (height < v20)
              height = v20;
            width = left;
          }
          else if (axis == 1)
          {
            objc_msgSend(v10, "frame");
            top = top + v16;
            objc_msgSend(v10, "frame");
            if (width < v17)
              width = v17;
            height = top;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutContent.m"), 191, CFSTR("axis == PXAxisUndefined"));

        }
      }
    }
    else
    {
      top = self->_edgeInsets.top;
      left = self->_edgeInsets.left;
    }
    for (; v3 < (unint64_t)-[NSMutableArray count](self->_sections, "count"); ++v3)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "frame");
      v23 = v22;
      v25 = v24;
      objc_msgSend(v21, "setFrame:", left, top);
      objc_msgSend(v21, "setIndex:", v3);
      v26 = self->_axis;
      if (v26)
      {
        if (height >= v25)
          v27 = height;
        else
          v27 = v25;
        v28 = top + v25;
        if (width >= v23)
          v29 = width;
        else
          v29 = v23;
        v30 = height + v25;
        if (v26 != 1)
        {
          v28 = top;
          v30 = height;
          v29 = width;
        }
        if (v26 == 2)
          left = left + v23;
        else
          top = v28;
        if (v26 == 2)
          height = v27;
        else
          height = v30;
        if (v26 == 2)
          width = width + v23;
        else
          width = v29;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutContent.m"), 220, CFSTR("axis == PXAxisUndefined"));

      }
    }

  }
  v32 = self->_axis;
  if (v32)
  {
    if (v32 == 2)
    {
      if (height < self->_internalContentSize.height)
        height = self->_internalContentSize.height;
    }
    else if (v32 == 1 && width < self->_internalContentSize.width)
    {
      width = self->_internalContentSize.width;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutContent.m"), 239, CFSTR("axis == PXAxisUndefined"));

  }
  -[PXSectionedLayoutContent setInternalContentSize:](self, "setInternalContentSize:", width, height);
}

- (int64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)internalContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_internalContentSize.width;
  height = self->_internalContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInternalContentSize:(CGSize)a3
{
  self->_internalContentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
