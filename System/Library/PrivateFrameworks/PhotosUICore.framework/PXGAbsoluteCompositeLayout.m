@implementation PXGAbsoluteCompositeLayout

- (PXGAbsoluteCompositeLayout)init
{
  PXGAbsoluteCompositeLayout *v2;
  _PXGAbsoluteSublayoutComposition *v3;
  _PXGAbsoluteSublayoutComposition *absoluteComposition;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGAbsoluteCompositeLayout;
  v2 = -[PXGCompositeLayout init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_PXGAbsoluteSublayoutComposition);
    absoluteComposition = v2->_absoluteComposition;
    v2->_absoluteComposition = v3;

    -[PXGCompositeLayout setComposition:](v2, "setComposition:", v2->_absoluteComposition);
  }
  return v2;
}

- (PXGAbsoluteCompositeLayout)initWithComposition:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAbsoluteCompositeLayout.m"), 45, CFSTR("%s is not available as initializer"), "-[PXGAbsoluteCompositeLayout initWithComposition:]");

  abort();
}

- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a3;
  -[PXGAbsoluteCompositeLayout absoluteComposition](self, "absoluteComposition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertRange:", a4, 1);

  v8.receiver = self;
  v8.super_class = (Class)PXGAbsoluteCompositeLayout;
  -[PXGLayout insertSublayout:atIndex:](&v8, sel_insertSublayout_atIndex_, v6, a4);

}

- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  objc_super v9;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[PXGAbsoluteCompositeLayout absoluteComposition](self, "absoluteComposition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertRange:", location, length);

  v9.receiver = self;
  v9.super_class = (Class)PXGAbsoluteCompositeLayout;
  -[PXGCompositeLayout insertSublayoutProvider:inRange:](&v9, sel_insertSublayoutProvider_inRange_, v7, location, length);

}

- (void)removeSublayoutsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  objc_super v7;

  length = a3.length;
  location = a3.location;
  v7.receiver = self;
  v7.super_class = (Class)PXGAbsoluteCompositeLayout;
  -[PXGLayout removeSublayoutsInRange:](&v7, sel_removeSublayoutsInRange_);
  -[PXGAbsoluteCompositeLayout absoluteComposition](self, "absoluteComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeRange:", location, length);

}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  objc_super v7;

  height = a3.height;
  width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)PXGAbsoluteCompositeLayout;
  -[PXGLayout setContentSize:](&v7, sel_setContentSize_);
  -[PXGAbsoluteCompositeLayout absoluteComposition](self, "absoluteComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentSize:", width, height);

}

- (void)setOrigin:(CGPoint)a3 forSublayoutAtIndex:(int64_t)a4
{
  CGPoint v4;

  v4 = a3;
  -[PXGAbsoluteCompositeLayout setOrigins:forSublayoutsInRange:](self, "setOrigins:forSublayoutsInRange:", &v4, a4, 1);
}

- (void)setOrigins:(const CGPoint *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;

  length = a4.length;
  location = a4.location;
  -[PXGAbsoluteCompositeLayout absoluteComposition](self, "absoluteComposition");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOrigins:forSublayoutsInRange:", a3, location, length);

}

- (void)setFrame:(CGRect)a3 forSublayoutAtIndex:(int64_t)a4
{
  CGRect v4;

  v4 = a3;
  -[PXGAbsoluteCompositeLayout setFrames:forSublayoutsInRange:](self, "setFrames:forSublayoutsInRange:", &v4, a4, 1);
}

- (void)setFrames:(const CGRect *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;

  length = a4.length;
  location = a4.location;
  -[PXGAbsoluteCompositeLayout absoluteComposition](self, "absoluteComposition");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrames:forSublayoutsInRange:", a3, location, length);

}

- (void)setZPosition:(double)a3 forSublayoutAtIndex:(int64_t)a4
{
  double v4;

  v4 = a3;
  -[PXGAbsoluteCompositeLayout setZPositions:forSublayoutsInRange:](self, "setZPositions:forSublayoutsInRange:", &v4, a4, 1);
}

- (void)setZPositions:(const double *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;

  length = a4.length;
  location = a4.location;
  -[PXGAbsoluteCompositeLayout absoluteComposition](self, "absoluteComposition");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setZPositions:forSublayoutsInRange:", a3, location, length);

}

- (void)setReferenceDepth:(double)a3 forSublayoutAtIndex:(int64_t)a4
{
  double v4;

  v4 = a3;
  -[PXGAbsoluteCompositeLayout setReferenceDepths:forSublayoutsInRange:](self, "setReferenceDepths:forSublayoutsInRange:", &v4, a4, 1);
}

- (void)setReferenceDepths:(const double *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;

  length = a4.length;
  location = a4.location;
  -[PXGAbsoluteCompositeLayout absoluteComposition](self, "absoluteComposition");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReferenceDepths:forSublayoutsInRange:", a3, location, length);

}

- (void)setSpriteTransform:(id *)a3 forSublayoutAtIndex:(int64_t)a4
{
  id v6;

  -[PXGAbsoluteCompositeLayout absoluteComposition](self, "absoluteComposition");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSpriteTransforms:forSublayoutsInRange:", a3, a4, 1);

}

- (void)setShouldUpdateSublayoutsInStrictOrder:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXGAbsoluteCompositeLayout absoluteComposition](self, "absoluteComposition");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldUpdateSublayoutsInStrictOrder:", v3);

}

- (BOOL)shouldUpdateSublayoutsInStrictOrder
{
  void *v2;
  char v3;

  -[PXGAbsoluteCompositeLayout absoluteComposition](self, "absoluteComposition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUpdateSublayoutsInStrictOrder");

  return v3;
}

- (_PXGAbsoluteSublayoutComposition)absoluteComposition
{
  return self->_absoluteComposition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absoluteComposition, 0);
}

@end
