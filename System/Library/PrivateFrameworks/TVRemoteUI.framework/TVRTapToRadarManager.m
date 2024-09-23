@implementation TVRTapToRadarManager

+ (id)bugImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("radarBug"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)fileRadarWithTitle:(id)a3 description:(id)a4 window:(id)a5
{
  id v7;
  id v8;
  TVRTapToRadarManager *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  id v22;
  void *v23;
  objc_class *v24;
  id v25;
  void *v26;
  objc_class *v27;
  id v28;
  void *v29;
  id v30;

  v30 = a3;
  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(TVRTapToRadarManager);
  v10 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v10, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v10, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("ComponentName"), CFSTR("Apple TV"));
  objc_msgSend(v11, "addObject:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("New Bugs"));
  objc_msgSend(v11, "addObject:", v13);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("ComponentID"), CFSTR("250465"));
  objc_msgSend(v11, "addObject:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("phone"));
  objc_msgSend(v11, "addObject:", v15);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug"));
  objc_msgSend(v11, "addObject:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("Not Applicable"));
  objc_msgSend(v11, "addObject:", v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("DeviceClasses"), CFSTR("AppleTV"));
  objc_msgSend(v11, "addObject:", v18);

  objc_msgSend((id)objc_opt_class(), "_captureScreenshotForWindow:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "relativePath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "length"))
  {
    v21 = (objc_class *)MEMORY[0x24BDD1838];
    v22 = v20;
    v23 = (void *)objc_msgSend([v21 alloc], "initWithName:value:", CFSTR("Screenshot"), v22);

    objc_msgSend(v11, "addObject:", v23);
  }
  if (objc_msgSend(v30, "length"))
  {
    v24 = (objc_class *)MEMORY[0x24BDD1838];
    v25 = v30;
    v26 = (void *)objc_msgSend([v24 alloc], "initWithName:value:", CFSTR("Title"), v25);

    objc_msgSend(v11, "addObject:", v26);
  }
  if (objc_msgSend(v7, "length"))
  {
    v27 = (objc_class *)MEMORY[0x24BDD1838];
    v28 = v7;
    v29 = (void *)objc_msgSend([v27 alloc], "initWithName:value:", CFSTR("Description"), v28);

    objc_msgSend(v11, "addObject:", v29);
  }
  objc_msgSend(v10, "setQueryItems:", v11);
  -[TVRTapToRadarManager setUrlComponents:](v9, "setUrlComponents:", v10);
  -[TVRTapToRadarManager fileRadar](v9, "fileRadar");

}

- (void)fileRadar
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (+[TVRUIFeatures isTapToRadarEnabled](TVRUIFeatures, "isTapToRadarEnabled"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDC15A0]);
    v8 = *MEMORY[0x24BE38310];
    v9[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFrontBoardOptions:", v4);

    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRTapToRadarManager urlComponents](self, "urlComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openURL:configuration:completionHandler:", v7, v3, &__block_literal_global_2);

  }
}

+ (id)_captureScreenshotForWindow:(id)a3
{
  id v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BEBD618]);
  objc_msgSend(v3, "bounds");
  v7 = (void *)objc_msgSend(v4, "initWithSize:", v5, v6);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __52__TVRTapToRadarManager__captureScreenshotForWindow___block_invoke;
  v20[3] = &unk_24DE2C5F8;
  v8 = v3;
  v21 = v8;
  v9 = v7;
  v22 = v9;
  objc_msgSend(v9, "PNGDataWithActions:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v11, "setDateFormat:", CFSTR("yyyy-MM-dd-HH:mm:ss"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TVRemote-TTR-Screenshot-%@.png"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathComponent:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "writeToURL:atomically:", v17, 1) & 1) == 0)
  {
    objc_msgSend(v17, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Failed to write screenshot to file: %@"), v18);

    v17 = 0;
  }

  return v17;
}

void __52__TVRTapToRadarManager__captureScreenshotForWindow___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "format");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 1);

}

- (NSURLComponents)urlComponents
{
  return self->_urlComponents;
}

- (void)setUrlComponents:(id)a3
{
  objc_storeStrong((id *)&self->_urlComponents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlComponents, 0);
}

@end
