@implementation _TVSplitTemplateController

- (void)updateWithSplitTemplate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  _TVSplitTemplateController *v10;
  double v11;
  void *v12;
  uint64_t v13;
  _TVAppNavigationController_iOS *v14;
  _TVAppNavigationController_iOS *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "displayMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("hidden")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("all")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("overlay")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 0;
  }
  -[_TVSplitTemplateController setPreferredDisplayMode:](self, "setPreferredDisplayMode:", v6);
  objc_msgSend(v4, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_width");
  v9 = v8;

  if (v9 >= 1.0)
  {
    -[_TVSplitTemplateController setMaximumPrimaryColumnWidth:](self, "setMaximumPrimaryColumnWidth:", v9);
    -[_TVSplitTemplateController setMinimumPrimaryColumnWidth:](self, "setMinimumPrimaryColumnWidth:", v9);
    v9 = *MEMORY[0x24BDF7DA8];
  }
  else
  {
    if (v9 >= 0.00000011920929)
    {
      -[_TVSplitTemplateController setMaximumPrimaryColumnWidth:](self, "setMaximumPrimaryColumnWidth:", 1.79769313e308);
      v11 = *MEMORY[0x24BDF7DA8];
      v10 = self;
    }
    else
    {
      v9 = *MEMORY[0x24BDF7DA8];
      -[_TVSplitTemplateController setMaximumPrimaryColumnWidth:](self, "setMaximumPrimaryColumnWidth:", *MEMORY[0x24BDF7DA8]);
      v10 = self;
      v11 = v9;
    }
    -[_TVSplitTemplateController setMinimumPrimaryColumnWidth:](v10, "setMinimumPrimaryColumnWidth:", v11);
  }
  -[_TVSplitTemplateController setPreferredPrimaryColumnWidthFraction:](self, "setPreferredPrimaryColumnWidthFraction:", v9);
  -[_TVSplitTemplateController viewControllers](self, "viewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    v14 = objc_alloc_init(_TVAppNavigationController_iOS);
    v21[0] = v14;
    v15 = objc_alloc_init(_TVAppNavigationController_iOS);
    v21[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[_TVSplitTemplateController setViewControllers:](self, "setViewControllers:", v16);
    objc_msgSend(v4, "leftNavigationDocument");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNavigationController:", v18);

    objc_msgSend(v4, "rightNavigationDocument");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNavigationController:", v20);

  }
}

@end
