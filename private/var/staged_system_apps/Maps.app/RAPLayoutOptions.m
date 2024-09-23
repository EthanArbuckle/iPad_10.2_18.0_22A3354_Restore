@implementation RAPLayoutOptions

- (id)initialLayoutParameters
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init((Class)GEORPFeedbackLayoutConfigParameters);
  v4 = -[RAPLayoutOptions layoutType](self, "layoutType");
  if (v4 <= 5)
    objc_msgSend(v3, "setFormType:", dword_100E3C128[v4]);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  int64_t layoutType;
  id v8;
  id v9;
  MKMapItem *reportedMapItem;
  unsigned __int8 v11;
  void *v12;
  BOOL v13;
  void *v14;

  v4 = a3;
  v5 = objc_opt_class(RAPLayoutOptions);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    layoutType = self->_layoutType;
    v8 = objc_msgSend(v6, "layoutType");
    v9 = v8;
    reportedMapItem = self->_reportedMapItem;
    if (reportedMapItem)
    {
      if ((id)layoutType != v8)
      {
        v11 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reportedMapItem"));

      if (v12)
        v13 = 0;
      else
        v13 = layoutType == (_QWORD)v9;
      v11 = v13;
      if (!v12 || (id)layoutType != v9)
        goto LABEL_16;
      reportedMapItem = self->_reportedMapItem;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reportedMapItem"));
    v11 = -[MKMapItem isEqual:](reportedMapItem, "isEqual:", v14);

    goto LABEL_16;
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (MKMapItem)reportedMapItem
{
  return self->_reportedMapItem;
}

- (void)setReportedMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_reportedMapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedMapItem, 0);
}

@end
