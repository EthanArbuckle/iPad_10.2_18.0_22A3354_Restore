@implementation PKDashboardPayLaterInstallmentsMonthItem

- (PKDashboardPayLaterInstallmentsMonthItem)initWithDataSource:(id)a3 appearance:(id)a4 installmentsMonth:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDashboardPayLaterInstallmentsMonthItem *v11;
  PKDashboardPayLaterInstallmentsMonthItem *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKDashboardPayLaterInstallmentsMonthItem;
  v11 = -[PKDashboardPayLaterInstallmentsMonthItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeWeak((id *)&v12->_appearance, v9);
    objc_storeStrong((id *)&v12->_installmentsMonth, a5);
  }

  return v12;
}

+ (id)identifier
{
  return CFSTR("payLaterInstallmentsMonthItem");
}

- (PKPayLaterInstallmentsMonth)installmentsMonth
{
  return self->_installmentsMonth;
}

- (PKCalendarMonthDataSource)dataSource
{
  return (PKCalendarMonthDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (PKCalendarMonthAppearance)appearance
{
  return (PKCalendarMonthAppearance *)objc_loadWeakRetained((id *)&self->_appearance);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appearance);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_installmentsMonth, 0);
}

@end
