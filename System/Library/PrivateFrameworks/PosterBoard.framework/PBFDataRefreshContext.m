@implementation PBFDataRefreshContext

+ (id)dynamicDescriptorsRefreshContextForNow:(id)a3 extension:(id)a4 lastRefreshDate:(id)a5 refreshStrategy:(int64_t)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  PBFDataRefreshContext *v15;
  PBFDataRefreshContext *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("refreshStrategy");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "numberWithInteger:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = CFSTR("extension");
  v19[0] = v13;
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [PBFDataRefreshContext alloc];
  v16 = -[PBFDataRefreshContext initWithComponent:now:lastRefreshDate:userInfo:](v15, "initWithComponent:now:lastRefreshDate:userInfo:", CFSTR("PBFDataComponentDynamicDescriptors"), v12, v10, v14);

  return v16;
}

+ (id)staticDescriptorsRefreshContextForNow:(id)a3 extension:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  PBFDataRefreshContext *v9;
  PBFDataRefreshContext *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = CFSTR("extension");
  v13[0] = a4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PBFDataRefreshContext alloc];

  v10 = -[PBFDataRefreshContext initWithComponent:now:lastRefreshDate:userInfo:](v9, "initWithComponent:now:lastRefreshDate:userInfo:", CFSTR("PBFDataComponentStaticDescriptors"), v7, 0, v8);
  return v10;
}

- (PBFDataRefreshContext)initWithComponent:(id)a3 now:(id)a4 lastRefreshDate:(id)a5 userInfo:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PBFDataRefreshContext *v15;
  PBFDataRefreshContext *v16;
  uint64_t v17;
  NSDate *now;
  uint64_t v19;
  NSDate *lastRefreshDate;
  uint64_t v21;
  void *v22;
  void *v23;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PBFDataRefreshContext;
  v15 = -[PBFDataRefreshContext init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_component, a3);
    v17 = objc_msgSend(v12, "copy");
    now = v16->_now;
    v16->_now = (NSDate *)v17;

    v19 = objc_msgSend(v13, "copy");
    lastRefreshDate = v16->_lastRefreshDate;
    v16->_lastRefreshDate = (NSDate *)v19;

    v21 = objc_msgSend(v14, "copy");
    v22 = (void *)v21;
    if (v21)
      v23 = (void *)v21;
    else
      v23 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v16->_userInfo, v23);

  }
  return v16;
}

- (NSString)component
{
  return self->_component;
}

- (NSDate)now
{
  return self->_now;
}

- (NSDate)lastRefreshDate
{
  return self->_lastRefreshDate;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_lastRefreshDate, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end
