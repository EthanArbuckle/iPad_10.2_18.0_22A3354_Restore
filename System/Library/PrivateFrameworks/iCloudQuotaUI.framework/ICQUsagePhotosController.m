@implementation ICQUsagePhotosController

+ (id)mediaGroups
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("photolibrary");
  v3[1] = CFSTR("syncedfromitunes");
  v3[2] = CFSTR("myphotostream");
  v3[3] = CFSTR("sharedphotostream");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sizeForSpecifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;

  v3 = a3;
  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "mediaCollectionForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD1490];
  objc_msgSend(v6, "totalSize");
  objc_msgSend(v7, "stringFromByteCount:countStyle:", (uint64_t)v8, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)specifiers
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  ICQUsagePhotosController *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v26 = (int)*MEMORY[0x24BE756E0];
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PHOTOS"), &stru_24E400750, CFSTR("Usage Statistics"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, 0, 0, 0, 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setProperty:forKey:", CFSTR("PSUsageSizeHeader"), *MEMORY[0x24BE75AA0]);
    -[ICQUsagePhotosController specifier](self, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyForKey:", CFSTR("TOTAL_SIZE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v10, CFSTR("SIZE"));

    v29 = v4;
    v25 = v8;
    objc_msgSend(v4, "insertObject:atIndex:", v8, 0);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = self;
    objc_msgSend((id)objc_opt_class(), "mediaGroups");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
      v28 = *MEMORY[0x24BE75AC0];
      v27 = *MEMORY[0x24BE75948];
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v14);
          +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "mediaCollectionForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "totalSize");
          if (v18 > 0.0)
          {
            v19 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "localizedStringForKey:value:table:", v15, &stru_24E400750, CFSTR("Usage Statistics"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, v30, 0, sel_sizeForSpecifier_, 0, 4, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "setProperty:forKey:", v15, v28);
            objc_msgSend(v22, "setProperty:forKey:", objc_opt_class(), v27);
            objc_msgSend(v29, "addObject:", v22);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v12);
    }

    v23 = *(Class *)((char *)&v30->super.super.super.super.super.super.super.isa + v26);
    *(Class *)((char *)&v30->super.super.super.super.super.super.super.isa + v26) = (Class)v29;

    v3 = *(Class *)((char *)&v30->super.super.super.super.super.super.super.isa + v26);
  }
  return v3;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

@end
