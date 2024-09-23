@implementation CalendarMessageResourceChangeCell

- (id)titleStrings
{
  void *v2;
  void *v3;
  CalendarMessageResourceChangeCell *v4;
  void *v5;
  CalendarMessageResourceChangeCell *v6;
  char v7;
  void *v8;
  double v10;
  uint64_t v11;
  CalendarMessageResourceChangeCell *v12;

  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  if (objc_msgSend(v5, "changeType") == 1
    || objc_msgSend(v5, "changeType") == 3
    || objc_msgSend(v5, "changeType") == 2)
  {
    v6 = (CalendarMessageResourceChangeCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v7 = 1;
  }
  else
  {
    *(_QWORD *)&v10 = objc_opt_class(v4).n128_u64[0];
    v4 = (CalendarMessageResourceChangeCell *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v11, v10));
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageResourceChangeCell localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("“%@”"), &stru_1001B67C0, 0));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v6 = (CalendarMessageResourceChangeCell *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v2, v3));
    v7 = 0;
  }
  v12 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  if ((v7 & 1) == 0)
  {

    v6 = v4;
  }

  return v8;
}

- (id)bodyStringDict
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "descriptionStrings:", CUIKCalendarNoboDescriptionProfile));

  return v3;
}

- (int64_t)_changedPropertyCount
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  LODWORD(v3) = objc_msgSend(v2, "dateChanged");
  v4 = objc_msgSend(v2, "timeChanged");
  v5 = 1;
  if ((_DWORD)v3)
    v5 = 2;
  if (v4)
    v3 = v5;
  else
    v3 = v3;
  v6 = v3 + objc_msgSend(v2, "titleChanged");
  v7 = v6 + objc_msgSend(v2, "locationChanged");

  return v7;
}

- (id)actions
{
  return &off_1001BC880;
}

- (unint64_t)options
{
  return 4;
}

- (void)setNotification:(id)a3
{
  NSString *dateString;
  NSString *changeString;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CalendarMessageResourceChangeCell;
  -[CalendarMessageCell setNotification:](&v7, "setNotification:", a3);
  dateString = self->_dateString;
  self->_dateString = 0;

  changeString = self->_changeString;
  self->_changeString = 0;

  -[CalendarMessageCell setHasDisclosure:](self, "setHasDisclosure:", EKUICurrentWidthSizeClassIsCompactInViewHierarchy(self, v6));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeString, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
}

@end
