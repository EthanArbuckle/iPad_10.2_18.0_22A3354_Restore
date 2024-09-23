@implementation APDBDeliveredReportRow

- (id)initType:(id)a3 dayOfYear:(id)a4 frequency:(id)a5 reportDate:(id)a6 table:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)APDBDeliveredReportRow;
  v16 = -[APDBDeliveredReportRow initAsNewObjectWithTable:](&v19, "initAsNewObjectWithTable:", a7);
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "setValue:forColumnName:", v12, CFSTR("type"));
    objc_msgSend(v17, "setValue:forColumnName:", v13, CFSTR("dayOfYear"));
    objc_msgSend(v17, "setValue:forColumnName:", v14, CFSTR("frequency"));
    objc_msgSend(v17, "setValue:forColumnName:", v15, CFSTR("reportDate"));
  }

  return v17;
}

@end
