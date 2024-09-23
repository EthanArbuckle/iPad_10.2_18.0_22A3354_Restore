@implementation ActivitySharingFriendDetailPaletteDateProvider

- (NSDate)currentSelectedDate
{
  return (NSDate *)*(id *)self->currentSelectedDate;
}

- (void)setCurrentSelectedDate:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)self->currentSelectedDate;
  *(_QWORD *)self->currentSelectedDate = a3;
  v3 = a3;

}

- (void)setWithCurrentSelectedDate:(id)a3 caller:(id)a4
{
  id v4;
  id v5;

  v5 = *(id *)self->currentSelectedDate;
  *(_QWORD *)self->currentSelectedDate = a3;
  v4 = a3;

}

@end
