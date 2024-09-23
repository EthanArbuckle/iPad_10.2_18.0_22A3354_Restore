@implementation MapsAutoLayoutContext

- (MapsAutoLayoutContext)init
{
  MapsAutoLayoutContext *v2;
  NSMutableArray *v3;
  NSMutableArray *constraints;
  NSMutableArray *v5;
  NSMutableArray *mutableConstraints;
  NSMutableDictionary *v7;
  NSMutableDictionary *metrics;
  NSMutableDictionary *v9;
  NSMutableDictionary *views;
  NSMutableDictionary *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MapsAutoLayoutContext;
  v2 = -[MapsAutoLayoutContext init](&v14, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    constraints = v2->_constraints;
    v2->_constraints = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableConstraints = v2->_mutableConstraints;
    v2->_mutableConstraints = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    metrics = v2->_metrics;
    v2->_metrics = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    views = v2->_views;
    v2->_views = v9;

    v11 = v2->_metrics;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAutoLayoutContext _defaultMetrics](v2, "_defaultMetrics"));
    -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", v12);

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MapsAutoLayoutContext *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *constraints;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *mutableConstraints;
  NSArray *v11;
  NSArray *oldMutableConstraints;
  NSMutableDictionary *v13;
  NSMutableDictionary *metrics;
  NSMutableDictionary *v15;
  NSMutableDictionary *views;

  v4 = objc_alloc_init(MapsAutoLayoutContext);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAutoLayoutContext constraints](self, "constraints"));
  v6 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");
  constraints = v4->_constraints;
  v4->_constraints = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAutoLayoutContext mutableConstraints](self, "mutableConstraints"));
  v9 = (NSMutableArray *)objc_msgSend(v8, "mutableCopy");
  mutableConstraints = v4->_mutableConstraints;
  v4->_mutableConstraints = v9;

  v11 = (NSArray *)-[NSArray copy](self->_oldMutableConstraints, "copy");
  oldMutableConstraints = v4->_oldMutableConstraints;
  v4->_oldMutableConstraints = v11;

  v13 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_metrics, "mutableCopy");
  metrics = v4->_metrics;
  v4->_metrics = v13;

  v15 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_views, "mutableCopy");
  views = v4->_views;
  v4->_views = v15;

  return v4;
}

- (id)_defaultMetrics
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return sub_1002A8AFC(CFSTR("REQ,LOW,HI"), 999.0, (uint64_t)a2, v2, v3, v4, v5, v6, v7, 0x406F400000000000);
}

- (NSArray)constraints
{
  return (NSArray *)self->_constraints;
}

- (NSArray)mutableConstraints
{
  return (NSArray *)self->_mutableConstraints;
}

- (void)designateConstraintsMutable:(id)a3
{
  NSMutableArray *constraints;
  id v5;

  constraints = self->_constraints;
  v5 = a3;
  -[NSMutableArray removeObjectsInArray:](constraints, "removeObjectsInArray:", v5);
  -[MapsAutoLayoutContext addMutableConstraints:](self, "addMutableConstraints:", v5);

}

- (void)removeConstraints:(id)a3
{
  NSMutableArray *constraints;
  id v5;

  constraints = self->_constraints;
  v5 = a3;
  -[NSMutableArray removeObjectsInArray:](constraints, "removeObjectsInArray:", v5);
  -[NSMutableArray removeObjectsInArray:](self->_mutableConstraints, "removeObjectsInArray:", v5);

}

- (void)removeConstraint:(id)a3
{
  NSMutableArray *constraints;
  id v5;

  constraints = self->_constraints;
  v5 = a3;
  -[NSMutableArray removeObject:](constraints, "removeObject:", v5);
  -[NSMutableArray removeObject:](self->_mutableConstraints, "removeObject:", v5);

}

- (void)addConstraint:(id)a3
{
  -[NSMutableArray addObject:](self->_constraints, "addObject:", a3);
}

- (void)addMutableConstraint:(id)a3
{
  -[NSMutableArray addObject:](self->_mutableConstraints, "addObject:", a3);
}

- (void)addConstraints:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

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
        -[MapsAutoLayoutContext addConstraint:](self, "addConstraint:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addMutableConstraints:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

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
        -[MapsAutoLayoutContext addMutableConstraint:](self, "addMutableConstraint:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addMetricsFromDictionary:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->_metrics, "addEntriesFromDictionary:", a3);
}

- (void)addViewsFromDictionary:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->_views, "addEntriesFromDictionary:", a3);
}

- (id)addVisualFormat:(id)a3
{
  return -[MapsAutoLayoutContext addVisualFormat:withOptions:](self, "addVisualFormat:withOptions:", a3, 0);
}

- (id)addVisualFormat:(id)a3 withOptions:(unint64_t)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", a3, a4, self->_metrics, self->_views));
  -[MapsAutoLayoutContext addConstraints:](self, "addConstraints:", v5);
  return v5;
}

- (void)setTranslatesAutoResizingMaskIntoConstraints:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a4;
  v5 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setTranslatesAutoresizingMaskIntoConstraints:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)constrainView:(id)a3 attribute:(int64_t)a4 equalToView:(id)a5
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, 0, a5, a4, 1.0, 0.0));
  -[MapsAutoLayoutContext addConstraint:](self, "addConstraint:", v6);
  return v6;
}

- (id)constrainView:(id)a3 attribute:(int64_t)a4 lessThanView:(id)a5
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, -1, a5, a4, 1.0, 0.0));
  -[MapsAutoLayoutContext addConstraint:](self, "addConstraint:", v6);
  return v6;
}

- (id)heightOfView:(id)a3 isProportionalToHeightOfView:(id)a4 withRatio:(double)a5
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 8, 0, a4, 8, a5, 0.0));
  -[MapsAutoLayoutContext addConstraint:](self, "addConstraint:", v6);
  return v6;
}

- (id)widthOfView:(id)a3 isProportionalToWidthOfView:(id)a4 withRatio:(double)a5
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 7, 0, a4, 7, a5, 0.0));
  -[MapsAutoLayoutContext addConstraint:](self, "addConstraint:", v6);
  return v6;
}

- (id)attribute:(int64_t)a3 isEqualToAttribute:(int64_t)a4 ofView:(id)a5
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a5, a3, 0, a5, a4, 1.0, 0.0));
  -[MapsAutoLayoutContext addConstraint:](self, "addConstraint:", v6);
  return v6;
}

- (id)addConstraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7
{
  return -[MapsAutoLayoutContext addConstraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](self, "addConstraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, a5, a6, a7, 1.0, 0.0);
}

- (id)addConstantConstraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toValue:(double)a6
{
  return -[MapsAutoLayoutContext addConstraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](self, "addConstraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, a5, 0, 0, 0.0, a6);
}

- (id)addConstraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 constant:(double)a9
{
  void *v10;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, a5, a6, a7, a8, a9));
  -[MapsAutoLayoutContext addConstraint:](self, "addConstraint:", v10);
  return v10;
}

- (void)removeImmutableConstraintsFromView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSMutableArray count](self->_constraints, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAutoLayoutContext constraints](self, "constraints"));
    objc_msgSend(v5, "removeConstraints:", v4);

  }
}

- (void)removeMutableConstraintsFromView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSMutableArray count](self->_mutableConstraints, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAutoLayoutContext mutableConstraints](self, "mutableConstraints"));
    objc_msgSend(v5, "removeConstraints:", v4);

  }
}

- (void)removeConstraintsFromView:(id)a3
{
  id v4;

  v4 = a3;
  -[MapsAutoLayoutContext removeImmutableConstraintsFromView:](self, "removeImmutableConstraintsFromView:", v4);
  -[MapsAutoLayoutContext removeMutableConstraintsFromView:](self, "removeMutableConstraintsFromView:", v4);

}

- (void)addConstraintsToView:(id)a3 previousContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "removeConstraintsFromView:", v10);
  if (-[NSMutableArray count](self->_constraints, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAutoLayoutContext constraints](self, "constraints"));
    objc_msgSend(v10, "addConstraints:", v8);

  }
  if (-[NSMutableArray count](self->_mutableConstraints, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAutoLayoutContext mutableConstraints](self, "mutableConstraints"));
    objc_msgSend(v10, "addConstraints:", v9);

  }
}

- (void)addImmutableConstraintsToView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSMutableArray count](self->_constraints, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAutoLayoutContext constraints](self, "constraints"));
    objc_msgSend(v5, "addConstraints:", v4);

  }
}

- (void)beginUpdateConstraints
{
  NSMutableArray *v3;
  NSMutableArray *mutableConstraints;

  objc_storeStrong((id *)&self->_oldMutableConstraints, self->_mutableConstraints);
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mutableConstraints = self->_mutableConstraints;
  self->_mutableConstraints = v3;

}

- (void)endUpdateConstraintsOnView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSArray count](self->_oldMutableConstraints, "count"))
    objc_msgSend(v5, "removeConstraints:", self->_oldMutableConstraints);
  if (-[NSMutableArray count](self->_mutableConstraints, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAutoLayoutContext mutableConstraints](self, "mutableConstraints"));
    objc_msgSend(v5, "addConstraints:", v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldMutableConstraints, 0);
  objc_storeStrong((id *)&self->_mutableConstraints, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
