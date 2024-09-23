@implementation ANCCallAlert

- (ANCCallAlert)initWithCall:(id)a3 callCenter:(id)a4 categoryID:(unsigned __int8)a5
{
  uint64_t v5;
  id v9;
  id v10;
  id v11;
  ANCCallAlert *v12;
  uint64_t v13;
  TUCallCenter *callCenter;
  objc_super v16;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ANCCallAlert;
  v11 = -[ANCAlert initWithCategoryID:](&v16, "initWithCategoryID:", v5);
  v12 = (ANCCallAlert *)v11;
  if (v11)
  {
    objc_storeStrong((id *)v11 + 2, a3);
    objc_storeStrong((id *)&v12->_call, a4);
    v13 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    callCenter = v12->_callCenter;
    v12->_callCenter = (TUCallCenter *)v13;

    *(&v12->super._silent + 1) = v5;
  }

  return v12;
}

- (BOOL)isPhoneNumber:(__CFString *)a3
{
  return CFStringFind(a3, CFSTR("@"), 0).location == -1;
}

- (BOOL)isImportant
{
  return 1;
}

- (id)appIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ANCCallAlert call](self, "call"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlert _appIdentifierForTUCallProvider:](self, "_appIdentifierForTUCallProvider:", v4));

  return v5;
}

- (id)title
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ANCCallAlert call](self, "call"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayName"));

  if ((unint64_t)objc_msgSend(v3, "length") >= 3
    && objc_msgSend(v3, "characterAtIndex:", 0) == 8234
    && objc_msgSend(v3, "characterAtIndex:", (char *)objc_msgSend(v3, "length") - 1) == 8236)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", 1, (char *)objc_msgSend(v3, "length") - 2));

    v3 = (void *)v4;
  }
  return v3;
}

- (id)subtitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ANCCallAlert call](self, "call"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedLabel"));

  return v3;
}

- (id)message
{
  return 0;
}

- (id)date
{
  return -[ANCCallAlert callDate](self, "callDate");
}

- (BOOL)hasPositiveAction
{
  return 0;
}

- (BOOL)hasNegativeAction
{
  return 0;
}

- (id)positiveActionLabel
{
  return 0;
}

- (id)negativeActionLabel
{
  return 0;
}

- (BOOL)performPositiveAction
{
  return 0;
}

- (BOOL)performNegativeAction
{
  return 0;
}

- (TUCall)call
{
  return *(TUCall **)&self->_categoryId;
}

- (void)setCall:(id)a3
{
  objc_storeStrong((id *)&self->_categoryId, a3);
}

- (TUCallCenter)callCenter
{
  return self->_call;
}

- (void)setCallCenter:(id)a3
{
  objc_storeStrong((id *)&self->_call, a3);
}

- (NSDate)callDate
{
  return (NSDate *)self->_callCenter;
}

- (void)setCallDate:(id)a3
{
  objc_storeStrong((id *)&self->_callCenter, a3);
}

- (unsigned)categoryId
{
  return *(&self->super._silent + 1);
}

- (void)setCategoryId:(unsigned __int8)a3
{
  *(&self->super._silent + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_categoryId, 0);
}

@end
