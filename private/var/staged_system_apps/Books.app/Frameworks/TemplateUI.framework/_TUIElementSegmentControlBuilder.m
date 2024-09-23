@implementation _TUIElementSegmentControlBuilder

- (void)addAnimationGroup:(id)a3 withName:(id)a4
{
  id v6;
  NSMutableDictionary *animations;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  animations = self->_animations;
  if (!animations)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    v9 = self->_animations;
    self->_animations = v8;

    animations = self->_animations;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](animations, "setObject:forKeyedSubscript:", v10, v6);

}

- (id)finalizeAnimationGroups
{
  TUIAnimationGroupCollection *v3;

  if (-[NSMutableDictionary count](self->_animations, "count"))
  {
    v3 = objc_alloc_init(TUIAnimationGroupCollection);
    -[TUIAnimationGroupCollection setGroups:](v3, "setGroups:", self->_animations);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)addSegmentWithTitle:(id)a3
{
  id v4;
  NSMutableArray *segments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  segments = self->_segments;
  v8 = v4;
  if (!segments)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_segments;
    self->_segments = v6;

    segments = self->_segments;
    v4 = v8;
  }
  -[NSMutableArray addObject:](segments, "addObject:", v4);

}

- (id)finalizeSegments
{
  return -[NSMutableArray copy](self->_segments, "copy");
}

- (TUIMutableDynamicValue)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
  objc_storeStrong((id *)&self->_viewState, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int64_t)selectIndex
{
  return self->_selectIndex;
}

- (void)setSelectIndex:(int64_t)a3
{
  self->_selectIndex = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_segments, 0);
}

@end
