@implementation TUIAnchorSet

- (TUIAnchorSet)initWithAxis:(unint64_t)a3
{
  TUIAnchorSet *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIAnchorSet;
  result = -[TUIAnchorSet init](&v5, "init");
  if (result)
    result->_axis = a3;
  return result;
}

- (TUIAnchorSet)initWithAnchorSet:(id)a3
{
  id v4;
  id v5;
  TUIAnchorSet *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIAnchorSet;
  v5 = -[TUIAnchorSet init](&v8, "init");
  v6 = (TUIAnchorSet *)v5;
  if (v5)
  {
    *((_QWORD *)v5 + 13) = 0;
    if (v4)
    {
      *((_QWORD *)v5 + 13) = *((_QWORD *)v4 + 13);
      if (v5 != v4)
      {
        sub_915FC((char *)v5 + 8, *((char **)v4 + 1), *((_QWORD *)v4 + 2), (uint64_t)(*((_QWORD *)v4 + 2) - *((_QWORD *)v4 + 1)) >> 3);
        sub_1327B4(&v6->_logicalScrollAnchors.__begin_, *((_QWORD *)v4 + 10), *((_QWORD *)v4 + 11), (uint64_t)(*((_QWORD *)v4 + 11) - *((_QWORD *)v4 + 10)) >> 4);
        sub_1327B4(&v6->_verticalTriggerAnchors.__begin_, *((_QWORD *)v4 + 4), *((_QWORD *)v4 + 5), (uint64_t)(*((_QWORD *)v4 + 5) - *((_QWORD *)v4 + 4)) >> 4);
        sub_1327B4(&v6->_horizontalTriggerAnchors.__begin_, *((_QWORD *)v4 + 7), *((_QWORD *)v4 + 8), (uint64_t)(*((_QWORD *)v4 + 8) - *((_QWORD *)v4 + 7)) >> 4);
      }
    }
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TUIAnchorSet initWithAnchorSet:]([TUIMutableAnchorSet alloc], "initWithAnchorSet:", self);
}

- (CGPoint)proposeAnchorOffsetWithScrollView:(id)a3 velocity:(CGPoint)a4 target:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t axis;
  double v25;
  char *v26;
  double v27;
  _BOOL4 v28;
  _BOOL4 v29;
  double v30;
  double *begin;
  double *end;
  unint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double *v41;
  unint64_t v42;
  double *v43;
  double *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  BOOL v53;
  unint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v62;
  double v63;
  double v64;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  v8 = a3;
  objc_msgSend(v8, "contentInset");
  v12 = v11;
  v14 = v13;
  v62 = v10;
  v63 = v9;
  v15 = x + v9;
  v16 = y + v10;
  if (self->_axis == 1)
    v17 = x + v9;
  else
    v17 = y + v10;
  objc_msgSend(v8, "contentSize");
  v64 = v18;
  v20 = v19;
  objc_msgSend(v8, "bounds");
  v23 = v22;
  axis = self->_axis;
  if (axis == 1)
  {
    v25 = v21;
    v26 = (char *)objc_msgSend(v8, "effectiveUserInterfaceLayoutDirection");
    v27 = v25 - (v63 + v62);
    axis = self->_axis;
    v28 = axis == 1;
    v29 = v26 == (_BYTE *)&dword_0 + 1;
    if (v26 == (_BYTE *)&dword_0 + 1)
    {
      v17 = v64 - v17;
    }
    else if (axis == 1)
    {
      v30 = v64 - v27;
      if (v17 == 0.0 || v17 == v30)
        goto LABEL_76;
      v29 = 0;
      goto LABEL_28;
    }
    if (v26 == (_BYTE *)&dword_0 + 1 && axis == 1)
    {
      if (v17 == v27 || v17 == v64)
        goto LABEL_75;
      v28 = 1;
      v29 = 1;
      goto LABEL_28;
    }
  }
  else
  {
    v29 = 0;
    v28 = 0;
  }
  if (axis == 2 && (v17 == 0.0 || v17 == v20 - (v23 - (v12 + v14))))
    goto LABEL_74;
LABEL_28:
  begin = self->_scrollAnchors.__begin_;
  end = self->_scrollAnchors.__end_;
  v36 = end - begin;
  if (!v36)
    goto LABEL_74;
  if (v36 == 1)
    goto LABEL_30;
  if (v28)
    v37 = v15;
  else
    v37 = v16;
  v38 = a4.y;
  if (v28)
    v38 = a4.x;
  if (v29)
    v39 = v64 - v37;
  else
    v39 = v37;
  if (v29)
    v40 = -v38;
  else
    v40 = v38;
  if (end != begin)
  {
    v41 = self->_scrollAnchors.__begin_;
    do
    {
      v42 = v36 >> 1;
      v43 = &v41[v36 >> 1];
      v45 = *v43;
      v44 = v43 + 1;
      v46 = v45;
      v36 += ~(v36 >> 1);
      if (v45 < v39)
        v41 = v44;
      else
        v36 = v42;
    }
    while (v36);
    if (v41 != end)
    {
      if (v41 == begin)
      {
LABEL_30:
        v17 = *begin;
        if (!v29)
          goto LABEL_76;
LABEL_75:
        v17 = v64 - v17;
        goto LABEL_76;
      }
      v47 = *(v41 - 1);
      v17 = *v41;
      if (v28)
      {
        objc_msgSend(v8, "contentSize", v46);
        v49 = v48;
      }
      else
      {
        objc_msgSend(v8, "contentSize", v46);
        v49 = v50;
      }
      if (self->_axis == 1)
      {
        objc_msgSend(v8, "contentOffset");
      }
      else
      {
        objc_msgSend(v8, "contentOffset");
        v51 = v52;
      }
      if (v40 <= 0.0 && v51 + v40 * 1000.0 <= v49)
      {
        if (v40 >= 0.0 && (v17 > v49 ? (v53 = v39 == v49) : (v53 = 0), v53))
        {
          v17 = v39;
        }
        else
        {
          if (v40 == 0.0)
          {
            if (v39 <= (v47 + v17) * 0.5)
              v17 = v47;
            if (v29)
              goto LABEL_75;
            goto LABEL_76;
          }
          v17 = v47;
        }
      }
LABEL_74:
      if (!v29)
        goto LABEL_76;
      goto LABEL_75;
    }
  }
  v17 = *(end - 1);
  if (v29)
    goto LABEL_75;
LABEL_76:
  v54 = self->_axis;
  if (v54 == 1)
    v55 = v17;
  else
    v55 = v15;
  if (v54 == 1)
    v56 = v16;
  else
    v56 = v17;
  v57 = v55 - v63;
  v58 = v56 - v62;

  v59 = v57;
  v60 = v58;
  result.y = v60;
  result.x = v59;
  return result;
}

- (id)scrollAnchorWithScrollView:(id)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t axis;
  double v21;
  id *begin;
  void *v23;
  double v24;
  double v25;
  double v26;
  char *v27;
  double v30;
  double v31;
  id v32;
  double v33;
  TUIScrollAnchor *v34;
  double v36;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = v7;
  if (self->_axis == 1)
    v9 = x;
  else
    v9 = y;
  objc_msgSend(v7, "contentSize");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v8, "contentScaleFactor");
  v15 = TUISizeRoundedForScale(v11, v13, v14);
  v17 = v16;
  objc_msgSend(v8, "bounds");
  axis = self->_axis;
  if (axis == 1)
  {
    v17 = v15;
    v21 = v18;
  }
  else
  {
    v21 = v19;
  }
  if (axis == 1 && objc_msgSend(v8, "effectiveUserInterfaceLayoutDirection") == (char *)&dword_0 + 1)
    v9 = v15 - v9;
  begin = (id *)self->_logicalScrollAnchors.__begin_;
  if (begin == self->_logicalScrollAnchors.__end_)
    goto LABEL_35;
  v23 = 0;
  v24 = v21 + v9;
  v25 = v9 + v21 * 0.5;
  v36 = 0.0;
  v26 = 1.79769313e308;
  while (1)
  {
    v27 = (char *)objc_msgSend(begin[1], "position");
    if (v9 <= 0.0 && v27 == 0)
    {
      if (v9 <= *(double *)begin)
        goto LABEL_32;
      goto LABEL_27;
    }
    if (v24 >= v17 && v27 == (_BYTE *)&dword_0 + 1)
      break;
    if (v27 == (_BYTE *)&dword_0 + 2)
    {
      v30 = *(double *)begin;
      v31 = vabdd_f64(*(double *)begin, v25);
      if (v31 < v26)
      {
        v32 = begin[1];

        if (v21 <= 0.0)
          v33 = 0.0;
        else
          v33 = (v30 - v25 + v30 - v25) / v21;
        v36 = v33;
        goto LABEL_28;
      }
    }
LABEL_27:
    v32 = v23;
    v31 = v26;
LABEL_28:
    begin += 2;
    v26 = v31;
    v23 = v32;
    if (begin == self->_logicalScrollAnchors.__end_)
      goto LABEL_33;
  }
  if (v24 < *(double *)begin)
    goto LABEL_27;
LABEL_32:
  v32 = begin[1];

  v36 = 0.0;
LABEL_33:
  if (!v32)
  {
LABEL_35:
    v34 = 0;
    goto LABEL_36;
  }
  v34 = -[TUIScrollAnchor initWithAnchor:relativeDistance:]([TUIScrollAnchor alloc], "initWithAnchor:relativeDistance:", v32, v36);

LABEL_36:
  return v34;
}

- (id)feedNotVisibleTriggerStatesForAxis:(unint64_t)a3
{
  TUIMutableTriggerStateUpdate *v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  TUITriggerStateUpdate *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;

  v5 = objc_alloc_init(TUIMutableTriggerStateUpdate);
  v6 = 32;
  if (a3 == 1)
    v6 = 56;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  sub_132A28(&v11, *(uint64_t *)((char *)&self->super.isa + v6), *(uint64_t *)((char *)&self->_scrollAnchors.__begin_ + v6), (*(char **)((char *)&self->_scrollAnchors.__begin_ + v6) - *(char **)((char *)&self->super.isa + v6)) >> 4);
  for (i = v11; i != v12; i += 16)
  {
    v8 = *(id *)(i + 8);
    -[TUIMutableTriggerStateUpdate addUpdateForTrigger:state:](v5, "addUpdateForTrigger:state:", v8, 4);

  }
  v9 = -[TUITriggerStateUpdate initWithTriggerStateUpdate:]([TUITriggerStateUpdate alloc], "initWithTriggerStateUpdate:", v5);
  v14 = (void **)&v11;
  sub_132A9C(&v14);

  return v9;
}

- (id)computeTriggerStatesInScrollView:(id)a3 axis:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  TUIMutableTriggerStateUpdate *v17;
  uint64_t v18;
  uint64_t i;
  double v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  TUITriggerStateUpdate *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void **v29;
  CGRect v30;

  v6 = a3;
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (objc_msgSend(v6, "effectiveUserInterfaceLayoutDirection") == (char *)&dword_0 + 1)
  {
    objc_msgSend(v6, "contentSize");
    v16 = v15;
    v30.origin.x = v8;
    v30.origin.y = v10;
    v30.size.width = v12;
    v30.size.height = v14;
    v8 = v16 - CGRectGetMinX(v30) - v12;
  }
  if (a4 == 1)
    v10 = v8;
  else
    v12 = v14;
  v17 = objc_alloc_init(TUIMutableTriggerStateUpdate);
  v18 = 32;
  if (a4 == 1)
    v18 = 56;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  sub_132A28(&v26, *(uint64_t *)((char *)&self->super.isa + v18), *(uint64_t *)((char *)&self->_scrollAnchors.__begin_ + v18), (*(char **)((char *)&self->_scrollAnchors.__begin_ + v18) - *(char **)((char *)&self->super.isa + v18)) >> 4);
  for (i = v26; i != v27; i += 16)
  {
    v20 = *(double *)i;
    v21 = *(id *)(i + 8);
    if (v20 - v10 >= v12)
      v22 = 1;
    else
      v22 = 2;
    if (v20 - v10 >= 0.0)
      v23 = v22;
    else
      v23 = 3;
    -[TUIMutableTriggerStateUpdate addUpdateForTrigger:state:](v17, "addUpdateForTrigger:state:", v21, v23);

  }
  v24 = -[TUITriggerStateUpdate initWithTriggerStateUpdate:]([TUITriggerStateUpdate alloc], "initWithTriggerStateUpdate:", v17);
  v29 = (void **)&v26;
  sub_132A9C(&v29);

  return v24;
}

- (double)offsetForTriggerWithName:(id)a3 inScrollView:(id)a4
{
  id v6;
  id v7;
  id *end;
  id *begin;
  double v10;
  id v11;
  void *v12;
  unsigned __int8 v13;

  v6 = a3;
  v7 = a4;
  begin = (id *)self->_verticalTriggerAnchors.__begin_;
  end = (id *)self->_verticalTriggerAnchors.__end_;
  while (begin != end)
  {
    v10 = *(double *)begin;
    v11 = begin[1];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
    v13 = objc_msgSend(v12, "isEqualToString:", v6);

    if ((v13 & 1) != 0)
      goto LABEL_6;
    end = (id *)self->_verticalTriggerAnchors.__end_;
    begin += 2;
  }
  v10 = NAN;
LABEL_6:

  return v10;
}

- (void)appendTriggerAnchorsToSet:(id)a3 forAxis:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;

  v6 = a3;
  v7 = 32;
  if (a4 == 1)
    v7 = 56;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  sub_132A28(&v12, *(uint64_t *)((char *)&self->super.isa + v7), *(uint64_t *)((char *)&self->_scrollAnchors.__begin_ + v7), (*(char **)((char *)&self->_scrollAnchors.__begin_ + v7) - *(char **)((char *)&self->super.isa + v7)) >> 4);
  v9 = v12;
  v8 = v13;
  while (v9 != v8)
  {
    v10 = *(double *)v9;
    v11 = *(id *)(v9 + 8);
    objc_msgSend(v6, "appendTriggerAnchorWithOffset:trigger:axis:", v11, a4, v10);

    v8 = v13;
    v9 += 16;
  }
  v15 = (void **)&v12;
  sub_132A9C(&v15);

}

- (id)plainScrollAnchors
{
  id v3;
  double *i;
  void *v5;
  id v6;

  v3 = objc_alloc_init((Class)NSMutableArray);
  for (i = self->_scrollAnchors.__begin_; i != self->_scrollAnchors.__end_; ++i)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *i));
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = objc_msgSend(v3, "copy");

  return v6;
}

- (id)plainVerticalTriggerAnchors
{
  id v3;
  double *i;
  void *v5;
  id v6;

  v3 = objc_alloc_init((Class)NSMutableArray);
  for (i = (double *)self->_verticalTriggerAnchors.__begin_; i != self->_verticalTriggerAnchors.__end_; i += 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *i));
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = objc_msgSend(v3, "copy");

  return v6;
}

- (id)plainHorizontalTriggerAnchors
{
  id v3;
  double *i;
  void *v5;
  id v6;

  v3 = objc_alloc_init((Class)NSMutableArray);
  for (i = (double *)self->_horizontalTriggerAnchors.__begin_; i != self->_horizontalTriggerAnchors.__end_; i += 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *i));
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = objc_msgSend(v3, "copy");

  return v6;
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (NSSet)currentTriggers
{
  return self->_currentTriggers;
}

- (void)setCurrentTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_currentTriggers, a3);
}

- (void).cxx_destruct
{
  double *begin;
  void **p_begin;

  objc_storeStrong((id *)&self->_currentTriggers, 0);
  p_begin = &self->_logicalScrollAnchors.__begin_;
  sub_132A9C(&p_begin);
  p_begin = &self->_horizontalTriggerAnchors.__begin_;
  sub_132A9C(&p_begin);
  p_begin = &self->_verticalTriggerAnchors.__begin_;
  sub_132A9C(&p_begin);
  begin = self->_scrollAnchors.__begin_;
  if (begin)
  {
    self->_scrollAnchors.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
