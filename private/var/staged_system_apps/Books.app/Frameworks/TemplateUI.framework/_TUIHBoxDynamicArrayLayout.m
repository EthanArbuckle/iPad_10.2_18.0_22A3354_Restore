@implementation _TUIHBoxDynamicArrayLayout

- (_TUIHBoxDynamicArrayLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *i;
  _TUIHBoxDynamicSpacerLayout *v16;
  void *v17;
  _TUIHBoxDynamicSpacerLayout *v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v23[3];
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)_TUIHBoxDynamicArrayLayout;
  v11 = -[TUILayoutContainer initWithModel:parent:controller:](&v24, "initWithModel:parent:controller:", v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "estimatedWidth");
    v23[0] = v12;
    objc_msgSend(v8, "estimatedHeight");
    v23[1] = v13;
    objc_msgSend(v8, "estimatedHeightAbovePivot");
    v23[2] = v14;
    for (i = (char *)objc_msgSend(v8, "windowCount"); i; --i)
      sub_15BEEC((uint64_t)v11 + 48, *((char **)v11 + 7), (unint64_t)v23);
    v16 = -[TUILayout initWithModel:parent:controller:]([_TUIHBoxDynamicSpacerLayout alloc], "initWithModel:parent:controller:", 0, v11, v10);
    v17 = (void *)*((_QWORD *)v11 + 11);
    *((_QWORD *)v11 + 11) = v16;

    v18 = -[TUILayout initWithModel:parent:controller:]([_TUIHBoxDynamicSpacerLayout alloc], "initWithModel:parent:controller:", 0, v11, v10);
    v19 = (void *)*((_QWORD *)v11 + 12);
    *((_QWORD *)v11 + 12) = v18;

    v20 = objc_msgSend(v8, "windowRange");
    objc_msgSend(v11, "layoutUpdateWindowRange:", v20, v21);
  }

  return (_TUIHBoxDynamicArrayLayout *)v11;
}

- (void)enumerateChildren:(id)a3
{
  void (**v4)(id, _TUIHBoxDynamicSpacerLayout *);
  objc_super v5;

  v4 = (void (**)(id, _TUIHBoxDynamicSpacerLayout *))a3;
  v4[2](v4, self->_preRangeSpacer);
  v5.receiver = self;
  v5.super_class = (Class)_TUIHBoxDynamicArrayLayout;
  -[TUILayoutContainer enumerateChildren:](&v5, "enumerateChildren:", v4);
  v4[2](v4, self->_postRangeSpacer);

}

- (void)_updateIndex:(unint64_t)a3 width:(double)a4 height:(double)a5 heightAbovePivot:(double)a6
{
  _TUIHBoxItemLayoutSummary *v6;

  v6 = &self->_summaries.__begin_[a3];
  v6->width = a4;
  v6->height = a5;
  v6->heightAbovePivot = a6;
}

- (void)layoutUpdateWindowRange:(_NSRange)a3
{
  self->_windowRange = a3;
  -[_TUIHBoxDynamicSpacerLayout setRange:](self->_preRangeSpacer, "setRange:", 0, a3.location);
  -[_TUIHBoxDynamicSpacerLayout setRange:](self->_postRangeSpacer, "setRange:");
}

- (void)layoutDeleteAtIndex:(unint64_t)a3
{
  vector<_TUIHBoxItemLayoutSummary, std::allocator<_TUIHBoxItemLayoutSummary>> *p_summaries;
  _TUIHBoxItemLayoutSummary *end;
  _TUIHBoxItemLayoutSummary *v5;
  int64_t v6;

  p_summaries = &self->_summaries;
  end = self->_summaries.__end_;
  v5 = &self->_summaries.__begin_[a3];
  v6 = (char *)end - (char *)&v5[1];
  if (end != &v5[1])
    memmove(&self->_summaries.__begin_[a3], &v5[1], (char *)end - (char *)&v5[1]);
  p_summaries->__end_ = (_TUIHBoxItemLayoutSummary *)((char *)v5 + v6);
}

- (void)layoutInsertAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[3];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutContainer model](self, "model"));
  objc_msgSend(v5, "estimatedWidth");
  v11[0] = v6;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutContainer model](self, "model"));
  objc_msgSend(v7, "estimatedHeight");
  v11[1] = v8;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutContainer model](self, "model"));
  objc_msgSend(v9, "estimatedHeightAbovePivot");
  v11[2] = v10;

  sub_15BEEC((uint64_t)&self->_summaries, (char *)&self->_summaries.__begin_[a3], (unint64_t)v11);
}

- (void)layoutMoveFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  vector<_TUIHBoxItemLayoutSummary, std::allocator<_TUIHBoxItemLayoutSummary>> *p_summaries;
  _TUIHBoxItemLayoutSummary *begin;
  _TUIHBoxItemLayoutSummary *end;
  _TUIHBoxItemLayoutSummary *v8;
  __int128 v9;
  char *v10;
  __int128 v11;
  double heightAbovePivot;

  p_summaries = &self->_summaries;
  begin = self->_summaries.__begin_;
  end = self->_summaries.__end_;
  v8 = &begin[a3];
  v9 = *(_OWORD *)&v8->width;
  heightAbovePivot = v8->heightAbovePivot;
  v11 = v9;
  v10 = (char *)((char *)end - (char *)&v8[1]);
  if (end != &v8[1])
  {
    memmove(&begin[a3], &v8[1], (char *)end - (char *)&v8[1]);
    begin = p_summaries->__begin_;
  }
  p_summaries->__end_ = (_TUIHBoxItemLayoutSummary *)&v10[(_QWORD)v8];
  sub_15BEEC((uint64_t)p_summaries, (char *)&begin[a4], (unint64_t)&v11);
}

- (void)updateSummariesFromChildren
{
  _TUIHBoxItemLayoutSummary *begin;
  NSUInteger location;
  id v4;
  _QWORD *p_width;
  uint64_t v6;
  void *v7;
  void *v8;
  id obj;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  begin = self->_summaries.__begin_;
  location = self->_windowRange.location;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TUILayoutContainer containers](self, "containers"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    p_width = (_QWORD *)&begin[location].width;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v7);
        v19 = 0;
        v20 = &v19;
        v21 = 0x2020000000;
        v22 = 0;
        v15 = 0;
        v16 = &v15;
        v17 = 0x2020000000;
        v18 = 0;
        v11 = 0;
        v12 = &v11;
        v13 = 0x2020000000;
        v14 = 0;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_15C6B0;
        v10[3] = &unk_242FC8;
        v10[4] = &v19;
        v10[5] = &v15;
        v10[6] = &v11;
        objc_msgSend(v8, "enumerateChildren:", v10);
        *p_width = v20[3];
        p_width[1] = v16[3];
        p_width[2] = v12[3];
        p_width += 3;
        _Block_object_dispose(&v11, 8);
        _Block_object_dispose(&v15, 8);
        _Block_object_dispose(&v19, 8);
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v4);
  }

}

- (_TUIHBoxItemLayoutSummary)summaryForRange:(_NSRange)a3
{
  _TUIHBoxItemLayoutSummary *v3;
  _TUIHBoxItemLayoutSummary *v4;
  double v5;
  double v6;
  double v7;
  _TUIHBoxItemLayoutSummary result;

  if (a3.length)
  {
    v3 = &self->_summaries.__begin_[a3.location];
    v4 = &v3[a3.length];
    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
    do
    {
      v5 = v5 + v3->width;
      v6 = fmax(v6, v3->height);
      v7 = fmax(v7, v3->heightAbovePivot);
      ++v3;
    }
    while (v3 != v4);
  }
  else
  {
    v7 = 0.0;
    v6 = 0.0;
    v5 = 0.0;
  }
  result.heightAbovePivot = v7;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  _TUIHBoxItemLayoutSummary *begin;

  objc_storeStrong((id *)&self->_postRangeSpacer, 0);
  objc_storeStrong((id *)&self->_preRangeSpacer, 0);
  begin = self->_summaries.__begin_;
  if (begin)
  {
    self->_summaries.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
