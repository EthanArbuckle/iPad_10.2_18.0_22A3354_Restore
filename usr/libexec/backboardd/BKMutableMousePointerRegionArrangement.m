@implementation BKMutableMousePointerRegionArrangement

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_opt_class(BKMousePointerRegionArrangement, a2);
  return -[BKMousePointerRegionArrangement _copyMousePointerRegionArrangementWithClass:](self, "_copyMousePointerRegionArrangementWithClass:", v4);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_opt_class(self, a2);
  return -[BKMousePointerRegionArrangement _copyMousePointerRegionArrangementWithClass:](self, "_copyMousePointerRegionArrangementWithClass:", v4);
}

- (void)addPrimaryRegion:(id)a3
{
  _BKMousePointerRegionLayoutDescriptor *v5;
  NSMutableDictionary *regionToLayoutDescriptor;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  BKMutableMousePointerRegionArrangement *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;

  v16 = a3;
  if (-[NSMutableDictionary count](self->super._regionToLayoutDescriptor, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Only one primary region may be added")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v13 = (objc_class *)objc_opt_class(self, v12);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138544642;
      v18 = v11;
      v19 = 2114;
      v20 = v15;
      v21 = 2048;
      v22 = self;
      v23 = 2114;
      v24 = CFSTR("BKMousePointerRegionArrangement.m");
      v25 = 1024;
      v26 = 307;
      v27 = 2114;
      v28 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    __break(0);
    JUMPOUT(0x100090974);
  }
  v5 = -[_BKMousePointerRegionLayoutDescriptor initWithRegion:relativeRegion:edge:edgePosition:]([_BKMousePointerRegionLayoutDescriptor alloc], "initWithRegion:relativeRegion:edge:edgePosition:", v16, 0, 0, 0.0);
  regionToLayoutDescriptor = self->super._regionToLayoutDescriptor;
  if (!regionToLayoutDescriptor)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8 = self->super._regionToLayoutDescriptor;
    self->super._regionToLayoutDescriptor = v7;

    regionToLayoutDescriptor = self->super._regionToLayoutDescriptor;
  }
  -[NSMutableDictionary setObject:forKey:](regionToLayoutDescriptor, "setObject:forKey:", v5, v16);
  -[BKMutableMousePointerRegionArrangement _updateFrames](self, "_updateFrames");

}

- (void)addRegion:(id)a3 relativeToRegion:(id)a4 alongEdge:(unsigned int)a5 atPosition:(double)a6
{
  uint64_t v7;
  id v11;
  void *v12;
  _BKMousePointerRegionLayoutDescriptor *v13;
  NSMutableDictionary *regionToLayoutDescriptor;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  BKMutableMousePointerRegionArrangement *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v7 = *(_QWORD *)&a5;
  v24 = a3;
  v11 = a4;
  if (!v11)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Regions must be relative to another region if there are existing regions")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v18 = NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v21 = (objc_class *)objc_opt_class(self, v20);
      v22 = NSStringFromClass(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138544642;
      v26 = v19;
      v27 = 2114;
      v28 = v23;
      v29 = 2048;
      v30 = self;
      v31 = 2114;
      v32 = CFSTR("BKMousePointerRegionArrangement.m");
      v33 = 1024;
      v34 = 318;
      v35 = 2114;
      v36 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
    __break(0);
    JUMPOUT(0x100090B4CLL);
  }
  v12 = v11;
  v13 = -[_BKMousePointerRegionLayoutDescriptor initWithRegion:relativeRegion:edge:edgePosition:]([_BKMousePointerRegionLayoutDescriptor alloc], "initWithRegion:relativeRegion:edge:edgePosition:", v24, v11, v7, a6);
  regionToLayoutDescriptor = self->super._regionToLayoutDescriptor;
  if (!regionToLayoutDescriptor)
  {
    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v16 = self->super._regionToLayoutDescriptor;
    self->super._regionToLayoutDescriptor = v15;

    regionToLayoutDescriptor = self->super._regionToLayoutDescriptor;
  }
  -[NSMutableDictionary setObject:forKey:](regionToLayoutDescriptor, "setObject:forKey:", v13, v24);
  -[BKMutableMousePointerRegionArrangement _updateFrames](self, "_updateFrames");

}

- (void)removeRegion:(id)a3
{
  NSMutableDictionary *regionToLayoutDescriptor;

  -[NSMutableDictionary removeObjectForKey:](self->super._regionToLayoutDescriptor, "removeObjectForKey:", a3);
  if (!-[NSMutableDictionary count](self->super._regionToLayoutDescriptor, "count"))
  {
    regionToLayoutDescriptor = self->super._regionToLayoutDescriptor;
    self->super._regionToLayoutDescriptor = 0;

  }
  -[BKMutableMousePointerRegionArrangement _updateFrames](self, "_updateFrames");
}

- (void)_computeFrameForRegionLayoutDescriptor:(id)a3 accumulatedFrames:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  id v35;

  v35 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "region"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v7));
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "relativeRegion"));
    v10 = objc_msgSend(v7, "pointSize");
    v12 = v11;
    v14 = v13;
    if (v9)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerRegionArrangement _layoutDescriptorForRegion:](self, "_layoutDescriptorForRegion:", v9));
      -[BKMutableMousePointerRegionArrangement _computeFrameForRegionLayoutDescriptor:accumulatedFrames:](self, "_computeFrameForRegionLayoutDescriptor:accumulatedFrames:", v15, v6);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v9));
      v17 = BSRectFromValue();
      v19 = v18;
      v32 = v21;
      v33 = v20;

      v22 = objc_msgSend(v35, "edgePosition");
      v24 = v23;
      v25 = BSRectWithSize(v22, v12, v14);
      v27 = v26;
      v34 = v28;
      v30 = v29;
      v10 = objc_msgSend(v35, "edge");
      switch((int)v10)
      {
        case 0:
          v25 = v17 - v12;
          goto LABEL_7;
        case 1:
          v27 = v19 - v14;
          goto LABEL_10;
        case 2:
          v25 = v17 + v33;
LABEL_7:
          v27 = v19 + v24;
          break;
        case 3:
          v27 = v19 + v32;
LABEL_10:
          v25 = v17 + v24;
          break;
        default:
          break;
      }
      v12 = v34;
      v14 = v30;
    }
    else
    {
      v25 = 0.0;
      v27 = 0.0;
    }
    v31 = BSValueWithRect(v10, v25, v27, v12, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v31);
    objc_msgSend(v6, "setObject:forKey:", v8, v7);

  }
}

- (void)_updateFrames
{
  double y;
  double x;
  double height;
  double width;
  id v7;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  NSDictionary *v23;
  NSDictionary *regionToComputedFrame;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  BKMutableMousePointerRegionArrangement *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  CGRect v40;
  CGRect v41;
  CGRect v42;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = self->super._regionToLayoutDescriptor;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->super._regionToLayoutDescriptor, "objectForKey:", v13, (_QWORD)v31));
        -[BKMutableMousePointerRegionArrangement _computeFrameForRegionLayoutDescriptor:accumulatedFrames:](self, "_computeFrameForRegionLayoutDescriptor:accumulatedFrames:", v14, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v13));
        v16 = BSRectFromValue();
        v18 = v17;
        v20 = v19;
        v22 = v21;

        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        v42.origin.x = v16;
        v42.origin.y = v18;
        v42.size.width = v20;
        v42.size.height = v22;
        v41 = CGRectUnion(v40, v42);
        x = v41.origin.x;
        y = v41.origin.y;
        width = v41.size.width;
        height = v41.size.height;

      }
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v10);
  }

  v23 = (NSDictionary *)objc_msgSend(v7, "copy");
  regionToComputedFrame = self->super._regionToComputedFrame;
  self->super._regionToComputedFrame = v23;

  self->super._globalBounds.origin.x = x;
  self->super._globalBounds.origin.y = y;
  self->super._globalBounds.size.width = width;
  self->super._globalBounds.size.height = height;
  v27 = BKLogMousePointer(v25, v26);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = BSNSStringFromCGRect(x, y, width, height);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    *(_DWORD *)buf = 134218242;
    v36 = self;
    v37 = 2114;
    v38 = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "region arrangement %p bounds: %{public}@", buf, 0x16u);

  }
  self->super._baseTranslation.x = -x;
  self->super._baseTranslation.y = -y;

}

@end
