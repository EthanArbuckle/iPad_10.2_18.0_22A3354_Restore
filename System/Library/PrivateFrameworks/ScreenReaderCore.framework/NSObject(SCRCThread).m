@implementation NSObject(SCRCThread)

- (NSString)threadDescription
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

+ (uint64_t)performSelector:()SCRCThread withThreadKey:count:objects:
{
  return +[SCRCThread _performSelector:withThreadKey:onTarget:waitTime:cancelMask:count:firstObject:moreObjects:](SCRCThread, "_performSelector:withThreadKey:onTarget:waitTime:cancelMask:count:firstObject:moreObjects:", a3, a4, a1, 0, a5, a6, -1.0, &a9, &a9);
}

+ (uint64_t)performSelector:()SCRCThread withThreadKey:waitTime:cancelMask:count:objects:
{
  return +[SCRCThread _performSelector:withThreadKey:onTarget:waitTime:cancelMask:count:firstObject:moreObjects:](SCRCThread, "_performSelector:withThreadKey:onTarget:waitTime:cancelMask:count:firstObject:moreObjects:", a3, a4, a1, a5, a6, a7, &a9, &a9);
}

- (uint64_t)performSelector:()SCRCThread withThreadKey:count:objects:
{
  return +[SCRCThread _performSelector:withThreadKey:onTarget:waitTime:cancelMask:count:firstObject:moreObjects:](SCRCThread, "_performSelector:withThreadKey:onTarget:waitTime:cancelMask:count:firstObject:moreObjects:", a3, a4, a1, 0, a5, a6, -1.0, &a9, &a9);
}

- (uint64_t)performSelector:()SCRCThread withThreadKey:waitTime:cancelMask:count:objects:
{
  return +[SCRCThread _performSelector:withThreadKey:onTarget:waitTime:cancelMask:count:firstObject:moreObjects:](SCRCThread, "_performSelector:withThreadKey:onTarget:waitTime:cancelMask:count:firstObject:moreObjects:", a3, a4, a1, a5, a6, a7, &a9, &a9);
}

- (char)performSelector:()SCRCThread withObjectsAsArray:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    switch(objc_msgSend(v6, "count"))
    {
      case 0:
        objc_msgSend(a1, a3);
        a3 = (char *)objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        objc_msgSend(v7, "objectAtIndex:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, a3, v8);
        a3 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 2:
        objc_msgSend(v7, "objectAtIndex:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, a3, v8, v9);
        a3 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 3:
        objc_msgSend(v7, "objectAtIndex:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, a3, v8, v9, v10);
        a3 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 4:
        objc_msgSend(v7, "objectAtIndex:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, a3, v8, v9, v10, v11);
        a3 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 5:
        objc_msgSend(v7, "objectAtIndex:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, a3, v8, v9, v10, v11, v12);
        a3 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 6:
        objc_msgSend(v7, "objectAtIndex:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, a3, v8, v9, v10, v11, v12, v13);
        a3 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 7:
        objc_msgSend(v7, "objectAtIndex:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, a3, v8, v9, v10, v11, v12, v13, v14);
        a3 = (char *)objc_claimAutoreleasedReturnValue();

LABEL_13:
LABEL_14:

LABEL_15:
LABEL_16:

LABEL_17:
LABEL_18:

        break;
      default:
        a3 = 0;
        break;
    }
  }

  return a3;
}

- (void)_scr_safeGetValueForSelector:()SCRCThread lock:
{
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  SEL v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_msgSend(v6, "lock");
  objc_msgSend(v15, "objectForKey:", CFSTR("selector"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("copy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("objects"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");
  v10 = NSSelectorFromString(v7);
  v11 = objc_msgSend(v8, "BOOLValue");
  objc_msgSend(a1, "performSelector:withObjectsAsArray:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    if (v11)
    {
      v14 = objc_msgSend(v12, "copy");

      v13 = (void *)v14;
    }
    objc_msgSend(v6, "lock");
    objc_msgSend(v15, "setObject:forKey:", v13, CFSTR("result"));
    objc_msgSend(v6, "unlock");

  }
}

- (void)_scr_safeGetValueForBlock:()SCRCThread lock:
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v5, "lock");
  objc_msgSend(v8, "objectForKey:", CFSTR("block"));
  v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");
  if (v6)
  {
    v6[2](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "lock");
      objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("result"));
      objc_msgSend(v5, "unlock");
    }

  }
}

- (void)_scr_safeGetValueForKeyPath:()SCRCThread lock:
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v6, "lock");
  objc_msgSend(v13, "objectForKey:", CFSTR("keypath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("copy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v6, "unlock");
  objc_msgSend(a1, "valueForKeyPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    if (v9)
    {
      v12 = objc_msgSend(v10, "copy");

      v11 = (void *)v12;
    }
    objc_msgSend(v6, "lock");
    objc_msgSend(v13, "setObject:forKey:", v11, CFSTR("result"));
    objc_msgSend(v6, "unlock");

  }
}

- (uint64_t)_scr_safeGetValueForKeyPath:()SCRCThread
{
  return objc_msgSend(a1, "_scr_safeGetValueForKeyPath:lock:", a3, 0);
}

- (void)_scr_safePerformBlock:()SCRCThread lock:
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "lock");
  objc_msgSend(v6, "objectForKey:", CFSTR("block"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "unlock");
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }

}

- (uint64_t)_getRetainedValueForKeyPathOnMainThread:()SCRCThread copy:
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = (objc_class *)MEMORY[0x24BDBCED8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", 2);
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("keypath"));

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("copy"));

  }
  objc_msgSend(a1, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__scr_safeGetValueForKeyPath_, v8, 1);
  objc_msgSend(v8, "objectForKey:", CFSTR("result"));
  v10 = objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)valueForKeyPathOnMainThread:()SCRCThread
{
  return (id)objc_msgSend(a1, "_getRetainedValueForKeyPathOnMainThread:copy:", a3, 0);
}

- (uint64_t)copyValueForKeyPathOnMainThread:()SCRCThread
{
  return objc_msgSend(a1, "_getRetainedValueForKeyPathOnMainThread:copy:", a3, 1);
}

- (uint64_t)_getRetainedValueForKeyPath:()SCRCThread forThreadKey:waitTime:copy:
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v10 = a5;
  v11 = (objc_class *)MEMORY[0x24BDD1648];
  v12 = a4;
  v13 = objc_alloc_init(v11);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  objc_msgSend(v14, "setObject:forKey:", v12, CFSTR("keypath"));

  if (a6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("copy"));

  }
  objc_msgSend(a1, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", sel__scr_safeGetValueForKeyPath_lock_, v10, 0, 2, v14, a2, v13);
  objc_msgSend(v13, "lock");
  objc_msgSend(v14, "objectForKey:", CFSTR("result"));
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unlock");

  return v16;
}

- (uint64_t)valueForKeyPath:()SCRCThread forThreadKey:
{
  return objc_msgSend(a1, "valueForKeyPath:forThreadKey:waitTime:", 0.5);
}

- (id)valueForKeyPath:()SCRCThread forThreadKey:waitTime:
{
  return (id)objc_msgSend(a1, "_getRetainedValueForKeyPath:forThreadKey:waitTime:copy:", a3, a4, 0);
}

- (uint64_t)copyValueForKeyPath:()SCRCThread forThreadKey:
{
  return objc_msgSend(a1, "copyValueForKeyPath:forThreadKey:waitTime:", 0.5);
}

- (uint64_t)copyValueForKeyPath:()SCRCThread forThreadKey:waitTime:
{
  return objc_msgSend(a1, "_getRetainedValueForKeyPath:forThreadKey:waitTime:copy:", a3, a4, 1);
}

- (id)valueForSelector:()SCRCThread forThreadKey:waitTime:copyValue:withObjects:
{
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id *v29;

  v15 = a5;
  v16 = a7;
  v17 = objc_alloc_init(MEMORY[0x24BDD1648]);
  NSStringFromSelector(a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = (id *)&a10;
  v20 = v16;
  v21 = v20;
  if (v20)
  {
    v22 = v20;
    do
    {
      objc_msgSend(v19, "addObject:", v22);
      v23 = v29++;
      v24 = *v23;

      v22 = v24;
    }
    while (v24);
  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  objc_msgSend(v25, "setObject:forKey:", v18, CFSTR("selector"));
  objc_msgSend(v25, "setObject:forKey:", v19, CFSTR("objects"));
  if (a6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v26, CFSTR("copy"));

  }
  objc_msgSend(a1, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", sel__scr_safeGetValueForSelector_lock_, v15, 0, 2, v25, a2, v17);
  objc_msgSend(v17, "lock");
  objc_msgSend(v25, "objectForKey:", CFSTR("result"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unlock");

  return v27;
}

- (id)valueForBlock:()SCRCThread forThreadKey:waitTime:
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = (objc_class *)MEMORY[0x24BDD1648];
  v9 = a5;
  v10 = a4;
  v11 = objc_alloc_init(v8);
  v12 = (void *)objc_msgSend(v10, "copy");

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  v14 = (void *)MEMORY[0x212BD44B0](v12);
  objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("block"));

  objc_msgSend(a1, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", sel__scr_safeGetValueForBlock_lock_, v9, 0, 2, v13, a2, v11);
  objc_msgSend(v11, "lock");
  objc_msgSend(v13, "objectForKey:", CFSTR("result"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", CFSTR("block"));
  objc_msgSend(v11, "unlock");

  return v15;
}

- (void)performAsyncBlock:()SCRCThread forThreadKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v11 = (id)objc_opt_new();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  v10 = (void *)MEMORY[0x212BD44B0](v8);
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("block"));

  objc_msgSend(a1, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", sel__scr_safePerformBlock_lock_, v6, 0, 2, v9, -1.0, v11);
  objc_msgSend(v11, "lock");
  objc_msgSend(v11, "unlock");

}

@end
