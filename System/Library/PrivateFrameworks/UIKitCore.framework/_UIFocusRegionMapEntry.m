@implementation _UIFocusRegionMapEntry

- (_UIFocusRegionMapEntry)initWithFrame:(CGRect)a3 originalRegionFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _UIFocusRegionMapEntry *result;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)_UIFocusRegionMapEntry;
  result = -[_UIFocusRegionMapEntry init](&v13, sel_init);
  if (result)
  {
    result->_frame.origin.x = v11;
    result->_frame.origin.y = v10;
    result->_frame.size.width = v9;
    result->_frame.size.height = v8;
    result->_originalRegionFrame.origin.x = x;
    result->_originalRegionFrame.origin.y = y;
    result->_originalRegionFrame.size.width = width;
    result->_originalRegionFrame.size.height = height;
  }
  return result;
}

- (_UIFocusRegionMapEntry)originalEntry
{
  if (self->_originalEntry)
    self = self->_originalEntry;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  CGSize size;
  CGSize v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  size = self->_frame.size;
  *(CGPoint *)(v4 + 32) = self->_frame.origin;
  *(CGSize *)(v4 + 48) = size;
  v6 = self->_originalRegionFrame.size;
  *(CGPoint *)(v4 + 64) = self->_originalRegionFrame.origin;
  *(CGSize *)(v4 + 80) = v6;
  objc_storeStrong((id *)(v4 + 16), self->_parentEntry);
  objc_storeStrong((id *)(v4 + 8), self->_originalEntry);
  objc_storeStrong((id *)(v4 + 24), self->_occludingFrames);
  return (id)v4;
}

- (id)_mapEntriesByOccludingWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v29;
  double MaxX;
  double MaxY;
  double v32;
  double v33;
  double v34;
  double MinY;
  double MinX;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIFocusRegionMapEntry frame](self, "frame");
  v67.origin.x = x;
  v67.origin.y = y;
  v67.size.width = width;
  v67.size.height = height;
  v47 = CGRectIntersection(v46, v67);
  v8 = v47.origin.x;
  v9 = v47.origin.y;
  v10 = v47.size.width;
  v11 = v47.size.height;
  if (CGRectIsNull(v47))
  {
    v12 = 0;
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[_UIFocusRegionMapEntry frame](self, "frame");
    v68.origin.x = v13;
    v68.origin.y = v14;
    v68.size.width = v15;
    v68.size.height = v16;
    v48.origin.x = v8;
    v48.origin.y = v9;
    v48.size.width = v10;
    v48.size.height = v11;
    if (!CGRectEqualToRect(v48, v68))
    {
      v45 = height;
      v49.origin.x = v8;
      v49.origin.y = v9;
      v49.size.width = v10;
      v49.size.height = v11;
      MinX = CGRectGetMinX(v49);
      -[_UIFocusRegionMapEntry frame](self, "frame");
      MinY = CGRectGetMinY(v50);
      v51.origin.x = v8;
      v51.origin.y = v9;
      v51.size.width = v10;
      v51.size.height = v11;
      v44 = CGRectGetWidth(v51);
      v52.origin.x = v8;
      v52.origin.y = v9;
      v52.size.width = v10;
      v52.size.height = v11;
      v40 = CGRectGetMinY(v52);
      -[_UIFocusRegionMapEntry frame](self, "frame");
      v39 = CGRectGetMinY(v53);
      -[_UIFocusRegionMapEntry frame](self, "frame");
      v34 = v17;
      -[_UIFocusRegionMapEntry frame](self, "frame");
      v33 = v18;
      v54.origin.x = v8;
      v54.origin.y = v9;
      v54.size.width = v10;
      v54.size.height = v11;
      v19 = CGRectGetMinX(v54);
      -[_UIFocusRegionMapEntry frame](self, "frame");
      v20 = v19 - CGRectGetMinX(v55);
      -[_UIFocusRegionMapEntry frame](self, "frame");
      v42 = CGRectGetHeight(v56);
      v57.origin.x = v8;
      v57.origin.y = v9;
      v57.size.width = v10;
      v57.size.height = v11;
      v32 = CGRectGetMinX(v57);
      v58.origin.x = v8;
      v58.origin.y = v9;
      v58.size.width = v10;
      v58.size.height = v11;
      MaxY = CGRectGetMaxY(v58);
      v59.origin.x = v8;
      v59.origin.y = v9;
      v59.size.width = v10;
      v59.size.height = v11;
      v43 = CGRectGetWidth(v59);
      -[_UIFocusRegionMapEntry frame](self, "frame");
      v38 = CGRectGetMaxY(v60);
      v61.origin.x = v8;
      v61.origin.y = v9;
      v61.size.width = v10;
      v61.size.height = v11;
      v37 = CGRectGetMaxY(v61);
      v62.origin.x = v8;
      v62.origin.y = v9;
      v62.size.width = v10;
      v62.size.height = v11;
      MaxX = CGRectGetMaxX(v62);
      -[_UIFocusRegionMapEntry frame](self, "frame");
      v29 = CGRectGetMinY(v63);
      -[_UIFocusRegionMapEntry frame](self, "frame");
      v41 = CGRectGetMaxX(v64);
      v65.origin.x = v8;
      v65.origin.y = v9;
      v65.size.width = v10;
      v65.size.height = v11;
      v21 = CGRectGetMaxX(v65);
      -[_UIFocusRegionMapEntry frame](self, "frame");
      v22 = CGRectGetHeight(v66);
      if (v44 > 0.0 && v40 - v39 > 0.0)
      {
        -[_UIFocusRegionMapEntry sliceWithFrame:](self, "sliceWithFrame:", MinX, MinY, v44, v40 - v39);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v23);

      }
      if (v20 > 0.0 && v42 > 0.0)
      {
        -[_UIFocusRegionMapEntry sliceWithFrame:](self, "sliceWithFrame:", v34, v33, v20, v42);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v24);

      }
      v25 = v41 - v21;
      height = v45;
      if (v43 > 0.0 && v38 - v37 > 0.0)
      {
        -[_UIFocusRegionMapEntry sliceWithFrame:](self, "sliceWithFrame:", v32, MaxY, v43, v38 - v37);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v26);

      }
      if (v25 > 0.0 && v22 > 0.0)
      {
        -[_UIFocusRegionMapEntry sliceWithFrame:](self, "sliceWithFrame:", MaxX, v29, v25, v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v27);

      }
    }
    -[_UIFocusRegionMapEntry _wasOccludedByFrame:](self, "_wasOccludedByFrame:", x, y, width, height);
  }
  return v12;
}

- (id)sliceWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)-[_UIFocusRegionMapEntry copy](self, "copy");
  objc_msgSend(v8, "setFrame:", x, y, width, height);
  objc_msgSend(v8, "setParentEntry:", self);
  objc_msgSend(v8, "setOccludingFrames:", 0);
  return v8;
}

- (void)_wasOccludedByFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIFocusRegionMapEntry parentEntry](self, "parentEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_wasOccludedByFrame:", x, y, width, height);

  -[_UIFocusRegionMapEntry occludingFrames](self, "occludingFrames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[_UIFocusRegionMapEntry setOccludingFrames:](self, "setOccludingFrames:", v10);

  }
  -[_UIFocusRegionMapEntry occludingFrames](self, "occludingFrames");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v11);

}

- (id)_uniqueElementFromArray:(id)a3 forKey:(id)a4
{
  unint64_t v4;
  id v5;
  void *v6;

  v4 = (uint64_t)a4 / 21;
  v5 = a3;
  objc_msgSend(v5, "objectAtIndex:", v4 % objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIColor)visualRepresentationColor
{
  if (qword_1ECD7B728 != -1)
    dispatch_once(&qword_1ECD7B728, &__block_literal_global_204);
  return (UIColor *)-[_UIFocusRegionMapEntry _uniqueElementFromArray:forKey:](self, "_uniqueElementFromArray:forKey:", _MergedGlobals_23_1, self);
}

- (int64_t)visualRepresentationPatternType
{
  void *v3;
  int64_t v4;

  if (qword_1ECD7B738 != -1)
    dispatch_once(&qword_1ECD7B738, &__block_literal_global_205);
  -[_UIFocusRegionMapEntry _uniqueElementFromArray:forKey:](self, "_uniqueElementFromArray:forKey:", qword_1ECD7B730, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  CGRect v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapEntry frame](self, "frame");
  NSStringFromCGRect(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p frame=%@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)originalRegionFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originalRegionFrame.origin.x;
  y = self->_originalRegionFrame.origin.y;
  width = self->_originalRegionFrame.size.width;
  height = self->_originalRegionFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginalRegionFrame:(CGRect)a3
{
  self->_originalRegionFrame = a3;
}

- (void)setOriginalEntry:(id)a3
{
  objc_storeStrong((id *)&self->_originalEntry, a3);
}

- (_UIFocusRegionMapEntry)parentEntry
{
  return self->_parentEntry;
}

- (void)setParentEntry:(id)a3
{
  objc_storeStrong((id *)&self->_parentEntry, a3);
}

- (NSMutableSet)occludingFrames
{
  return self->_occludingFrames;
}

- (void)setOccludingFrames:(id)a3
{
  objc_storeStrong((id *)&self->_occludingFrames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occludingFrames, 0);
  objc_storeStrong((id *)&self->_parentEntry, 0);
  objc_storeStrong((id *)&self->_originalEntry, 0);
}

@end
