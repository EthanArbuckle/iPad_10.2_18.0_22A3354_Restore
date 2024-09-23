@implementation GeoTotalRequestCountTableViewController

- (GeoTotalRequestCountTableViewController)initWithDictionary:(id)a3
{
  id v4;
  GeoTotalRequestCountTableViewController *v5;
  NSDictionary *v6;
  NSDictionary *info;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GeoTotalRequestCountTableViewController;
  v5 = -[GeoTotalRequestCountTableViewController initWithStyle:](&v9, "initWithStyle:", 1);
  if (v5)
  {
    v6 = (NSDictionary *)objc_msgSend(v4, "copy");
    info = v5->_info;
    v5->_info = v6;

    -[GeoTotalRequestCountTableViewController dataPreProcessing](v5, "dataPreProcessing");
  }

  return v5;
}

- (void)dataPreProcessing
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSDictionary *v13;
  NSDictionary *sectionDict;
  NSOrderedSet *v15;
  NSOrderedSet *orderedSectionKeys;
  id obj;
  _QWORD v18[6];
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[GeoTotalRequestCountTableViewController info](self, "info"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[GeoTotalRequestCountTableViewController info](self, "info"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1005E94CC;
        v18[3] = &unk_1011BD610;
        v18[4] = self;
        v18[5] = v9;
        v19 = v4;
        v20 = v3;
        v21 = v11;
        v12 = v11;
        objc_msgSend(v12, "enumerateRequestTypes:", v18);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  v13 = (NSDictionary *)objc_msgSend(v4, "copy");
  sectionDict = self->_sectionDict;
  self->_sectionDict = v13;

  v15 = (NSOrderedSet *)objc_msgSend(v3, "copy");
  orderedSectionKeys = self->_orderedSectionKeys;
  self->_orderedSectionKeys = v15;

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GeoTotalRequestCountTableViewController;
  -[GeoTotalRequestCountTableViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GeoTotalRequestCountTableViewController;
  -[GeoTotalRequestCountTableViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GeoTotalRequestCountTableViewController orderedSectionKeys](self, "orderedSectionKeys", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GeoTotalRequestCountTableViewController orderedSectionKeys](self, "orderedSectionKeys", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GeoTotalRequestCountTableViewController sectionDict](self, "sectionDict"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("xmitB")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", objc_msgSend(v10, "unsignedIntegerValue"), 3));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("recvB")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", objc_msgSend(v12, "unsignedIntegerValue"), 3));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n(xmit:%@ / recv:%@)"), v7, v11, v13));
  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GeoTotalRequestCountTableViewController orderedSectionKeys](self, "orderedSectionKeys", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GeoTotalRequestCountTableViewController sectionDict](self, "sectionDict"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("apps")));
  v11 = objc_msgSend(v10, "count");

  return (int64_t)v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GeoTotalRequestCountTableViewController orderedSectionKeys](self, "orderedSectionKeys"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GeoTotalRequestCountTableViewController sectionDict](self, "sectionDict"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("apps")));
  v13 = objc_msgSend(v6, "row");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v13));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("reuseIdentifier")));

  if (!v15)
    v15 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("reuseIdentifier"));
  objc_msgSend(v15, "setSelectionStyle:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("name")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textLabel"));
  objc_msgSend(v17, "setText:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("count")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("xmitB")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("recvB")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ requests : (xmit:%@ / recv:%@)"), v18, v19, v20));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "detailTextLabel"));
  objc_msgSend(v22, "setText:", v21);

  return v15;
}

- (unint64_t)getRequestCountForType:(id)a3 andApp:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  unsigned int v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GeoTotalRequestCountTableViewController info](self, "info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", v6));

  v9 = 0;
  v10 = 0;
  do
  {
    v11 = v9;
    v10 += (unint64_t)objc_msgSend(v8, "numberOfRequestsForType:result:", a3, v9++);
  }
  while (v11 < 4);

  return v10;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (NSDictionary)sectionDict
{
  return self->_sectionDict;
}

- (void)setSectionDict:(id)a3
{
  objc_storeStrong((id *)&self->_sectionDict, a3);
}

- (NSOrderedSet)orderedSectionKeys
{
  return self->_orderedSectionKeys;
}

- (void)setOrderedSectionKeys:(id)a3
{
  objc_storeStrong((id *)&self->_orderedSectionKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedSectionKeys, 0);
  objc_storeStrong((id *)&self->_sectionDict, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
