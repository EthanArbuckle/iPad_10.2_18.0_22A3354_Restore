@implementation TVPChapter

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)chapterDescription
{
  return self->_chapterDescription;
}

- (void)setChapterDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TVPTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (TVPDateRange)dateRange
{
  return self->_dateRange;
}

- (void)setDateRange:(id)a3
{
  objc_storeStrong((id *)&self->_dateRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_chapterDescription, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_timeRange, 0);
}

@end
