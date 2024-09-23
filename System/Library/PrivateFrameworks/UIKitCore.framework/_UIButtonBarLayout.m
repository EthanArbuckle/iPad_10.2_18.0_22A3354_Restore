@implementation _UIButtonBarLayout

- (void)addLayoutViews:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIButtonBarLayout configure](self, "configure");
  -[_UIButtonBarLayout _addLayoutViews:](self, "_addLayoutViews:", v4);

}

- (void)addLayoutGuides:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIButtonBarLayout configure](self, "configure");
  -[_UIButtonBarLayout _addLayoutGuides:](self, "_addLayoutGuides:", v4);

}

- (void)addConstraintsToActivate:(id)a3 toDeactivate:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[_UIButtonBarLayout configure](self, "configure");
  -[_UIButtonBarLayout _addConstraintsToActivate:toDeactivate:](self, "_addConstraintsToActivate:toDeactivate:", v7, v6);

}

- (void)configure
{
  if (self->_dirty || -[_UIButtonBarLayout _shouldBeDirty](self, "_shouldBeDirty"))
  {
    -[_UIButtonBarLayout _configure](self, "_configure");
    self->_dirty = 0;
  }
}

- (BOOL)_shouldBeDirty
{
  return 0;
}

- (void)setDirty:(BOOL)a3
{
  if (self->_dirty != a3)
  {
    self->_dirty = a3;
    if (!a3)
      -[_UIButtonBarLayout _configure](self, "_configure");
  }
}

- (_UIButtonBarLayout)initWithLayoutMetrics:(id)a3
{
  id v4;
  _UIButtonBarLayout *v5;
  uint64_t v6;
  _UIButtonBarLayoutMetricsData *layoutMetrics;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIButtonBarLayout;
  v5 = -[_UIButtonBarLayout init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    layoutMetrics = v5->_layoutMetrics;
    v5->_layoutMetrics = (_UIButtonBarLayoutMetricsData *)v6;

    v5->_dirty = 1;
  }

  return v5;
}

- (BOOL)shouldHorizontallyCenterView:(id)a3
{
  return 0;
}

- (void)addLayoutViews:(id)a3 layoutGuides:(id)a4 constraintsToActivate:(id)a5 constraintsToDeactivate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v13 = a5;
  v11 = a4;
  v12 = a3;
  -[_UIButtonBarLayout configure](self, "configure");
  -[_UIButtonBarLayout _addLayoutViews:](self, "_addLayoutViews:", v12);

  -[_UIButtonBarLayout _addLayoutGuides:](self, "_addLayoutGuides:", v11);
  -[_UIButtonBarLayout _addConstraintsToActivate:toDeactivate:](self, "_addConstraintsToActivate:toDeactivate:", v13, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutMetrics, 0);
}

- (BOOL)isGroupLayout
{
  return 0;
}

- (BOOL)isSpaceLayout
{
  return 0;
}

- (_UIButtonBarLayout)init
{
  -[_UIButtonBarLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UIBarButtonItem)barButtonItem
{
  return 0;
}

- (NSArray)subLayouts
{
  return 0;
}

- (id)_metricsData
{
  return self->_layoutMetrics;
}

- (BOOL)compact
{
  return 0;
}

- (BOOL)suppressSpacing
{
  return 0;
}

- (BOOL)useGroupSizing
{
  return 0;
}

- (double)minimumLayoutWidthGivenMinimumSpaceWidth:(double)a3
{
  return 0.0;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIButtonBarLayout;
  -[_UIButtonBarLayout description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR(" layoutMetrics=%p"), self->_layoutMetrics);
  if (self->_dirty)
    objc_msgSend(v4, "appendString:", CFSTR(" dirty"));
  return v4;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

@end
