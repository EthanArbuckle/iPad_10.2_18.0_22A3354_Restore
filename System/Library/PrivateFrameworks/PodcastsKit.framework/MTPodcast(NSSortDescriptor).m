@implementation MTPodcast(NSSortDescriptor)

+ (id)sortDescriptorsForSortType:()NSSortDescriptor
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BE73820], "sortDescriptorsForManualOrder");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 1:
      v4 = (void *)MEMORY[0x24BE73820];
      v5 = 0;
      goto LABEL_5;
    case 2:
      v4 = (void *)MEMORY[0x24BE73820];
      v5 = 1;
LABEL_5:
      objc_msgSend(v4, "sortDescriptorsForDateAddedAscending:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 4:
      v6 = (void *)MEMORY[0x24BE73820];
      v7 = 0;
      goto LABEL_8;
    case 5:
      v8 = (void *)MEMORY[0x24BE73820];
      v9 = 0;
      goto LABEL_12;
    case 6:
      v8 = (void *)MEMORY[0x24BE73820];
      v9 = 1;
LABEL_12:
      objc_msgSend(v8, "sortDescriptorsForFirstTimeAvailableAscending:", v9);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      objc_msgSend(MEMORY[0x24BE73820], "sortDescriptorsForRecentlyUnfollowed");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = (void *)MEMORY[0x24BE73820];
      v7 = 1;
LABEL_8:
      objc_msgSend(v6, "sortDescriptorsForTitle:", v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

+ (id)sortDescriptorsForManualOrder
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73B48], 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73B50], 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)sortDescriptorsForAllPodcasts
{
  void *v0;
  void *v1;

  +[MTShowsPreferencesDataStore sharedInstance](MTShowsPreferencesDataStore, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortDescriptors");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)sortDescriptorsForLastDatePlayed
{
  void *v0;
  void *v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73B00], 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)sortDescriptorsForRecentlyUpdatedAscending:()NSSortDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73AD8], a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE73B58], 0, sel_localizedStandardCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sortDescriptorsForFirstTimeAvailableAscending:()NSSortDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73B10], a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE73B58], 0, sel_localizedStandardCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sortDescriptorsForDateAddedAscending:()NSSortDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73A90], a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE73B58], 0, sel_localizedStandardCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sortDescriptorsForRecentlyUnfollowed
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE739D0], 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE73B58], 0, sel_localizedStandardCompare_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)sortDescriptorsForTitle:()NSSortDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE73B58], a3, sel_localizedStandardCompare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73B70], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
