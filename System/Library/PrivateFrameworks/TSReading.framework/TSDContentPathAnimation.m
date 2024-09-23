@implementation TSDContentPathAnimation

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDContentPathAnimation;
  -[TSDContentPathAnimation dealloc](&v3, sel_dealloc);
}

- (TSDContentPath)contentPath
{
  return +[TSDContentPath contentPathWithLocations:](TSDContentPath, "contentPathWithLocations:", self->_contentLocations);
}

- (void)setContentPath:(id)a3
{
  -[TSDContentPathAnimation setContentLocations:](self, "setContentLocations:", objc_msgSend(a3, "i_contentLocations"));
}

- (BOOL)i_canProduceAnimation
{
  return 1;
}

- (id)i_animationWithTransformBlock:(id)a3
{
  void *v5;
  NSArray *contentLocations;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  _OWORD v14[8];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  contentLocations = self->_contentLocations;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](contentLocations, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(contentLocations);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        (*((void (**)(__int128 *__return_ptr, id, uint64_t))a3 + 2))(&v15, a3, v11);
        v14[4] = v19;
        v14[5] = v20;
        v14[6] = v21;
        v14[7] = v22;
        v14[0] = v15;
        v14[1] = v16;
        v14[2] = v17;
        v14[3] = v18;
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", v14));
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](contentLocations, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }
  v12 = (void *)objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform"));
  objc_msgSend(v12, "setValues:", v5);
  -[TSDContentPathAnimation duration](self, "duration");
  objc_msgSend(v12, "setDuration:");
  objc_msgSend(v12, "setTimingFunction:", -[TSDContentPathAnimation timingFunction](self, "timingFunction"));
  objc_msgSend(v12, "setKeyTimes:", self->_keyTimes);
  objc_msgSend(v12, "setTimingFunctions:", self->_timingFunctions);
  return v12;
}

- (id)i_endLocation
{
  return -[NSArray lastObject](self->_contentLocations, "lastObject");
}

- (NSArray)contentLocations
{
  return self->_contentLocations;
}

- (void)setContentLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSArray)keyTimes
{
  return self->_keyTimes;
}

- (void)setKeyTimes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)timingFunctions
{
  return self->_timingFunctions;
}

- (void)setTimingFunctions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end
