@implementation NSArray(WebPrivacyExtras)

- (id)_wp_arrayByRemovingTrackingInformationFromURLs
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v8)
          {
            objc_msgSend(v8, "_wp_urlByRemovingTrackingInformation");
            v9 = (id)objc_claimAutoreleasedReturnValue();
            if (v9)
              objc_msgSend(v2, "setObject:atIndexedSubscript:", v9, v5 + v7);
            goto LABEL_15;
          }
        }
        else
        {

        }
        v9 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v8 = 0;
LABEL_15:

          goto LABEL_16;
        }
        if (v9)
        {
          objc_msgSend(v9, "_wp_removeTrackingInformationFromURLRepresentation", (_QWORD)v12);
          v8 = v9;
        }
        else
        {
          v8 = 0;
        }
LABEL_16:

        ++v7;
      }
      while (v4 != v7);
      v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v4 = v10;
      v5 += v7;
    }
    while (v10);
  }

  return v2;
}

- (void)_wp_removeTrackingInformationFromURLs:()WebPrivacyExtras
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *group;
  _QWORD block[4];
  id v20;
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = (void *)objc_msgSend(a1, "mutableCopy");
  group = dispatch_group_create();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = a1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v9)
          {
            dispatch_group_enter(group);
            v22[0] = MEMORY[0x24BDAC760];
            v22[1] = 3321888768;
            v22[2] = __67__NSArray_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke;
            v22[3] = &__block_descriptor_56_ea8_32c80_ZTSKZ67__NSArray_WebPrivacyExtras___wp_removeTrackingInformationFromURLs__E3__2_e15_v16__0__NSURL_8l;
            v10 = group;
            v11 = v17;
            v23 = v10;
            v24 = v11;
            v25 = v6 + v8;
            -[NSObject _wp_removeTrackingInformation:](v9, "_wp_removeTrackingInformation:", v22);

            v12 = v23;
LABEL_14:

            goto LABEL_15;
          }
        }
        else
        {

        }
        v12 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = 0;
          goto LABEL_14;
        }
        if (v12)
        {
          -[NSObject _wp_removeTrackingInformationFromURLRepresentation](v12, "_wp_removeTrackingInformationFromURLRepresentation");
          v9 = v12;
        }
        else
        {
          v9 = 0;
        }
LABEL_15:

        ++v8;
      }
      while (v5 != v8);
      v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v5 = v13;
      v6 += v8;
    }
    while (v13);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__NSArray_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke_17;
  block[3] = &unk_251BCEEE0;
  v20 = v17;
  v21 = v16;
  v14 = v17;
  v15 = v16;
  dispatch_group_notify(group, MEMORY[0x24BDAC9B8], block);

}

@end
