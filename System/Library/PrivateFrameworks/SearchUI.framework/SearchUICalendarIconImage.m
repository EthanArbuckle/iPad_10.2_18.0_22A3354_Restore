@implementation SearchUICalendarIconImage

- (SearchUICalendarIconImage)initWithCurrentDateAndVariant:(unint64_t)a3
{
  -[SearchUICalendarIconImage setIsCurrentDate:](self, "setIsCurrentDate:", 1);
  return -[SearchUICalendarIconImage initWithDate:variant:](self, "initWithDate:variant:", 0, a3);
}

- (SearchUICalendarIconImage)initWithDate:(id)a3 variant:(unint64_t)a4
{
  id v6;
  SearchUICalendarIconImage *v7;
  SearchUICalendarIconImage *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUICalendarIconImage;
  v7 = -[SearchUIAppIconImage initWithBundleIdentifier:variant:contentType:](&v10, sel_initWithBundleIdentifier_variant_contentType_, 0, a4, 0);
  v8 = v7;
  if (v7)
    -[SearchUICalendarIconImage setDate:](v7, "setDate:", v6);

  return v8;
}

- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (-[SearchUICalendarIconImage isCurrentDate](self, "isCurrentDate", a4))
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
  else
    -[SearchUICalendarIconImage date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D3A820]);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIAppIconImage bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithDate:calendar:format:", v6, v8, v9 == 0);

  -[SearchUIAppIconImage descriptorWithScale:](self, "descriptorWithScale:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "imageForIcon:descriptor:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  int v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SearchUICalendarIconImage;
  if (-[SearchUIAppIconImage isEqual:](&v11, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICalendarIconImage date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isDate:inSameDayAsDate:", v6, v7))
    {
      v8 = -[SearchUICalendarIconImage isCurrentDate](self, "isCurrentDate");
      v9 = v8 ^ objc_msgSend(v4, "isCurrentDate") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICalendarIconImage date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 30, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = -[SearchUICalendarIconImage isCurrentDate](self, "isCurrentDate");
  v10.receiver = self;
  v10.super_class = (Class)SearchUICalendarIconImage;
  v8 = v6 ^ v7 ^ -[SearchUIAppIconImage hash](&v10, sel_hash);

  return v8;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (BOOL)isCurrentDate
{
  return self->_isCurrentDate;
}

- (void)setIsCurrentDate:(BOOL)a3
{
  self->_isCurrentDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
