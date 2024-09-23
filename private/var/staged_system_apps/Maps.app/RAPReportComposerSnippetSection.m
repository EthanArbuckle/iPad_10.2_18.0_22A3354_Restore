@implementation RAPReportComposerSnippetSection

- (RAPReportComposerSnippetSection)initWithQuestion:(id)a3
{
  id v5;
  RAPReportComposerSnippetSection *v6;
  RAPReportComposerSnippetSection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPReportComposerSnippetSection;
  v6 = -[RAPTablePartSection init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_question, a3);
    -[RAPSnippetProtocol addObserver:changeHandler:](v7->_question, "addObserver:changeHandler:", v7, &stru_1011E9FD8);
  }

  return v7;
}

- (id)headerTitle
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[RAPSnippetProtocol snippetStyle](self->_question, "snippetStyle");
  if (v2 == (id)2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Line [Report an issue Transit Line snippet title]");
  }
  else
  {
    if (v2 != (id)1)
    {
      v6 = 0;
      return v6;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Name [Report an Issue Place snippet title]");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v6;
}

- (int64_t)rowsCount
{
  return (char *)-[RAPSnippetProtocol snippetStyle](self->_question, "snippetStyle") - 1 < (char *)2;
}

- (BOOL)isCurrentLocation
{
  void *v3;
  BOOL v4;

  if (!-[RAPSnippetProtocol conformsToProtocol:](self->_question, "conformsToProtocol:", &OBJC_PROTOCOL___RAPPlaceMenu))return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSnippetProtocol reportedPlace](self->_question, "reportedPlace"));
  v4 = objc_msgSend(v3, "source") == 0;

  return v4;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  id v4;
  void *v5;
  RAPTransitLineTableViewCell *v6;
  RAPReportComposerPlaceSnippetTableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  RAPTransitLineTableViewCell *v11;
  void *v12;

  v4 = -[RAPSnippetProtocol snippetStyle](self->_question, "snippetStyle", a3);
  if (v4 == (id)2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection namespacedReuseIdentifierWithSuffix:](self, "namespacedReuseIdentifierWithSuffix:", CFSTR("ReportedLineSnippet")));
    v6 = (RAPTransitLineTableViewCell *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueCellWithNamespacedReuseIdentifier:](self, "dequeueCellWithNamespacedReuseIdentifier:", v10));

    if (!v6)
    {
      v11 = [RAPTransitLineTableViewCell alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection namespacedReuseIdentifierWithSuffix:](self, "namespacedReuseIdentifierWithSuffix:", CFSTR("ReportedLineSnippet")));
      v6 = -[RAPTransitLineTableViewCell initWithStyle:reuseIdentifier:](v11, "initWithStyle:reuseIdentifier:", 0, v12);

      -[RAPTransitLineTableViewCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSnippetProtocol snippetTransitLine](self->_question, "snippetTransitLine"));
    -[RAPTransitLineTableViewCell setContentsFromTransitLine:](v6, "setContentsFromTransitLine:", v9);
  }
  else
  {
    if (v4 != (id)1)
    {
      v6 = 0;
      return v6;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection namespacedReuseIdentifierWithSuffix:](self, "namespacedReuseIdentifierWithSuffix:", CFSTR("ReportedPlaceSnippet")));
    v6 = (RAPTransitLineTableViewCell *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueCellWithNamespacedReuseIdentifier:](self, "dequeueCellWithNamespacedReuseIdentifier:", v5));

    if (!v6)
    {
      v7 = [RAPReportComposerPlaceSnippetTableViewCell alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection namespacedReuseIdentifierWithSuffix:](self, "namespacedReuseIdentifierWithSuffix:", CFSTR("ReportedPlaceSnippet")));
      v6 = -[RAPReportComposerTwoLineSnippetTableViewCell initWithStyle:reuseIdentifier:](v7, "initWithStyle:reuseIdentifier:", 0, v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSnippetProtocol snippetMapItem](self->_question, "snippetMapItem"));
    -[RAPTransitLineTableViewCell setContentsFromMapItem:isCurrentLocation:](v6, "setContentsFromMapItem:isCurrentLocation:", v9, -[RAPReportComposerSnippetSection isCurrentLocation](self, "isCurrentLocation"));
  }

  return v6;
}

- (double)heightForRowAtIndex:(int64_t)a3
{
  id v4;
  double result;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = -[RAPSnippetProtocol snippetStyle](self->_question, "snippetStyle", a3);
  if (v4 == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTransitLineTableViewCell measuringCell](RAPTransitLineTableViewCell, "measuringCell"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSnippetProtocol snippetTransitLine](self->_question, "snippetTransitLine"));
    objc_msgSend(v6, "setContentsFromTransitLine:", v7);
LABEL_7:

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
    objc_msgSend(v6, "preferredHeightInTableView:", v8);
    v10 = v9;

    return v10;
  }
  if (v4 == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPReportComposerTwoLineSnippetTableViewCell measuringCell](RAPReportComposerPlaceSnippetTableViewCell, "measuringCell"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSnippetProtocol snippetMapItem](self->_question, "snippetMapItem"));
    objc_msgSend(v6, "setContentsFromMapItem:isCurrentLocation:", v7, -[RAPReportComposerSnippetSection isCurrentLocation](self, "isCurrentLocation"));
    goto LABEL_7;
  }
  if (!v4)
    return UITableViewAutomaticDimension;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_question, 0);
}

@end
