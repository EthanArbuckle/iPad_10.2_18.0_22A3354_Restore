@implementation NSMutableDictionary

- (void)_addProperty:(id)a3 fromSupplementalContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(".")));
  v9 = objc_msgSend(v8, "mutableCopy");

  if ((unint64_t)objc_msgSend(v9, "count") > 1)
  {
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
    if (objc_msgSend(v9, "count") == (id)1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
      -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", v12, v13);
    }
    else
    {
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        v14 = 1;
        do
        {
          v15 = objc_autoreleasePoolPush();
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subarrayWithRange:", 0, v14));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsJoinedByString:", CFSTR(".")));
          v18 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKeyPath:](self, "valueForKeyPath:", v17));
          if (!v18)
          {
            v18 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 1);
            -[NSMutableDictionary setValue:forKeyPath:](self, "setValue:forKeyPath:", v18, v17);
          }

          objc_autoreleasePoolPop(v15);
          ++v14;
        }
        while (v14 < (unint64_t)objc_msgSend(v9, "count"));
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", CFSTR(".")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));
      -[NSMutableDictionary setValue:forKeyPath:](self, "setValue:forKeyPath:", v13, v12);
    }

  }
  else
  {
    v10 = APLogForCategory(21);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v19 = 138543362;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "We don't have a properly namespaced key: %{public}@", (uint8_t *)&v19, 0xCu);
    }

  }
}

@end
