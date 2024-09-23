@implementation WaypointPlaceholder

- (WaypointPlaceholder)initWithName:(id)a3 displayableMarker:(id)a4
{
  id v6;
  id v7;
  WaypointPlaceholder *v8;
  NSString *v9;
  NSString *name;
  SearchResult *v11;
  SearchResult *displayableMarker;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WaypointPlaceholder;
  v8 = -[WaypointPlaceholder init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = v9;

    v11 = (SearchResult *)objc_msgSend(v7, "copy");
    displayableMarker = v8->_displayableMarker;
    v8->_displayableMarker = v11;

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return -[SearchResult hash](self->_displayableMarker, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  WaypointPlaceholder *v4;
  WaypointPlaceholder *v5;
  void *v6;
  void *v7;
  SearchResult *displayableMarker;
  void *v9;
  unsigned __int8 v10;

  v4 = (WaypointPlaceholder *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (-[WaypointPlaceholder isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointPlaceholder name](v5, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointPlaceholder name](self, "name"));
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      displayableMarker = self->_displayableMarker;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointPlaceholder displayableMarker](v5, "displayableMarker"));
      v10 = -[SearchResult isEqualToSearchResult:forPurpose:](displayableMarker, "isEqualToSearchResult:forPurpose:", v9, 1);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)description
{
  WaypointPlaceholder *v2;
  id v3;
  void ***v4;
  WaypointPlaceholder *v5;
  WaypointPlaceholder *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10095E0C8;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[WaypointPlaceholder _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointPlaceholder performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v12, v13));

  return (NSString *)v14;
}

- (NSString)debugDescription
{
  WaypointPlaceholder *v2;
  id v3;
  void ***v4;
  WaypointPlaceholder *v5;
  WaypointPlaceholder *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10095E248;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[WaypointPlaceholder _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointPlaceholder performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v12, v13));

  return (NSString *)v14;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, const __CFString *, SearchResult *))a3 + 2))(v6, CFSTR("displayableMarker"), self->_displayableMarker);

}

- (NSString)name
{
  return self->_name;
}

- (SearchResult)displayableMarker
{
  return self->_displayableMarker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayableMarker, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
