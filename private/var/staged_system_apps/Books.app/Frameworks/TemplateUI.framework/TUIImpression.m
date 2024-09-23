@implementation TUIImpression

- (TUIImpression)initWithData:(id)a3 size:(CGSize)a4 identifier:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  TUIImpression *v12;
  TUIImpression *v13;
  TUIIdentifier *v14;
  TUIIdentifier *identifier;
  objc_super v17;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUIImpression;
  v12 = -[TUIImpression init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_data, a3);
    v14 = (TUIIdentifier *)objc_msgSend(v11, "copyWithZone:", 0);
    identifier = v13->_identifier;
    v13->_identifier = v14;

    v13->_visible = 0;
    v13->_size.width = width;
    v13->_size.height = height;
  }

  return v13;
}

- (TUIImpression)initWithImpression:(id)a3
{
  char *v4;
  TUIImpression *v5;
  char *v6;
  TUIImpression *v7;
  TUIIdentifier *v8;
  TUIIdentifier *identifier;
  objc_super v11;

  v4 = (char *)a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIImpression;
  v5 = -[TUIImpression init](&v11, "init");
  v6 = (char *)v5;
  v7 = v5;
  if (v4 && v5)
  {
    objc_storeStrong(&v5->_data, *((id *)v4 + 5));
    if (v6 != v4)
      sub_12828C(v6 + 8, *((char **)v4 + 1), *((_QWORD *)v4 + 2), (uint64_t)(*((_QWORD *)v4 + 2) - *((_QWORD *)v4 + 1)) >> 4);
    v7->_visible = v4[32];
    v8 = (TUIIdentifier *)objc_msgSend(*((id *)v4 + 6), "copyWithZone:", 0);
    identifier = v7->_identifier;
    v7->_identifier = v8;

    v7->_size = *(CGSize *)(v4 + 56);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc((Class)objc_opt_class(self, a2));
  return _objc_msgSend(v4, "initWithImpression:", self);
}

- (unint64_t)timingCount
{
  return (self->_timings.__end_ - self->_timings.__begin_) >> 4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timingAtIndex:(unint64_t)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  double v4;
  double v5;
  double *v6;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  begin = self->_timings.__begin_;
  v4 = 0.0;
  v5 = 0.0;
  if (a3 < (self->_timings.__end_ - begin) >> 4)
  {
    v6 = (double *)((char *)begin + 16 * a3);
    v5 = *v6;
    v4 = v6[1];
  }
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (void)becameVisibleAtTime:(double)a3
{
  __compressed_pair<TUIImpressionTiming *, std::allocator<TUIImpressionTiming>> *p_end_cap;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v7;
  vector<TUIImpressionTiming, std::allocator<TUIImpressionTiming>> *p_timings;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v17;
  double v18;

  if (!self->_visible)
  {
    p_end_cap = &self->_timings.__end_cap_;
    value = self->_timings.__end_cap_.__value_;
    self->_visible = 1;
    end = self->_timings.__end_;
    if (end >= value)
    {
      p_timings = &self->_timings;
      begin = self->_timings.__begin_;
      v10 = (end - begin) >> 4;
      v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 60)
        sub_6F9C();
      v12 = value - begin;
      if (v12 >> 3 > v11)
        v11 = v12 >> 3;
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
        v13 = 0xFFFFFFFFFFFFFFFLL;
      else
        v13 = v11;
      if (v13)
      {
        v18 = a3;
        v14 = (char *)sub_22FD4((uint64_t)p_end_cap, v13);
        a3 = v18;
        v15 = v14;
        begin = self->_timings.__begin_;
        end = self->_timings.__end_;
      }
      else
      {
        v15 = 0;
      }
      v16 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v15[16 * v10];
      v17 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v15[16 * v13];
      *(int64x2_t *)v16 = vdupq_lane_s64(*(uint64_t *)&a3, 0);
      v7 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v16 + 16);
      if (end != begin)
      {
        do
        {
          *((_OWORD *)v16 - 1) = *((_OWORD *)end - 1);
          v16 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v16 - 16);
          end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 16);
        }
        while (end != begin);
        begin = p_timings->__begin_;
      }
      self->_timings.__begin_ = v16;
      self->_timings.__end_ = v7;
      self->_timings.__end_cap_.__value_ = v17;
      if (begin)
        operator delete(begin);
    }
    else
    {
      *(double *)end = a3;
      *((double *)end + 1) = a3;
      v7 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 16);
    }
    self->_timings.__end_ = v7;
  }
}

- (void)becameHiddenAtTime:(double)a3
{
  -[TUIImpression becameHiddenAtTime:threshold:](self, "becameHiddenAtTime:threshold:", a3, 0.0);
}

- (void)becameHiddenAtTime:(double)a3 threshold:(double)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;

  if (self->_visible)
  {
    self->_visible = 0;
    end = self->_timings.__end_;
    if (self->_timings.__begin_ != end)
    {
      if (a3 - *((double *)end - 2) >= a4)
        *((double *)end - 1) = a3;
      else
        self->_timings.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 16);
    }
  }
}

- (unint64_t)timingCountWithTime:(double)a3 threshold:(double)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t result;
  BOOL v8;

  begin = self->_timings.__begin_;
  end = self->_timings.__end_;
  result = (end - begin) >> 4;
  v8 = !self->_visible || end == begin;
  if (!v8 && a3 - *((double *)end - 2) < a4)
    --result;
  return result;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  CGSize v12;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImpression data](self, "data"));
  v7 = -[TUIImpression timingCount](self, "timingCount");
  -[TUIImpression size](self, "size");
  v8 = NSStringFromCGSize(v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> [Data: %@] [Timing Count: %lu] [Size: %@]"), v5, self, v6, v7, v9));

  return v10;
}

- (id)data
{
  return self->_data;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_data, 0);
  begin = self->_timings.__begin_;
  if (begin)
  {
    self->_timings.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
