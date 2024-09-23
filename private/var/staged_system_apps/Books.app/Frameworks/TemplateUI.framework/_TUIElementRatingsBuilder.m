@implementation _TUIElementRatingsBuilder

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

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
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

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (UIColor)startColor
{
  return self->_startColor;
}

- (void)setStartColor:(id)a3
{
  objc_storeStrong((id *)&self->_startColor, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (unint64_t)backgroundKind
{
  return self->_backgroundKind;
}

- (void)setBackgroundKind:(unint64_t)a3
{
  self->_backgroundKind = a3;
}

- (double)rating
{
  return self->_rating;
}

- (void)setRating:(double)a3
{
  self->_rating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_startColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

@end
