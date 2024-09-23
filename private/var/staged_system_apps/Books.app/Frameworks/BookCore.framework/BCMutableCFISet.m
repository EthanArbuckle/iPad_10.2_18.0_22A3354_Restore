@implementation BCMutableCFISet

- (void)addCFI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "isRange"))
  {
    v5 = (void *)objc_opt_class(self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFISet cfis](self, "cfis"));
    v10 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_unionArray:withArray:", v6, v7));

    v9 = objc_msgSend(v8, "mutableCopy");
    -[BCCFISet setCFIs:](self, "setCFIs:", v9);

  }
}

- (BOOL)addCFIString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v12 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v6, &v12));
  v8 = v12;
  if (v7)
  {
    -[BCMutableCFISet addCFI:](self, "addCFI:", v7);
    if (a4)
LABEL_3:
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    v10 = BCReadingStatisticsLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Cannot initialize BCCFI with string %@.  addCFIString: will return nil. error=%@", buf, 0x16u);
    }

    if (a4)
      goto LABEL_3;
  }

  return v8 == 0;
}

- (void)unionCFISet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_opt_class(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFISet cfis](self, "cfis"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cfis"));

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_unionArray:withArray:", v6, v7));
  v8 = objc_msgSend(v9, "mutableCopy");
  -[BCCFISet setCFIs:](self, "setCFIs:", v8);

}

- (void)removeCFI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "isRange"))
  {
    v5 = (void *)objc_opt_class(self);
    v12 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_negateArray:", v6));

    v8 = (void *)objc_opt_class(self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFISet cfis](self, "cfis"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_intersectArray:withArray:", v9, v7));

    v11 = objc_msgSend(v10, "mutableCopy");
    -[BCCFISet setCFIs:](self, "setCFIs:", v11);

  }
}

- (BOOL)removeCFIString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v10;
  NSObject *v11;
  id v12;

  v6 = a3;
  v12 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v6, &v12));
  v8 = v12;
  if (v7)
  {
    -[BCMutableCFISet removeCFI:](self, "removeCFI:", v7);
    if (a4)
LABEL_3:
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    v10 = BCReadingStatisticsLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1B6FA0((uint64_t)v6, (uint64_t)v8, v11);

    if (a4)
      goto LABEL_3;
  }

  return v8 == 0;
}

- (void)subtractCFISet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_opt_class(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cfis"));

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_negateArray:", v6));
  v7 = (void *)objc_opt_class(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFISet cfis](self, "cfis"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_intersectArray:withArray:", v8, v11));

  v10 = objc_msgSend(v9, "mutableCopy");
  -[BCCFISet setCFIs:](self, "setCFIs:", v10);

}

@end
