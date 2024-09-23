@implementation RTVisit

- (id)getPlaceName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit placeInference](self, "placeInference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit placeInference](self, "placeInference"));
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredName"));
    v8 = objc_msgSend(v7, "copy");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));

    if (!v10)
    {
      v8 = 0;
      return v8;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit placeInference](self, "placeInference"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v8 = objc_msgSend(v11, "copy");

  }
  return v8;
}

- (id)getFinerGranularityPlaceName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit placeInference](self, "placeInference"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredName"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit placeInference](self, "placeInference"));
    v7 = objc_msgSend(v6, "userType");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit placeInference](self, "placeInference"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preferredName"));
      v10 = objc_msgSend(v9, "copy");
      goto LABEL_7;
    }
  }
  else
  {

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit placeInference](self, "placeInference"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "finerGranularityMapItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));

  if (!v13)
  {
    v10 = 0;
    return v10;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit placeInference](self, "placeInference"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finerGranularityMapItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v10 = objc_msgSend(v14, "copy");

LABEL_7:
  return v10;
}

- (id)getLocation
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit location](self, "location"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit location](self, "location"));
    v5 = objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isEqualToVisitMoment:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RTVisit entry](self, "entry"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit exit](self, "exit")),
        v7,
        v6,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit entry](self, "entry"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v10 = objc_msgSend(v8, "isEqualToDate:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit exit](self, "exit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
    LOBYTE(v9) = objc_msgSend(v11, "isEqualToDate:", v12);

    v13 = v10 & v9;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqualToLoiVisit:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit location](self, "location"));
  if (!v7)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
    if (!v3)
    {
      v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit location](self, "location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
  v9 = objc_msgSend(v4, "isEqualToLocation:", v8);

  if (!v7)
    goto LABEL_6;
LABEL_7:

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit entry](self, "entry"));
  if (!v10)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryDate"));
    if (!v4)
    {
      v13 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit entry](self, "entry"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryDate"));
  v13 = objc_msgSend(v11, "isEqualToDate:", v12);

  if (!v10)
    goto LABEL_12;
LABEL_13:

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit exit](self, "exit"));
  if (!v14)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "exitDate"));
    if (!v4)
    {
      v17 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RTVisit exit](self, "exit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "exitDate"));
  v17 = objc_msgSend(v15, "isEqualToDate:", v16);

  if (!v14)
    goto LABEL_18;
LABEL_19:

  return v9 & v13 & v17;
}

@end
