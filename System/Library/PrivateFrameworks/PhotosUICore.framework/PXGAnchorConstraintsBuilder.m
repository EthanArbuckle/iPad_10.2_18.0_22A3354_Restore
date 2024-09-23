@implementation PXGAnchorConstraintsBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
}

- (PXGAnchorConstraintsBuilder)init
{
  PXGAnchorConstraintsBuilder *v2;
  NSMutableArray *v3;
  NSMutableArray *constraints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGAnchorConstraintsBuilder;
  v2 = -[PXGAnchorConstraintsBuilder init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    constraints = v2->_constraints;
    v2->_constraints = v3;

  }
  return v2;
}

- (NSArray)constraints
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_constraints, "copy");
}

- (void)keepSpriteWithReference:(id)a3 referencingOptions:(unint64_t)a4 visuallyStableForAttribute:(int64_t)a5
{
  id v8;
  NSObject *v9;
  PXGAnchorConstraint *v10;
  uint8_t v11[16];

  v8 = a3;
  if (!a5)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "invalid attribute", v11, 2u);
    }

  }
  v10 = objc_alloc_init(PXGAnchorConstraint);
  -[PXGAnchorConstraint setSpriteReference:](v10, "setSpriteReference:", v8);
  -[PXGAnchorConstraint setReferencingOptions:](v10, "setReferencingOptions:", a4);
  -[PXGAnchorConstraint setSpriteAttribute:](v10, "setSpriteAttribute:", a5);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v10);

}

- (void)keepVisiblePortionOfSpriteWithReference:(id)a3 referencingOptions:(unint64_t)a4 padding:(UIEdgeInsets)a5 visuallyStableForAttribute:(int64_t)a6
{
  double right;
  double bottom;
  double left;
  double top;
  id v13;
  NSObject *v14;
  PXGAnchorConstraint *v15;
  uint8_t v16[16];

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v13 = a3;
  if (!a6)
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "invalid attribute", v16, 2u);
    }

  }
  v15 = objc_alloc_init(PXGAnchorConstraint);
  -[PXGAnchorConstraint setVisiblePortionOnly:](v15, "setVisiblePortionOnly:", 1);
  -[PXGAnchorConstraint setSpriteReference:](v15, "setSpriteReference:", v13);
  -[PXGAnchorConstraint setReferencingOptions:](v15, "setReferencingOptions:", a4);
  -[PXGAnchorConstraint setPadding:](v15, "setPadding:", top, left, bottom, right);
  -[PXGAnchorConstraint setSpriteAttribute:](v15, "setSpriteAttribute:", a6);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v15);

}

- (void)keepEdge:(unsigned int)a3 ofSpriteWithReference:(id)a4 referencingOptions:(unint64_t)a5 lessThanOrEqualToVisibleEdge:(unsigned int)a6 offset:(double)a7
{
  -[PXGAnchorConstraintsBuilder _keepEdge:ofSpriteWithReference:referencingOptions:inequality:visibleEdge:offset:](self, "_keepEdge:ofSpriteWithReference:referencingOptions:inequality:visibleEdge:offset:", *(_QWORD *)&a3, a4, a5, -1, *(_QWORD *)&a6, a7);
}

- (void)keepEdge:(unsigned int)a3 ofSpriteWithReference:(id)a4 referencingOptions:(unint64_t)a5 greaterThanOrEqualToVisibleEdge:(unsigned int)a6 offset:(double)a7
{
  -[PXGAnchorConstraintsBuilder _keepEdge:ofSpriteWithReference:referencingOptions:inequality:visibleEdge:offset:](self, "_keepEdge:ofSpriteWithReference:referencingOptions:inequality:visibleEdge:offset:", *(_QWORD *)&a3, a4, a5, 1, *(_QWORD *)&a6, a7);
}

- (void)_keepEdge:(unsigned int)a3 ofSpriteWithReference:(id)a4 referencingOptions:(unint64_t)a5 inequality:(int64_t)a6 visibleEdge:(unsigned int)a7 offset:(double)a8
{
  uint64_t v9;
  uint64_t v12;
  id v14;
  NSObject *v15;
  PXGAnchorConstraint *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v9 = *(_QWORD *)&a7;
  v12 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  if (((((_DWORD)v12 - 1) & 0xFFFFFFFD) != 0) == ((((_DWORD)v9 - 1) & 0xFFFFFFFD) == 0))
  {
    PXAssertGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 134218240;
      v18 = v12;
      v19 = 2048;
      v20 = v9;
      _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "incompatible sprite edge %li with visible edge %li", (uint8_t *)&v17, 0x16u);
    }

  }
  v16 = objc_alloc_init(PXGAnchorConstraint);
  -[PXGAnchorConstraint setSpriteEdge:](v16, "setSpriteEdge:", v12);
  -[PXGAnchorConstraint setSpriteReference:](v16, "setSpriteReference:", v14);
  -[PXGAnchorConstraint setReferencingOptions:](v16, "setReferencingOptions:", a5);
  -[PXGAnchorConstraint setInequality:](v16, "setInequality:", a6);
  -[PXGAnchorConstraint setVisibleRectEdge:](v16, "setVisibleRectEdge:", v9);
  -[PXGAnchorConstraint setOffset:](v16, "setOffset:", a8);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v16);

}

@end
