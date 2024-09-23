@implementation GeoRequestDetailTableViewController

- (GeoRequestDetailTableViewController)initWithGEORequestCounterInfo:(id)a3
{
  id v5;
  GeoRequestDetailTableViewController *v6;
  GeoRequestDetailTableViewController *v7;
  uint64_t v8;
  NSArray *requestTypes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GeoRequestDetailTableViewController;
  v6 = -[GeoRequestDetailTableViewController initWithStyle:](&v11, "initWithStyle:", 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_counterInfo, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requestTypes"));
    requestTypes = v7->_requestTypes;
    v7->_requestTypes = (NSArray *)v8;

  }
  return v7;
}

- (BOOL)isValidSection:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0 && -[NSArray count](self->_requestTypes, "count") > a3;
}

- ($83B2718136BFED87A54969ED66A08F04)typeForSection:(int64_t)a3
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  BOOL v8;
  unsigned int v9;
  unint64_t v10;
  $83B2718136BFED87A54969ED66A08F04 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_requestTypes, "objectAtIndexedSubscript:", a3));
  v4 = objc_msgSend(v3, "intValue");
  v5 = (v4 >> 8) & 0x7F;
  if (v5 > 0xB)
  {
    v9 = 0;
    v10 = 0;
  }
  else
  {
    v6 = 1 << v5;
    if ((v6 & 0xC05) != 0)
      v7 = v4;
    else
      v7 = 0;
    v8 = (v6 & 0xAA) == 0;
    if ((v6 & 0xAA) != 0)
      v9 = v4 & 0x7F00;
    else
      v9 = v7;
    if (v8)
      v10 = 0;
    else
      v10 = (unint64_t)v4 << 32;
  }
  v11 = ($83B2718136BFED87A54969ED66A08F04)(v10 | v9);

  return v11;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_requestTypes, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  if (!-[GeoRequestDetailTableViewController isValidSection:](self, "isValidSection:", a4))
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestDetailTableViewController counterInfo](self, "counterInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nonZeroResultTypesForType:", -[GeoRequestDetailTableViewController typeForSection:](self, "typeForSection:", a4)));
  v8 = objc_msgSend(v7, "count");

  return (int64_t)v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  $83B2718136BFED87A54969ED66A08F04 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (-[GeoRequestDetailTableViewController isValidSection:](self, "isValidSection:", a4))
  {
    v6 = -[GeoRequestDetailTableViewController typeForSection:](self, "typeForSection:", a4);
    v7 = ((uint64_t (*)(_QWORD))GEODataRequestKindAsString)(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestDetailTableViewController counterInfo](self, "counterInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", objc_msgSend(v9, "xmitBytesForType:", v6), 3));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestDetailTableViewController counterInfo](self, "counterInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", objc_msgSend(v11, "recvBytesForType:", v6), 3));

  }
  else
  {
    v8 = 0;
    v10 = 0;
    v12 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nxmit:%@ / recv:%@"), v8, v10, v12));

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  $83B2718136BFED87A54969ED66A08F04 v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("reuseIdentifier")));
  if (!v7)
    v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1, CFSTR("reuseIdentifier"));
  objc_msgSend(v7, "setSelectionStyle:", 0);
  if (-[GeoRequestDetailTableViewController isValidSection:](self, "isValidSection:", objc_msgSend(v6, "section")))
  {
    v8 = -[GeoRequestDetailTableViewController typeForSection:](self, "typeForSection:", objc_msgSend(v6, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestDetailTableViewController counterInfo](self, "counterInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nonZeroResultTypesForType:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    v13 = GEOStringForRequestCounterInfoResult(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestDetailTableViewController counterInfo](self, "counterInfo"));
    v16 = objc_msgSend(v15, "numberOfRequestsForType:result:", v8, v12);

  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v17, "setText:", v14);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v16));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
  objc_msgSend(v19, "setText:", v18);

  return v7;
}

- (GEORequestCounterInfo)counterInfo
{
  return self->_counterInfo;
}

- (void)setCounterInfo:(id)a3
{
  objc_storeStrong((id *)&self->_counterInfo, a3);
}

- (NSArray)requestTypes
{
  return self->_requestTypes;
}

- (void)setRequestTypes:(id)a3
{
  objc_storeStrong((id *)&self->_requestTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTypes, 0);
  objc_storeStrong((id *)&self->_counterInfo, 0);
}

@end
