@implementation _TUICellScrollObserver

- (_TUICellScrollObserver)initWithPolicy:(id)a3 view:(id)a4 host:(id)a5 uuid:(id)a6 uid:(id)a7
{
  id v13;
  UIView *v14;
  id v15;
  id v16;
  id v17;
  _TUICellScrollObserver *v18;
  _TUICellScrollObserver *v19;
  TUIRenderReferenceOverrideProviding *v20;
  objc_super v22;

  v13 = a3;
  v14 = (UIView *)a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_TUICellScrollObserver;
  v18 = -[_TUICellScrollObserver init](&v22, "init");
  v19 = v18;
  if (v18)
  {
    v18->_view = v14;
    objc_storeStrong((id *)&v18->_policy, a3);
    v20 = (TUIRenderReferenceOverrideProviding *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "renderOverrideProvider"));
    v19->_provider = v20;

    objc_storeStrong((id *)&v19->_uuid, a6);
    objc_storeStrong((id *)&v19->_uid, a7);
  }

  return v19;
}

- (void)reset
{
  NSArray *overrides;
  NSArray *v4;
  CGSize size;
  _QWORD v6[5];

  overrides = self->_overrides;
  if (overrides)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_14D240;
    v6[3] = &unk_242800;
    v6[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](overrides, "enumerateObjectsUsingBlock:", v6);
    v4 = self->_overrides;
    self->_overrides = 0;

  }
  self->_active = 0;
  size = CGRectNull.size;
  self->_visibleBounds.origin = CGRectNull.origin;
  self->_visibleBounds.size = size;
}

- (id)_computeHiddenCells
{
  NSMutableIndexSet *v3;
  CGFloat **v4;
  CGFloat *v5;
  CGFloat *v6;
  uint64_t v7;
  CGRect visibleBounds;
  CGRect v10;

  v3 = objc_opt_new(NSMutableIndexSet);
  v4 = -[TUICellScrollPolicy cells](self->_policy, "cells");
  v5 = *v4;
  v6 = v4[1];
  if (*v4 != v6)
  {
    v7 = 0;
    do
    {
      v10.origin.x = *v5;
      v10.size.width = v5[2];
      visibleBounds = self->_visibleBounds;
      v10.origin.y = visibleBounds.origin.y;
      v10.size.height = visibleBounds.size.height;
      if (!CGRectIntersectsRect(visibleBounds, v10))
        -[NSMutableIndexSet addIndex:](v3, "addIndex:", v7);
      ++v7;
      v5 += 5;
    }
    while (v5 != v6);
  }
  return v3;
}

- (void)updateScrollingWithVisibleBounds:(CGRect)a3 active:(BOOL)a4
{
  _QWORD *v5;
  NSIndexSet *v6;
  NSIndexSet *hiddenCells;
  NSArray *overrides;
  NSArray *v9;
  NSMutableArray *v10;
  NSIndexSet *v11;
  NSMutableArray *v12;
  id v13;
  NSMutableArray *v14;
  NSArray *v15;
  NSArray *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  NSMutableArray *v19;
  _QWORD *v20;
  _QWORD v21[5];
  NSMutableArray *v22;
  _QWORD *v23;
  _QWORD v24[5];

  self->_active = a4;
  self->_visibleBounds = a3;
  v5 = -[TUICellScrollPolicy cells](self->_policy, "cells");
  if (self->_active)
    v6 = 0;
  else
    v6 = (NSIndexSet *)objc_claimAutoreleasedReturnValue(-[_TUICellScrollObserver _computeHiddenCells](self, "_computeHiddenCells"));
  hiddenCells = self->_hiddenCells;
  if (hiddenCells != v6 && !-[NSIndexSet isEqualToIndexSet:](hiddenCells, "isEqualToIndexSet:", v6))
  {
    overrides = self->_overrides;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_14D574;
    v24[3] = &unk_242800;
    v24[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](overrides, "enumerateObjectsUsingBlock:", v24);
    objc_storeStrong((id *)&self->_hiddenCells, v6);
    v9 = self->_overrides;
    self->_overrides = 0;

    if (self->_hiddenCells)
    {
      v10 = objc_opt_new(NSMutableArray);
      v11 = self->_hiddenCells;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_14D584;
      v21[3] = &unk_242828;
      v21[4] = self;
      v23 = v5;
      v12 = v10;
      v22 = v12;
      -[NSIndexSet enumerateIndexesUsingBlock:](v11, "enumerateIndexesUsingBlock:", v21);
      v13 = -[NSIndexSet mutableCopy](v6, "mutableCopy");
      objc_msgSend(v13, "shiftIndexesStartingAtIndex:by:", 0, 1);
      objc_msgSend(v13, "addIndexes:", v6);
      objc_msgSend(v13, "removeIndex:", 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v5[1] - *v5) >> 3));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_14D680;
      v18[3] = &unk_242828;
      v18[4] = self;
      v20 = v5;
      v14 = v12;
      v19 = v14;
      objc_msgSend(v13, "enumerateIndexesUsingBlock:", v18);
      v15 = (NSArray *)-[NSMutableArray copy](v14, "copy");
      v16 = self->_overrides;
      self->_overrides = v15;

    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_14D77C;
  v17[3] = &unk_241D08;
  v17[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v17, 0.25);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_hiddenCells, 0);
}

@end
