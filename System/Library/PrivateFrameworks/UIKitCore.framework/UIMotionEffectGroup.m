@implementation UIMotionEffectGroup

- (id)_keyPathsAndRelativeValuesForPose:(id)a3
{
  void *v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_motionEffects;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "_keyPathsAndRelativeValuesForPose:", v19);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v22 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v6, "objectForKeyedSubscript:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectForKey:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if (v13)
              {
                objc_msgSend(v13, "CA_addValue:multipliedBy:", v12, 1);
                v15 = objc_claimAutoreleasedReturnValue();

                v12 = (void *)v15;
              }
              if (v12)
                objc_msgSend(v4, "setObject:forKey:", v12, v11);

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v8);
        }

      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

  return v4;
}

- (void)setMotionEffects:(NSArray *)motionEffects
{
  objc_setProperty_nonatomic_copy(self, a2, motionEffects, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionEffects, 0);
}

- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3
{
  double vertical;
  double horizontal;
  _UIViewerRelativeDevicePose *v6;
  void *v7;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  v6 = objc_alloc_init(_UIViewerRelativeDevicePose);
  -[_UIViewerRelativeDevicePose setViewerOffset:](v6, "setViewerOffset:", horizontal, vertical);
  -[UIMotionEffectGroup _keyPathsAndRelativeValuesForPose:](self, "_keyPathsAndRelativeValuesForPose:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIMotionEffectGroup *v4;

  v4 = objc_alloc_init(UIMotionEffectGroup);
  objc_storeStrong((id *)&v4->_motionEffects, self->_motionEffects);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_motionEffects, CFSTR("_motionEffects"));
}

- (UIMotionEffectGroup)initWithCoder:(id)a3
{
  id v4;
  UIMotionEffectGroup *v5;
  uint64_t v6;
  NSArray *motionEffects;
  UIMotionEffectGroup *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIMotionEffectGroup;
  v5 = -[UIMotionEffect initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_motionEffects"));
    v6 = objc_claimAutoreleasedReturnValue();
    motionEffects = v5->_motionEffects;
    v5->_motionEffects = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p motionEffects=<%@: %p>>"), v5, self, v7, self->_motionEffects);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p motionEffects=%@>"), v5, self, self->_motionEffects);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)motionEffects
{
  return self->_motionEffects;
}

@end
