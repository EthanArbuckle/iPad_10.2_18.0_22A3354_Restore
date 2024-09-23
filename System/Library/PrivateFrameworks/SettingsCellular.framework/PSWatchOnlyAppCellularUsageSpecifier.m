@implementation PSWatchOnlyAppCellularUsageSpecifier

+ (void)setIconForSpecifier:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a3;
  v6 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  if (v9 <= 2.0)
    v10 = 47;
  else
    v10 = 48;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v11 = (void *)qword_253E97630;
  v25 = qword_253E97630;
  v12 = MEMORY[0x24BDAC760];
  if (!qword_253E97630)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __getNanoResourceGrabberClass_block_invoke;
    v21[3] = &unk_24D96ED28;
    v21[4] = &v22;
    __getNanoResourceGrabberClass_block_invoke((uint64_t)v21);
    v11 = (void *)v23[3];
  }
  v13 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v22, 8);
  objc_msgSend(v13, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __69__PSWatchOnlyAppCellularUsageSpecifier_setIconForSpecifier_bundleID___block_invoke;
  v16[3] = &unk_24D96ECE0;
  v18 = v19;
  v15 = v5;
  v17 = v15;
  objc_msgSend(v14, "getIconForBundleID:iconVariant:block:timeout:", v6, v10, v16, -1.0);

  _Block_object_dispose(v19, 8);
}

void __69__PSWatchOnlyAppCellularUsageSpecifier_setIconForSpecifier_bundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v10 = v3;
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = v3;
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
  }
  else
  {
    +[PSWatchOnlyAppCellularUsageSpecifier getGenericRoundIcon](PSWatchOnlyAppCellularUsageSpecifier, "getGenericRoundIcon");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }

  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", v9, *MEMORY[0x24BE75AC8]);

}

+ (id)getGenericRoundIcon
{
  if (_MergedGlobals_5 != -1)
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_2);
  return (id)qword_253E97628;
}

void __59__PSWatchOnlyAppCellularUsageSpecifier_getGenericRoundIcon__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  objc_class *v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v0 = (void *)qword_253E97640;
  v21 = qword_253E97640;
  if (!qword_253E97640)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __getISIconClass_block_invoke;
    v16 = &unk_24D96ED28;
    v17 = &v18;
    __getISIconClass_block_invoke((uint64_t)&v13);
    v0 = (void *)v19[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v1, "genericApplicationIcon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v3 = (void *)qword_253E97648;
  v21 = qword_253E97648;
  if (!qword_253E97648)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __getISImageDescriptorClass_block_invoke;
    v16 = &unk_24D96ED28;
    v17 = &v18;
    __getISImageDescriptorClass_block_invoke((uint64_t)&v13);
    v3 = (void *)v19[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v18, 8);
  v5 = [v4 alloc];
  ScreenScale();
  v7 = (void *)objc_msgSend(v5, "initWithSize:scale:", 29.0, 29.0, v6);
  objc_msgSend(v7, "setShape:", 2);
  objc_msgSend(v2, "imageForDescriptor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x24BDF6AC8];
    v11 = objc_msgSend(v8, "CGImage");
    objc_msgSend(v9, "scale");
    objc_msgSend(v10, "imageWithCGImage:scale:orientation:", v11, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)qword_253E97628;
  qword_253E97628 = (uint64_t)v8;

}

@end
