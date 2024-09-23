@implementation RAPPlacecardImageryIssueItem

- (RAPPlacecardImageryIssueItem)initWithType:(unint64_t)a3 overridenText:(id)a4
{
  id v7;
  RAPPlacecardImageryIssueItem *v8;
  RAPPlacecardImageryIssueItem *v9;

  v7 = a4;
  v8 = -[RAPPlacecardImageryIssueItem initWithType:](self, "initWithType:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_overridenText, a4);

  return v9;
}

- (RAPPlacecardImageryIssueItem)initWithType:(unint64_t)a3
{
  RAPPlacecardImageryIssueItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPPlacecardImageryIssueItem;
  result = -[RAPPlacecardImageryIssueItem init](&v5, "init");
  if (result)
    result->_type = a3;
  return result;
}

- (NSString)localizedTitle
{
  __CFString *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  if (-[RAPPlacecardImageryIssueItem hasOverridenText](self, "hasOverridenText"))
  {
    v3 = self->_overridenText;
  }
  else
  {
    switch(self->_type)
    {
      case 1uLL:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = v4;
        v6 = CFSTR("Other [RAP]");
        goto LABEL_13;
      case 2uLL:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = v4;
        v6 = CFSTR("Not Relevant [RAP]");
        goto LABEL_13;
      case 3uLL:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = v4;
        v6 = CFSTR("Inappropriate Photo [RAP]");
        goto LABEL_13;
      case 4uLL:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = v4;
        v6 = CFSTR("Poor Image Quality [RAP]");
        goto LABEL_13;
      case 5uLL:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = v4;
        v6 = CFSTR("Privacy Concern [RAP]");
        goto LABEL_13;
      case 6uLL:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = v4;
        v6 = CFSTR("Legal Issue [RAP]");
        goto LABEL_13;
      case 7uLL:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = v4;
        v6 = CFSTR("Copyright Violation [RAP]");
        goto LABEL_13;
      case 8uLL:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = v4;
        v6 = CFSTR("Inappropriate Name [RAP]");
LABEL_13:
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

        break;
      default:
        v3 = &stru_1011EB268;
        break;
    }
  }
  return (NSString *)v3;
}

+ (NSArray)defaultIssueItems
{
  NSMutableArray *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  RAPPlacecardImageryIssueItem *v13;
  RAPPlacecardImageryIssueItem *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v2 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_101274388));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "countryCode"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("KR"));

  if (v6)
  {
    objc_msgSend(v3, "removeObject:", &off_101271278);
    objc_msgSend(v3, "removeObject:", &off_101271290);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11);
        v13 = [RAPPlacecardImageryIssueItem alloc];
        v14 = -[RAPPlacecardImageryIssueItem initWithType:](v13, "initWithType:", objc_msgSend(v12, "unsignedIntegerValue", (_QWORD)v17));
        -[NSMutableArray addObject:](v2, "addObject:", v14);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = -[NSMutableArray copy](v2, "copy");
  return (NSArray *)v15;
}

- (BOOL)hasOverridenText
{
  return -[NSString length](self->_overridenText, "length") != 0;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridenText, 0);
}

@end
