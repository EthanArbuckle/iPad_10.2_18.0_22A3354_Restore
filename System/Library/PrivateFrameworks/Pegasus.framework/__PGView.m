@implementation __PGView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  -[__PGView animatedLayerProperties](self, "animatedLayerProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)__PGView;
    v7 = -[__PGView _shouldAnimatePropertyWithKey:](&v9, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v7;
}

- (NSArray)animatedLayerProperties
{
  return self->_animatedLayerProperties;
}

- (void)setAnimatedLayerProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedLayerProperties, 0);
}

@end
