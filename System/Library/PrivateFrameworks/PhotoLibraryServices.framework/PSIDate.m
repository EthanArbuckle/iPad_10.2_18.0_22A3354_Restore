@implementation PSIDate

- (PSIDate)initWithUniversalDate:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  char *v8;
  void *v9;
  __int16 v10;
  int8x16_t v11;
  __int16 v12;
  int8x16_t v13;
  char v14;
  int8x16_t v15;
  unsigned __int8 v16;
  int8x16_t v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PSIDate;
  v8 = -[PSIDate init](&v19, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "components:fromDate:", 30, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "era");
    v11 = (int8x16_t)vdupq_n_s64(0xFFF000000uLL);
    v11.i64[0] = (unint64_t)(v10 & 0xFFF) << 24;
    *(int8x16_t *)(v8 + 8) = vorrq_s8(v11, *(int8x16_t *)(v8 + 8));
    v12 = objc_msgSend(v9, "year");
    v13 = (int8x16_t)vdupq_n_s64(0xFFF000uLL);
    v13.i64[0] = (unint64_t)(v12 & 0xFFF) << 12;
    *(int8x16_t *)(v8 + 8) = vorrq_s8(v13, *(int8x16_t *)(v8 + 8));
    v14 = objc_msgSend(v9, "month");
    v15 = (int8x16_t)vdupq_n_s64(0xF00uLL);
    v15.i64[0] = (unint64_t)(v14 & 0xF) << 8;
    *(int8x16_t *)(v8 + 8) = vorrq_s8(v15, *(int8x16_t *)(v8 + 8));
    v16 = objc_msgSend(v9, "day");
    v17.i64[1] = 255;
    v17.i64[0] = v16;
    *(int8x16_t *)(v8 + 8) = vorrq_s8(*(int8x16_t *)(v8 + 8), v17);

  }
  return (PSIDate *)v8;
}

- (PSIDate)initWithDateComponents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  char *v17;
  uint64_t v18;
  int8x16_t v19;
  uint64_t v20;
  int8x16_t v21;
  uint64_t v22;
  int8x16_t v23;
  uint64_t v24;
  int8x16_t v25;
  PSIDate *v26;
  _BOOL4 v27;
  _BOOL4 v28;
  objc_super v30;

  v4 = a3;
  v5 = objc_msgSend(v4, "year");
  v6 = objc_msgSend(v4, "month");
  v7 = objc_msgSend(v4, "day");
  v8 = v7;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = objc_msgSend(v4, "yearForWeekOfYear");
    v10 = objc_msgSend(v4, "weekOfYear");
    v11 = objc_msgSend(v4, "weekday");
    v12 = v11;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL || v10 == 0x7FFFFFFFFFFFFFFFLL || v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v4, "weekdayOrdinal") == 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend(v4, "quarter") == 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend(v4, "weekOfMonth") == 0x7FFFFFFFFFFFFFFFLL
        && v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = v10 != 0x7FFFFFFFFFFFFFFFLL;
        v28 = v9 != 0x7FFFFFFFFFFFFFFFLL;

        if (v5 != 0x7FFFFFFFFFFFFFFFLL
          || v6 != 0x7FFFFFFFFFFFFFFFLL
          || v8 != 0x7FFFFFFFFFFFFFFFLL
          || ((v28 ^ v27) & 1) == 0)
        {
          goto LABEL_8;
        }
      }
      else
      {

      }
      v26 = 0;
      goto LABEL_38;
    }
  }

LABEL_8:
  v13 = v4;
  if (objc_msgSend(v13, "era") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v13, "year") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v13, "month") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v13, "day") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateFromComponents:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "components:fromDate:", 30, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = v13;
  }

  if (v16)
  {
    v30.receiver = self;
    v30.super_class = (Class)PSIDate;
    v17 = -[PSIDate init](&v30, sel_init);
    if (v17)
    {
      v18 = objc_msgSend(v16, "era");
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = (int8x16_t)vdupq_n_s64(0xFFF000000uLL);
        v19.i64[0] = (unint64_t)(v18 & 0xFFF) << 24;
        *(int8x16_t *)(v17 + 8) = vorrq_s8(*(int8x16_t *)(v17 + 8), v19);
      }
      v20 = objc_msgSend(v16, "year");
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v21 = (int8x16_t)vdupq_n_s64(0xFFF000uLL);
        v21.i64[0] = (unint64_t)(v20 & 0xFFF) << 12;
        *(int8x16_t *)(v17 + 8) = vorrq_s8(*(int8x16_t *)(v17 + 8), v21);
      }
      v22 = objc_msgSend(v16, "month");
      if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v23 = (int8x16_t)vdupq_n_s64(0xF00uLL);
        v23.i64[0] = (unint64_t)(v22 & 0xF) << 8;
        *(int8x16_t *)(v17 + 8) = vorrq_s8(*(int8x16_t *)(v17 + 8), v23);
      }
      v24 = objc_msgSend(v16, "day");
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v25.i64[1] = 255;
        v25.i64[0] = v24;
        *(int8x16_t *)(v17 + 8) = vorrq_s8(*(int8x16_t *)(v17 + 8), v25);
      }
    }
    self = v17;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

LABEL_38:
  return v26;
}

- (unint64_t)hash
{
  return self->_int64Representation;
}

- (BOOL)isEqual:(id)a3
{
  PSIDate *v4;
  BOOL v5;

  v4 = (PSIDate *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && v4->_int64Representation == self->_int64Representation
      && v4->_int64RepresentationMask == self->_int64RepresentationMask;
  }

  return v5;
}

- (PSIDate)initWithInt64Representation:(int64_t)a3
{
  PSIDate *result;
  unint64_t v5;
  int8x16_t v6;
  unint64_t v7;
  int8x16_t v8;
  unint64_t v9;
  int8x16_t v10;
  int8x16_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PSIDate;
  result = -[PSIDate init](&v12, sel_init);
  if (result)
  {
    v5 = ((unint64_t)a3 >> 24) & 0xFFF;
    if (v5 - 1 <= 0xFFD)
    {
      v6 = (int8x16_t)vdupq_n_s64(0xFFF000000uLL);
      v6.i64[0] = v5 << 24;
      *(int8x16_t *)&result->_int64Representation = vorrq_s8(*(int8x16_t *)&result->_int64Representation, v6);
    }
    v7 = ((unint64_t)a3 >> 12) & 0xFFF;
    if (v7 - 1 <= 0xFFD)
    {
      v8 = (int8x16_t)vdupq_n_s64(0xFFF000uLL);
      v8.i64[0] = v7 << 12;
      *(int8x16_t *)&result->_int64Representation = vorrq_s8(*(int8x16_t *)&result->_int64Representation, v8);
    }
    v9 = ((unint64_t)a3 >> 8) & 0xF;
    if (v9 - 1 <= 0xD)
    {
      v10 = (int8x16_t)vdupq_n_s64(0xF00uLL);
      v10.i64[0] = v9 << 8;
      *(int8x16_t *)&result->_int64Representation = vorrq_s8(*(int8x16_t *)&result->_int64Representation, v10);
    }
    if ((unint64_t)a3 - 1 <= 0xFD)
    {
      v11.i64[1] = 255;
      v11.i64[0] = a3;
      *(int8x16_t *)&result->_int64Representation = vorrq_s8(*(int8x16_t *)&result->_int64Representation, v11);
    }
  }
  return result;
}

- (int64_t)era
{
  if ((self->_int64RepresentationMask & 0xFFF000000) != 0)
    return ((unint64_t)self->_int64Representation >> 24) & 0xFFF;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)year
{
  if ((self->_int64RepresentationMask & 0xFFF000) != 0)
    return ((unint64_t)self->_int64Representation >> 12) & 0xFFF;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)month
{
  if ((self->_int64RepresentationMask & 0xF00) != 0)
    return ((unint64_t)self->_int64Representation >> 8) & 0xF;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)day
{
  if (LOBYTE(self->_int64RepresentationMask))
    return LOBYTE(self->_int64Representation);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d/%d/%d Era: %d"), -[PSIDate day](self, "day"), -[PSIDate month](self, "month"), -[PSIDate year](self, "year"), -[PSIDate era](self, "era"));
}

- (id)dateComponents
{
  id v3;
  void *v4;
  unint64_t int64Representation;
  int64_t int64RepresentationMask;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v4 = v3;
  int64Representation = self->_int64Representation;
  int64RepresentationMask = self->_int64RepresentationMask;
  if ((int64RepresentationMask & 0xFFF000000) != 0)
    v7 = (int64Representation >> 24) & 0xFFF;
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7)
  {
    objc_msgSend(v3, "setEra:");
    int64Representation = self->_int64Representation;
    int64RepresentationMask = self->_int64RepresentationMask;
  }
  if ((int64RepresentationMask & 0xFFF000) != 0)
    v8 = (int64Representation >> 12) & 0xFFF;
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    objc_msgSend(v4, "setYear:");
    int64Representation = self->_int64Representation;
    int64RepresentationMask = self->_int64RepresentationMask;
  }
  if ((int64RepresentationMask & 0xF00) != 0)
    v9 = (int64Representation >> 8) & 0xF;
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9)
  {
    objc_msgSend(v4, "setMonth:");
    LOBYTE(int64Representation) = self->_int64Representation;
    LOBYTE(int64RepresentationMask) = self->_int64RepresentationMask;
  }
  if ((_BYTE)int64RepresentationMask)
    v10 = int64Representation;
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10)
    objc_msgSend(v4, "setDay:");
  return v4;
}

- (int64_t)int64Representation
{
  return self->_int64Representation;
}

- (int64_t)int64RepresentationMask
{
  return self->_int64RepresentationMask;
}

+ (id)distantPast
{
  PSIDate *v2;

  v2 = objc_alloc_init(PSIDate);
  *(_OWORD *)&v2->_int64Representation = xmmword_199B9FDE0;
  return v2;
}

+ (id)distantFuture
{
  PSIDate *v2;

  v2 = objc_alloc_init(PSIDate);
  *(_OWORD *)&v2->_int64Representation = xmmword_199B9FDF0;
  return v2;
}

@end
