@implementation UIAlertAction

+ (id)_maps_alertActionsForTransitLinesWithNames:(id)a3 artworks:(id)a4 selectionHandlers:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char *v13;
  id v14;
  char *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _GEOTransitLineWrapper *v22;
  void *v23;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "count");
  if (v11 == objc_msgSend(v9, "count") && (v12 = objc_msgSend(v8, "count"), v12 == objc_msgSend(v10, "count")))
  {
    v25 = a1;
    v13 = (char *)objc_msgSend(v8, "count");
    v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v13);
    if (v13)
    {
      for (i = 0; i != v13; ++i)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", i));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        if ((objc_msgSend(v16, "isEqual:", v17) & 1) != 0)
          v18 = 0;
        else
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", i));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", i));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        if ((objc_msgSend(v19, "isEqual:", v20) & 1) != 0)
          v21 = 0;
        else
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", i));

        v22 = -[_GEOTransitLineWrapper initWithName:artwork:]([_GEOTransitLineWrapper alloc], "initWithName:artwork:", v18, v21);
        objc_msgSend(v14, "addObject:", v22);

      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_maps_alertActionsForTransitLines:selectionHandlers:", v14, v10));

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)_maps_alertActionsForTransitLines:(id)a3 selectionHandlers:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD v28[4];

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v8, "scale");
    v10 = v9;

    v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10067E108;
    v24[3] = &unk_1011BF7F0;
    v27 = v10;
    v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
    v25 = v12;
    v26 = v28;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v24);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10067E20C;
    v18[3] = &unk_1011BF838;
    v13 = v12;
    v19 = v13;
    v22 = v28;
    v23 = v10;
    v20 = v6;
    v14 = v11;
    v21 = v14;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);
    v15 = v21;
    v16 = v14;

    _Block_object_dispose(v28, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
