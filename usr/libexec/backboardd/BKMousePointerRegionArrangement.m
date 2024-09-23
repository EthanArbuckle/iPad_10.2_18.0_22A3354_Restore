@implementation BKMousePointerRegionArrangement

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_opt_class(BKMutableMousePointerRegionArrangement, a2);
  return -[BKMousePointerRegionArrangement _copyMousePointerRegionArrangementWithClass:](self, "_copyMousePointerRegionArrangementWithClass:", v4);
}

- (NSArray)regions
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keyEnumerator](self->_regionToLayoutDescriptor, "keyEnumerator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));
  v4 = v3;
  if (!v3)
    v3 = &__NSArray0__struct;
  v5 = v3;

  return v5;
}

- (id)regionForDisplayUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keyEnumerator](self->_regionToLayoutDescriptor, "keyEnumerator", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayUUID"));
        v11 = BSEqualObjects(v10, v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)closestRegionForGlobalPoint:(CGPoint)a3 returningClosestContainingPoint:(CGPoint *)a4 returningEdgeMask:(unsigned __int8 *)a5
{
  double y;
  double x;
  NSDictionary *v10;
  NSUInteger v11;
  NSUInteger v12;
  unsigned __int8 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  char v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  id v48;
  NSUInteger v49;
  CGFloat v50;
  CGFloat v51;
  CGPoint *v53;
  unsigned __int8 *v54;
  double v55;
  double v56;
  double v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];

  y = a3.y;
  x = a3.x;
  v56 = CGPointZero.x;
  v57 = CGPointZero.y;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v10 = self->_regionToComputedFrame;
  v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v11)
  {
    v12 = v11;
    v53 = a4;
    v54 = a5;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v59;
    v55 = y;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v59 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v16);
        -[BKMousePointerRegionArrangement _frameForRegion:](self, "_frameForRegion:", v17);
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        objc_msgSend(v17, "cornerRadius");
        v27 = v26;
        v28 = v26 + v21;
        if (y >= v26 + v21)
        {
          v21 = v21 + v25;
          v35 = v21 - v26;
          if (y <= v21 - v26)
          {
            if (x < v19)
            {
              v34 = 2;
              goto LABEL_34;
            }
            v19 = v19 + v23;
            if (x > v19)
            {
              v34 = 8;
LABEL_34:
              v21 = y;
              if (v14)
                goto LABEL_44;
              goto LABEL_45;
            }
            goto LABEL_39;
          }
          v36 = v26 + v19;
          if (x >= v26 + v19)
          {
            v19 = v19 + v23;
            v44 = v19 - v26;
            if (x <= v19 - v26)
            {
              y = v55;
              if (v55 > v21)
              {
                v34 = 4;
                goto LABEL_40;
              }
LABEL_39:
              v34 = 0;
              v21 = y;
LABEL_40:
              v19 = x;
              if (v14)
                goto LABEL_44;
              goto LABEL_45;
            }
            if (v26 > 0.0)
            {
              v45 = x - v44;
              v31 = v55;
              v46 = v55 - v35;
              v47 = sqrt(v45 * v45 + v46 * v46);
              if ((BSFloatLessThanOrEqualToFloat(v47, v26) & 1) != 0)
              {
LABEL_26:
                v34 = 0;
                v21 = v31;
                v19 = x;
              }
              else
              {
                v19 = v44 + v45 / v47 * v27;
                v21 = v35 + v46 / v47 * v27;
                v34 = 12;
              }
LABEL_27:
              y = v31;
              if (v14)
                goto LABEL_44;
              goto LABEL_45;
            }
            v34 = 12;
          }
          else
          {
            if (v26 > 0.0)
            {
              v37 = x - v36;
              v31 = v55;
              v38 = v55 - v35;
              v39 = sqrt(v37 * v37 + v38 * v38);
              if ((BSFloatLessThanOrEqualToFloat(v39, v26) & 1) != 0)
                goto LABEL_26;
              v19 = v36 + v37 / v39 * v27;
              v21 = v35 + v38 / v39 * v27;
              v34 = 6;
              goto LABEL_27;
            }
            v34 = 6;
          }
        }
        else
        {
          v29 = v26 + v19;
          if (x >= v26 + v19)
          {
            v19 = v19 + v23;
            v40 = v19 - v26;
            if (x <= v19 - v26)
            {
              y = v55;
              if (v55 < v21)
              {
                v34 = 1;
              }
              else
              {
                v21 = v55;
                v34 = 0;
              }
              goto LABEL_40;
            }
            if (v26 > 0.0)
            {
              v41 = x - v40;
              v31 = v55;
              v42 = v55 - v28;
              v43 = sqrt(v42 * v42 + v41 * v41);
              if ((BSFloatLessThanOrEqualToFloat(v43, v26) & 1) != 0)
                goto LABEL_26;
              v19 = v40 + v41 / v43 * v27;
              v21 = v28 + v42 / v43 * v27;
              v34 = 9;
              goto LABEL_27;
            }
          }
          else if (v26 > 0.0)
          {
            v30 = x - v29;
            v31 = v55;
            v32 = v55 - v28;
            v33 = sqrt(v30 * v30 + v32 * v32);
            if ((BSFloatLessThanOrEqualToFloat(v33, v26) & 1) != 0)
              goto LABEL_26;
            v19 = v29 + v30 / v33 * v27;
            v21 = v28 + v32 / v33 * v27;
            v34 = 3;
            goto LABEL_27;
          }
          v34 = 0;
        }
        y = v55;
        if (v14)
        {
LABEL_44:
          if (!BSFloatLessThanFloat(sqrt((v21 - y) * (v21 - y) + (v19 - x) * (v19 - x)), sqrt((v57 - y) * (v57 - y) + (v56 - x) * (v56 - x))))goto LABEL_46;
        }
LABEL_45:
        v48 = v17;

        v13 = v34;
        v56 = v19;
        v57 = v21;
        v14 = v48;
LABEL_46:
        ++v16;
      }
      while (v12 != v16);
      v49 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      v12 = v49;
      if (!v49)
      {

        a4 = v53;
        if (v53)
        {
          a5 = v54;
          if (v14)
          {
            -[BKMousePointerRegionArrangement convertFromGlobalPoint:toRegion:](self, "convertFromGlobalPoint:toRegion:", v14, v56, v57);
            v53->x = v50;
            v53->y = v51;
            goto LABEL_57;
          }
LABEL_56:
          v14 = 0;
          *a4 = CGPointZero;
        }
        else
        {
          a5 = v54;
        }
        goto LABEL_57;
      }
    }
  }

  v13 = 0;
  if (a4)
    goto LABEL_56;
  v14 = 0;
LABEL_57:
  if (a5)
    *a5 = v13;
  return v14;
}

- (CGPoint)denormalizedAbsoluteGlobalPosition:(CGPoint)a3
{
  CGFloat y;
  float64x2_t v9;
  double v10;
  CGPoint result;

  y = a3.y;
  __asm { FMOV            V1.2D, #1.0 }
  v9 = vmulq_f64(vminnmq_f64(vmaxnmq_f64((float64x2_t)a3, (float64x2_t)0), _Q1), (float64x2_t)self->_globalBounds.size);
  v10 = v9.f64[1];
  result.x = v9.f64[0];
  result.y = v10;
  return result;
}

- (CGPoint)normalizedGlobalPosition:(CGPoint)a3
{
  double y;
  double x;
  double MaxX;
  double MinX;
  double v8;
  double width;
  double MaxY;
  double MinY;
  double v12;
  double v13;
  double v14;
  CGPoint result;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  MaxX = CGRectGetMaxX(self->_globalBounds);
  MinX = CGRectGetMinX(self->_globalBounds);
  if (MinX < x)
    MinX = x;
  if (MaxX <= MinX)
    v8 = MaxX;
  else
    v8 = MinX;
  v16.origin.x = self->_globalBounds.origin.x;
  v16.origin.y = self->_globalBounds.origin.y;
  width = self->_globalBounds.size.width;
  v16.size.height = self->_globalBounds.size.height;
  v16.size.width = width;
  MaxY = CGRectGetMaxY(v16);
  MinY = CGRectGetMinY(self->_globalBounds);
  if (MinY < y)
    MinY = y;
  if (MaxY <= MinY)
    v12 = MaxY;
  else
    v12 = MinY;
  v13 = v8 / width;
  v14 = v12 / self->_globalBounds.size.height;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)convertToGlobalPoint:(CGPoint)a3 fromRegion:(id)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[BKMousePointerRegionArrangement _frameForRegion:](self, "_frameForRegion:", a4);
  v7 = x + v6;
  v9 = y + v8;
  result.y = v9;
  result.x = v7;
  return result;
}

- (CGPoint)convertFromGlobalPoint:(CGPoint)a3 toRegion:(id)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[BKMousePointerRegionArrangement _frameForRegion:](self, "_frameForRegion:", a4);
  v7 = x - v6;
  v9 = y - v8;
  result.y = v9;
  result.x = v7;
  return result;
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BKMousePointerRegionArrangement *v15;
  id v16;

  v4 = a3;
  v6 = objc_opt_class(BSDescriptionStream, v5);
  v7 = v4;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100091DAC;
  v13[3] = &unk_1000ECD38;
  v14 = v8;
  v15 = self;
  v16 = v10;
  v11 = v10;
  v12 = v8;
  objc_msgSend(v12, "appendProem:block:", self, v13);

}

- (id)_copyMousePointerRegionArrangementWithClass:(Class)a3
{
  char *v4;
  _QWORD *v5;
  CGPoint origin;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v4 = (char *)objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    *(CGPoint *)(v4 + 8) = self->_baseTranslation;
    origin = self->_globalBounds.origin;
    *(CGSize *)(v4 + 40) = self->_globalBounds.size;
    *(CGPoint *)(v4 + 24) = origin;
    v7 = -[NSDictionary copy](self->_regionToComputedFrame, "copy");
    v8 = (void *)v5[7];
    v5[7] = v7;

    v9 = -[NSMutableDictionary copy](self->_regionToLayoutDescriptor, "copy");
    v10 = (void *)v5[8];
    v5[8] = v9;

  }
  return v5;
}

- (CGRect)_frameForRegion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double x;
  double y;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  NSString *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  NSString *v30;
  void *v31;
  uint64_t v32;
  objc_class *v33;
  NSString *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  BKMousePointerRegionArrangement *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  CGRect result;

  v5 = a3;
  if (!v5)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Requesting frame for a nil region")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v23 = NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v26 = (objc_class *)objc_opt_class(self, v25);
      v27 = NSStringFromClass(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v36 = 138544642;
      v37 = v24;
      v38 = 2114;
      v39 = v28;
      v40 = 2048;
      v41 = self;
      v42 = 2114;
      v43 = CFSTR("BKMousePointerRegionArrangement.m");
      v44 = 1024;
      v45 = 271;
      v46 = 2114;
      v47 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v36, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
    __break(0);
    JUMPOUT(0x100091B18);
  }
  v6 = v5;
  v7 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_regionToComputedFrame, "objectForKey:", v5));
  if (!v7)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Requesting frame for a region not part of this arrangement")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v30 = NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v33 = (objc_class *)objc_opt_class(self, v32);
      v34 = NSStringFromClass(v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v36 = 138544642;
      v37 = v31;
      v38 = 2114;
      v39 = v35;
      v40 = 2048;
      v41 = self;
      v42 = 2114;
      v43 = CFSTR("BKMousePointerRegionArrangement.m");
      v44 = 1024;
      v45 = 273;
      v46 = 2114;
      v47 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v36, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v29), "UTF8String"));
    __break(0);
    JUMPOUT(0x100091C04);
  }
  v8 = (void *)v7;
  v9 = BSRectFromValue(v7);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  x = self->_baseTranslation.x;
  y = self->_baseTranslation.y;

  v18 = x + v9;
  v19 = v11 + y;
  v20 = v13;
  v21 = v15;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)_layoutDescriptorForRegion:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BKMousePointerRegionArrangement *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_regionToLayoutDescriptor, "objectForKey:", v5));
  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Layout descriptors and regions must always be paired")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v13 = (objc_class *)objc_opt_class(self, v12);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = 138544642;
      v17 = v11;
      v18 = 2114;
      v19 = v15;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = CFSTR("BKMousePointerRegionArrangement.m");
      v24 = 1024;
      v25 = 282;
      v26 = 2114;
      v27 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v16, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    __break(0);
    JUMPOUT(0x100091D74);
  }
  v7 = (void *)v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionToLayoutDescriptor, 0);
  objc_storeStrong((id *)&self->_regionToComputedFrame, 0);
}

@end
