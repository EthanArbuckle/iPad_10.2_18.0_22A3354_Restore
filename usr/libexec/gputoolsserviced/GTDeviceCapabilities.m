@implementation GTDeviceCapabilities

- (id)daemonDeviceCapabilities
{
  return DaemonDeviceCapabilities(CFSTR("/"));
}

- (id)deviceCompatibilityCapabilitiesWithHeapDescriptors:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *i;
  void *v15;
  char *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  id v35;
  apr_pool_t *p;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  apr_pool_t *newpool;
  _QWORD v48[6];
  _QWORD v49[6];
  _BYTE v50[128];
  id v51;

  v3 = a3;
  apr_initialize();
  newpool = 0;
  apr_pool_create_ex(&newpool, 0, 0, 0);
  v45 = 0;
  v46 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("heap-texture-info")));
  v5 = v4;
  v44 = 0;
  if (v4)
  {
    v45 = sub_10001CB68(v4, (uint64_t)newpool, &v44);
    v46 = v6;
  }
  v42 = 0;
  v43 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("heap-acceleration-structure-info")));
  v8 = v7;
  v41 = 0;
  if (v7)
  {
    v42 = sub_10001C990(v7, (uint64_t)newpool, &v41);
    v43 = v9;
  }
  v31 = v5;
  v10 = MTLCreateSystemDefaultDevice();
  v32 = v3;
  v29 = v10;
  v30 = v8;
  if (v10)
  {
    v51 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1, v10, v8, v5, v3));
  }
  else
  {
    v11 = 0;
  }
  v35 = objc_alloc_init((Class)NSMutableArray);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v12)
  {
    v13 = v12;
    v34 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        p = 0;
        apr_pool_create_ex(&p, 0, 0, 0);
        v16 = sub_10001D000(v15, (uint64_t)p);
        v17 = sub_10001C7EC((const uint8_t *)v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = sub_10001E378(&v45, (uint64_t)v16, v15);
        v20 = sub_10001E698((uint64_t)&v42, (uint64_t)v16, v15);
        v48[0] = CFSTR("device-name");
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
        v49[0] = v21;
        v49[1] = v18;
        v48[1] = CFSTR("capabilities-runtime");
        v48[2] = CFSTR("heap-texture-compatibility");
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v19));
        v49[2] = v22;
        v48[3] = CFSTR("heap-acceleration-structure-compatibility");
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v20));
        v49[3] = v23;
        v48[4] = CFSTR("heap-texture-info-decoded");
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v44 == 0));
        v49[4] = v24;
        v48[5] = CFSTR("heap-acceleration-structure-info-decoded");
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v41 == 0));
        v49[5] = v25;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 6));
        objc_msgSend(v35, "addObject:", v26);

        apr_pool_destroy(p);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v13);
  }

  apr_pool_destroy(newpool);
  v27 = objc_msgSend(v35, "copy");

  return v27;
}

- (id)inferiorEnvironment:(id)a3
{
  return DaemonCreateGuestAppTransport(a3);
}

@end
