@implementation VSNonChannelAppDecider

- (VSNonChannelAppDecider)init
{
  VSNonChannelAppDecider *v2;
  VSNonChannelAppDecider *v3;
  NSArray *appDescriptions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSNonChannelAppDecider;
  v2 = -[VSNonChannelAppDecider init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    appDescriptions = v2->_appDescriptions;
    v2->_appDescriptions = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v3;
}

- (id)decidedNonChannelApps
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  uint64_t v34;
  char v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  -[VSNonChannelAppDecider appDescriptions](self, "appDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSNonChannelAppDecider preferredAppBundleOrAdamID](self, "preferredAppBundleOrAdamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v5 = v3;
    goto LABEL_31;
  }
  if (!v4)
  {
    -[VSNonChannelAppDecider preferredDeviceFamily](self, "preferredDeviceFamily");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      v30 = v28;
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __47__VSNonChannelAppDecider_decidedNonChannelApps__block_invoke;
      v41[3] = &unk_24FE1AF18;
      v42 = v30;
      objc_msgSend(v3, "sortedArrayUsingComparator:", v41);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = v3;
    }

    goto LABEL_31;
  }
  objc_msgSend(v3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [appDescriptions firstObject] parameter must not be nil."));
  objc_msgSend(v3, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v4;
  v8 = v4;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v33 = v3;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (!v10)
  {

    v12 = 0;
    goto LABEL_27;
  }
  v11 = v10;
  v12 = 0;
  v35 = 0;
  v13 = *(_QWORD *)v38;
  v34 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v38 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      if (objc_msgSend(v15, "isDefaultAppForProvider"))
      {
        v16 = v15;

        v35 = 1;
        v7 = v16;
      }
      objc_msgSend(v15, "bundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqualToString:", v8))
      {

      }
      else
      {
        objc_msgSend(v15, "adamID");
        v36 = v12;
        v18 = v9;
        v19 = v7;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringValue");
        v21 = v11;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v8);

        v11 = v21;
        v7 = v19;
        v9 = v18;
        v12 = v36;
        v13 = v34;

        if (!v23)
          continue;
      }
      v24 = v15;

      v12 = v24;
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  }
  while (v11);

  if ((v35 & 1) == 0)
  {
LABEL_27:
    v5 = v9;
    goto LABEL_28;
  }
  if (v12)
    v25 = v12;
  else
    v25 = v7;
  v43 = v25;
  v26 = (void *)MEMORY[0x24BDBCE30];
  v27 = v25;
  objc_msgSend(v26, "arrayWithObjects:count:", &v43, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_28:
  v4 = v32;
  v3 = v33;
LABEL_31:

  return v5;
}

uint64_t __47__VSNonChannelAppDecider_decidedNonChannelApps__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "deviceFamilies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(v6, "deviceFamilies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != objc_msgSend(v9, "count"))
    goto LABEL_6;
  objc_msgSend(v5, "deviceFamilies");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(v6, "deviceFamilies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", *(_QWORD *)(a1 + 32));

  if ((v12 & 1) != 0)
  {
    v13 = 0;
    goto LABEL_12;
  }
LABEL_7:
  objc_msgSend(v5, "deviceFamilies");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  objc_msgSend(v6, "deviceFamilies");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 >= objc_msgSend(v16, "count"))
  {

    v13 = 1;
  }
  else
  {
    objc_msgSend(v5, "deviceFamilies");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsObject:", *(_QWORD *)(a1 + 32));

    if (v18)
      v13 = -1;
    else
      v13 = 1;
  }
LABEL_12:

  return v13;
}

- (NSArray)appDescriptions
{
  return self->_appDescriptions;
}

- (void)setAppDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)preferredAppBundleOrAdamID
{
  return self->_preferredAppBundleOrAdamID;
}

- (void)setPreferredAppBundleOrAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)preferredDeviceFamily
{
  return self->_preferredDeviceFamily;
}

- (void)setPreferredDeviceFamily:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredDeviceFamily, 0);
  objc_storeStrong((id *)&self->_preferredAppBundleOrAdamID, 0);
  objc_storeStrong((id *)&self->_appDescriptions, 0);
}

@end
