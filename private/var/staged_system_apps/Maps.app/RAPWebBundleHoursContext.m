@implementation RAPWebBundleHoursContext

- (NSDictionary)context
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[2];
  _QWORD v16[2];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = objc_claimAutoreleasedReturnValue(-[RAPWebBundleHoursContext from](self, "from"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleHoursContext to](self, "to"));

    if (v6)
    {
      v15[0] = CFSTR("from");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleHoursContext from](self, "from"));
      v15[1] = CFSTR("to");
      v16[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleHoursContext to](self, "to"));
      v16[1] = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("timeRange"));

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleHoursContext days](self, "days"));
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleHoursContext days](self, "days"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("days"));

  }
  v13 = objc_msgSend(v3, "copy");

  return (NSDictionary *)v13;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleHoursContext context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "debugDescription"));

  return v3;
}

- (NSNumber)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)days
{
  return self->_days;
}

- (void)setDays:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_days, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
}

@end
