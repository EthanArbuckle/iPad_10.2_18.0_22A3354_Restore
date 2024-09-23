@implementation MSDStoreHourRecord

- (NSDate)openDate
{
  return self->_openDate;
}

- (void)setOpenDate:(id)a3
{
  objc_storeStrong((id *)&self->_openDate, a3);
}

- (NSDate)closedDate
{
  return self->_closedDate;
}

- (void)setClosedDate:(id)a3
{
  objc_storeStrong((id *)&self->_closedDate, a3);
}

- (NSDate)revertDate
{
  return self->_revertDate;
}

- (void)setRevertDate:(id)a3
{
  objc_storeStrong((id *)&self->_revertDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revertDate, 0);
  objc_storeStrong((id *)&self->_closedDate, 0);
  objc_storeStrong((id *)&self->_openDate, 0);
}

@end
