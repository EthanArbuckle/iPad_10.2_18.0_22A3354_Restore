@implementation PerfDiagsSelfEnablementController

+ (BOOL)isAnyModeActive
{
  id v2;
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  void *i;
  id v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[5];

  v17[0] = CFSTR("PDSEHangTracer");
  v17[1] = CFSTR("PDSEHTThirdParty");
  v17[2] = CFSTR("PDSESentry");
  v17[3] = CFSTR("PDSEAppLaunch");
  v17[4] = CFSTR("PDSEWorkflowResponsiveness");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 5));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = sub_100029788(CFSTR("com.apple.da"), CFSTR("mobile"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i));
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        v10 = objc_msgSend(v9, "count", (_QWORD)v12);

        v5 |= v10 != 0;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

@end
