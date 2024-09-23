@implementation YIbYnDZMoU7hwSYC

+ (id)sharedInstance
{
  if (qword_1005115B0 != -1)
    dispatch_once(&qword_1005115B0, &stru_1004CEC50);
  return (id)qword_1005115A8;
}

- (int64_t)y8DihfZYjxGbiiEE:(id)a3 QsX3tfdMvsGwvY0F:(int64_t)a4 withCompletion:(id)a5
{
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  int64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  void *v33;

  v28 = a3;
  v7 = (void (**)(id, void *))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary"));
  v30 = 0;
  LODWORD(a5) = objc_msgSend(v8, "openAndWaitWithUpgrade:error:", 0, &v30);
  v29 = v30;

  if ((_DWORD)a5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v28));
    v10 = 0;
    v11 = objc_alloc_init((Class)PHFetchOptions);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary"));
    objc_msgSend(v11, "setPhotoLibrary:", v12);

    if (a4 < 1)
      a4 = 0x7FFFFFFFLL;
    else
      objc_msgSend(v11, "setFetchLimit:", a4);
    objc_msgSend(v11, "setInternalPredicate:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v11));
    v22 = objc_msgSend(v20, "count");
    if (a4 >= (unint64_t)v22)
      v21 = (int64_t)v22;
    else
      v21 = a4;
  }
  else
  {
    v10 = 165023;
    v13 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D76C4((uint64_t)v29, v13, v14, v15, v16, v17, v18, v19);
    v9 = 0;
    v11 = 0;
    v20 = 0;
    v21 = 0;
  }
  v31[0] = CFSTR("c");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v21));
  v31[1] = CFSTR("ec");
  v32[0] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
  v32[1] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
  v33 = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));

  v7[2](v7, v26);
  return v10;
}

- (id)_uTjOtNxowyWuuBCA:(id)a3 N3UHg1ij3irF9uUu:(id)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SEL v18;
  uint64_t v19;
  void *v20;
  NSString *v21;
  SEL v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v34 = v7;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[YIbYnDZMoU7hwSYC propertySets](YIbYnDZMoU7hwSYC, "propertySets"));
  v33 = objc_msgSend(CFSTR("PHAssetPropertySet"), "length");
  v8 = 0;
  v35 = 0;
  v32 = v5;
  while ((unint64_t)objc_msgSend(v6, "count") > v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(".")));
    if ((unint64_t)objc_msgSend(v10, "count") < 2)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", v9));
      if (v25)
      {
        objc_msgSend(v7, "setObject:forKey:", v25, v9);
      }
      else
      {
        v27 = v35;
        if (!v35)
          v27 = 165015;
        v35 = v27;
      }
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
      v12 = objc_msgSend(v36, "containsObject:", v11);

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "substringFromIndex:", v33));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringToIndex:", 1));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lowercaseString"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringFromIndex:", 1));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
        objc_msgSend(v17, "appendString:", v37);
        objc_msgSend(v17, "appendString:", v16);
        objc_msgSend(v17, "appendString:", CFSTR("Properties"));
        v18 = NSSelectorFromString((NSString *)v17);
        if ((objc_opt_respondsToSelector(v5, v18) & 1) != 0)
        {
          v19 = ((uint64_t (*)(id, SEL))objc_msgSend(v5, "methodForSelector:", v18))(v5, v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          if (v20)
          {
            v21 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
            v22 = NSSelectorFromString(v21);

            if ((objc_opt_respondsToSelector(v20, v22) & 1) != 0)
            {
              v23 = ((uint64_t (*)(void *, SEL))objc_msgSend(v20, "methodForSelector:", v22))(v20, v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
              if (v24)
              {
                if (+[PJXBDBF1h0EU80dy canSerialize:](PJXBDBF1h0EU80dy, "canSerialize:", v24))
                {
                  objc_msgSend(v34, "setObject:forKey:", v24, v9);
                }
                else
                {
                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "description"));
                  objc_msgSend(v34, "setObject:forKey:", v28, v9);

                }
              }

            }
          }

          v5 = v32;
        }

        v25 = 0;
        v7 = v34;
      }
      else
      {
        v26 = qword_1005185D0;
        if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Ignoring unsupported PropertySet", buf, 2u);
        }
        v25 = 0;
      }
    }

    ++v8;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v35));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("ec"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v7));
  return v30;
}

+ (id)propertySets
{
  if (qword_1005115C0 != -1)
    dispatch_once(&qword_1005115C0, &stru_1004CEC70);
  return (id)qword_1005115B8;
}

- (id)_extractPHAssetPropertySets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v17;
  uint8_t buf;
  _BYTE v19[15];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v17 = a3;
  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v17, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[YIbYnDZMoU7hwSYC propertySets](YIbYnDZMoU7hwSYC, "propertySets"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v17;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("."), v17));
        if ((unint64_t)objc_msgSend(v10, "count") < 2)
        {
          objc_msgSend(v3, "addObject:", v9);
        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
          v12 = objc_msgSend(v4, "containsObject:", v11);

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
            objc_msgSend(v3, "addObject:", v13);

          }
          else
          {
            v14 = qword_1005185D0;
            if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
              sub_1003D772C(&buf, v19, v14);
          }
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v6 = v15;
    }
    while (v15);
  }

  return v3;
}

- (int64_t)ZkTXckPDVjRWZuVM:(id)a3 QsX3tfdMvsGwvY0F:(int64_t)a4 oMKZEzaKOVd8YlLk:(id)a5 withCompletion:(id)a6
{
  id v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int64_t v21;
  id v22;
  unint64_t i;
  id v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  void (**v39)(id, id);
  id v40;
  void *v41;
  id v42;

  v40 = a3;
  v10 = a5;
  v39 = (void (**)(id, id))a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary"));
  v42 = 0;
  v12 = objc_msgSend(v11, "openAndWaitWithUpgrade:error:", 0, &v42);
  v13 = v42;

  v41 = v13;
  if ((v12 & 1) != 0)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v40));
    v38 = (void *)v14;
    v15 = objc_alloc_init((Class)PHFetchOptions);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary"));
    objc_msgSend(v15, "setPhotoLibrary:", v16);

    if (a4 >= 1)
      objc_msgSend(v15, "setFetchLimit:", a4);
    objc_msgSend(v15, "setChunkSizeForFetch:", 50);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[YIbYnDZMoU7hwSYC _extractPHAssetPropertySets:](self, "_extractPHAssetPropertySets:", v10));
    objc_msgSend(v15, "setFetchPropertySets:", v17);

    objc_msgSend(v15, "setInternalPredicate:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v15));
    v19 = objc_alloc((Class)NSMutableArray);
    v20 = objc_msgSend(v18, "count");
    if ((unint64_t)v20 >= a4)
      v21 = a4;
    else
      v21 = (int64_t)v20;
    v22 = objc_msgSend(v19, "initWithCapacity:", v21);
    for (i = 0; ; ++i)
    {
      v24 = objc_msgSend(v18, "count");
      v25 = (unint64_t)v24 >= a4 ? a4 : (unint64_t)v24;
      if (v25 <= i)
        break;
      v26 = objc_autoreleasePoolPush();
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", i));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[YIbYnDZMoU7hwSYC _uTjOtNxowyWuuBCA:N3UHg1ij3irF9uUu:](self, "_uTjOtNxowyWuuBCA:N3UHg1ij3irF9uUu:", v27, v10));

      objc_msgSend(v22, "addObject:", v28);
      objc_autoreleasePoolPop(v26);
    }

    v29 = 0;
  }
  else
  {
    v29 = 165023;
    v30 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D76C4((uint64_t)v13, v30, v31, v32, v33, v34, v35, v36);
    v18 = 0;
    v15 = 0;
    v22 = 0;
  }
  v39[2](v39, v22);

  return v29;
}

@end
