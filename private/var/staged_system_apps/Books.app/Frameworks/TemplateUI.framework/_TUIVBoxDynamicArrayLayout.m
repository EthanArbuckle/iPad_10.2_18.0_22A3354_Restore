@implementation _TUIVBoxDynamicArrayLayout

- (_TUIVBoxDynamicArrayLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char *i;
  _TUIVBoxDynamicSpacerLayout *v15;
  void *v16;
  _TUIVBoxDynamicSpacerLayout *v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v22[2];
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_TUIVBoxDynamicArrayLayout;
  v11 = -[TUILayoutContainer initWithModel:parent:controller:](&v23, "initWithModel:parent:controller:", v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "estimatedWidth");
    objc_msgSend(v8, "estimatedHeight", v12);
    v22[1] = v13;
    for (i = (char *)objc_msgSend(v8, "windowCount"); i; --i)
      sub_55920((uint64_t)v11 + 48, *((char **)v11 + 7), (char *)v22);
    v15 = -[TUILayout initWithModel:parent:controller:]([_TUIVBoxDynamicSpacerLayout alloc], "initWithModel:parent:controller:", 0, v11, v10);
    v16 = (void *)*((_QWORD *)v11 + 11);
    *((_QWORD *)v11 + 11) = v15;

    v17 = -[TUILayout initWithModel:parent:controller:]([_TUIVBoxDynamicSpacerLayout alloc], "initWithModel:parent:controller:", 0, v11, v10);
    v18 = (void *)*((_QWORD *)v11 + 12);
    *((_QWORD *)v11 + 12) = v17;

    v19 = objc_msgSend(v8, "windowRange");
    objc_msgSend(v11, "layoutUpdateWindowRange:", v19, v20);
  }

  return (_TUIVBoxDynamicArrayLayout *)v11;
}

- (void)enumerateChildren:(id)a3
{
  void (**v4)(id, _TUIVBoxDynamicSpacerLayout *);
  objc_super v5;

  v4 = (void (**)(id, _TUIVBoxDynamicSpacerLayout *))a3;
  v4[2](v4, self->_preRangeSpacer);
  v5.receiver = self;
  v5.super_class = (Class)_TUIVBoxDynamicArrayLayout;
  -[TUILayoutContainer enumerateChildren:](&v5, "enumerateChildren:", v4);
  v4[2](v4, self->_postRangeSpacer);

}

- (void)_updateIndex:(unint64_t)a3 width:(double)a4 height:(double)a5
{
  _TUIVBoxItemLayoutSummary *v5;

  v5 = &self->_summaries.__begin_[a3];
  v5->width = a4;
  v5->height = a5;
}

- (void)layoutUpdateWindowRange:(_NSRange)a3
{
  _NSRange *p_windowRange;

  p_windowRange = &self->_windowRange;
  self->_windowRange = a3;
  -[_TUIVBoxDynamicSpacerLayout setRange:](self->_preRangeSpacer, "setRange:", 0, a3.location);
  -[_TUIVBoxDynamicSpacerLayout setRange:](self->_postRangeSpacer, "setRange:", p_windowRange->length + p_windowRange->location, self->_summaries.__end_ - self->_summaries.__begin_ - (p_windowRange->length + p_windowRange->location));
}

- (void)layoutDeleteAtIndex:(unint64_t)a3
{
  vector<_TUIVBoxItemLayoutSummary, std::allocator<_TUIVBoxItemLayoutSummary>> *p_summaries;
  _TUIVBoxItemLayoutSummary *begin;
  _TUIVBoxItemLayoutSummary *end;
  _TUIVBoxItemLayoutSummary *v6;
  char *v7;

  p_summaries = &self->_summaries;
  begin = self->_summaries.__begin_;
  end = self->_summaries.__end_;
  v6 = &begin[a3];
  v7 = (char *)((char *)end - (char *)&v6[1]);
  if (end != &v6[1])
    memmove(&begin[a3], &v6[1], (char *)end - (char *)&v6[1]);
  p_summaries->__end_ = (_TUIVBoxItemLayoutSummary *)&v7[(_QWORD)v6];
}

- (void)layoutInsertAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutContainer model](self, "model"));
  objc_msgSend(v5, "estimatedWidth");
  v9[0] = v6;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutContainer model](self, "model", v9[0]));
  objc_msgSend(v7, "estimatedHeight");
  v9[1] = v8;

  sub_55920((uint64_t)&self->_summaries, (char *)&self->_summaries.__begin_[a3], (char *)v9);
}

- (void)layoutMoveFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  vector<_TUIVBoxItemLayoutSummary, std::allocator<_TUIVBoxItemLayoutSummary>> *p_summaries;
  _TUIVBoxItemLayoutSummary *begin;
  _TUIVBoxItemLayoutSummary *end;
  _OWORD *p_width;
  int64_t v9;
  __int128 v10;

  p_summaries = &self->_summaries;
  begin = self->_summaries.__begin_;
  end = self->_summaries.__end_;
  p_width = (_OWORD *)&begin[a3].width;
  v10 = *p_width;
  v9 = (char *)end - (char *)(p_width + 1);
  if (end != (_TUIVBoxItemLayoutSummary *)(p_width + 1))
  {
    memmove(&begin[a3], p_width + 1, (char *)end - (char *)(p_width + 1));
    begin = p_summaries->__begin_;
  }
  p_summaries->__end_ = (_TUIVBoxItemLayoutSummary *)((char *)p_width + v9);
  sub_55920((uint64_t)p_summaries, (char *)&begin[a4], (char *)&v10);
}

- (void)updateSummariesFromChildren
{
  _TUIVBoxItemLayoutSummary *begin;
  NSUInteger location;
  void *v4;
  id v5;
  _QWORD *p_width;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  begin = self->_summaries.__begin_;
  location = self->_windowRange.location;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutContainer containers](self, "containers"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    p_width = (_QWORD *)&begin[location].width;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v8);
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
        v10[2] = sub_55FD4;
        v10[3] = &unk_23EFE0;
        v10[4] = &v15;
        v10[5] = &v11;
        objc_msgSend(v9, "enumerateChildren:", v10);
        *p_width = v16[3];
        p_width[1] = v12[3];
        p_width += 2;
        _Block_object_dispose(&v11, 8);
        _Block_object_dispose(&v15, 8);
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

}

- (_TUIVBoxItemLayoutSummary)summaryForRange:(_NSRange)a3
{
  double *p_height;
  NSUInteger v4;
  double v5;
  double v6;
  _TUIVBoxItemLayoutSummary result;

  if (a3.length)
  {
    p_height = &self->_summaries.__begin_[a3.location].height;
    v4 = 16 * a3.length;
    v5 = 0.0;
    v6 = 0.0;
    do
    {
      v6 = v6 + *p_height;
      v5 = fmax(v5, *(p_height - 1));
      p_height += 2;
      v4 -= 16;
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
    v5 = 0.0;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  _TUIVBoxItemLayoutSummary *begin;

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
