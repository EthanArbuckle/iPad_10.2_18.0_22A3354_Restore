@implementation BKCustomAnimationPropertiesView

- (BKCustomAnimationPropertiesView)initWithFrame:(CGRect)a3
{
  BKCustomAnimationPropertiesView *v3;
  uint64_t v4;
  NSMutableSet *animatableKeys;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKCustomAnimationPropertiesView;
  v3 = -[BKCustomAnimationPropertiesView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    animatableKeys = v3->_animatableKeys;
    v3->_animatableKeys = (NSMutableSet *)v4;

  }
  return v3;
}

- (void)addAnimatablePropertyWithKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKCustomAnimationPropertiesView animatableKeys](self, "animatableKeys"));
  objc_msgSend(v5, "addObject:", v4);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKCustomAnimationPropertiesView;
  if (-[BKCustomAnimationPropertiesView _shouldAnimatePropertyWithKey:](&v8, "_shouldAnimatePropertyWithKey:", v4))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKCustomAnimationPropertiesView animatableKeys](self, "animatableKeys"));
    v5 = objc_msgSend(v6, "containsObject:", v4);

  }
  return v5;
}

- (NSMutableSet)animatableKeys
{
  return self->_animatableKeys;
}

- (void)setAnimatableKeys:(id)a3
{
  objc_storeStrong((id *)&self->_animatableKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatableKeys, 0);
}

@end
