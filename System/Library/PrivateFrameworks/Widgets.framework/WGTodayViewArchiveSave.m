@implementation WGTodayViewArchiveSave

void __WGTodayViewArchiveSave_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(CFSTR("~/Library/SpringBoard/TodayViewArchive.plist"), "stringByExpandingTildeInPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("Known"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("Known"));

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("Penalized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("Penalized"));

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("FavoriteGroup"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v11, CFSTR("FavoriteGroup"));
  v12 = objc_msgSend(*(id *)(a1 + 32), "writeToFile:atomically:", v2, 1);
  if ((_DWORD)v12)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BDD0CF0];
    v17[0] = *MEMORY[0x24BDD0CF8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAttributes:ofItemAtPath:error:", v14, v2, 0);

  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, v12);

}

@end
