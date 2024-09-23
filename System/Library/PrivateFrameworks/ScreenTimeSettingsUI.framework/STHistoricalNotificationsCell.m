@implementation STHistoricalNotificationsCell

- (STHistoricalNotificationsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STHistoricalNotificationsCell *v5;
  uint64_t v6;
  STHistoricalUsageViewController *historicalUsageViewController;
  void *v8;
  void *v9;
  void *v10;
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)STHistoricalNotificationsCell;
  v5 = -[STTableCell initWithStyle:reuseIdentifier:specifier:](&v22, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  +[STHistoricalUsageViewController historicalUsageViewControllerOfType:graphHeight:](STHistoricalUsageViewController, "historicalUsageViewControllerOfType:graphHeight:", 5, 62.0);
  v6 = objc_claimAutoreleasedReturnValue();
  historicalUsageViewController = v5->_historicalUsageViewController;
  v5->_historicalUsageViewController = (STHistoricalUsageViewController *)v6;

  -[STTableCell childViewControllers](v5, "childViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v5->_historicalUsageViewController);

  -[STHistoricalNotificationsCell contentView](v5, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHistoricalUsageViewController view](v5->_historicalUsageViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "addSubview:", v10);
  _NSDictionaryOfVariableBindings(CFSTR("historicalUsageView"), v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[historicalUsageView]-2.0-|"), 0, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  -[STTableCell contentLayoutGuide](v5, "contentLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v17);

  objc_msgSend(v14, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v20);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v13);
  -[STHistoricalUsageViewController addObserver:forKeyPath:options:context:](v5->_historicalUsageViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("currentViewMode"), 3, "KVOContextHistoricalNotificationsCell");
  -[STHistoricalUsageViewController addObserver:forKeyPath:options:context:](v5->_historicalUsageViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("titleView.hasMultilineLayout"), 3, "KVOContextHistoricalNotificationsCell");

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[STHistoricalUsageViewController removeObserver:forKeyPath:context:](self->_historicalUsageViewController, "removeObserver:forKeyPath:context:", self, CFSTR("currentViewMode"), "KVOContextHistoricalNotificationsCell");
  -[STHistoricalUsageViewController removeObserver:forKeyPath:context:](self->_historicalUsageViewController, "removeObserver:forKeyPath:context:", self, CFSTR("titleView.hasMultilineLayout"), "KVOContextHistoricalNotificationsCell");
  v3.receiver = self;
  v3.super_class = (Class)STHistoricalNotificationsCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextHistoricalNotificationsCell")
  {
    -[STHistoricalNotificationsCell historicalUsageViewController](self, "historicalUsageViewController");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("currentViewMode")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {

        v12 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STHistoricalNotificationsCell _currentViewModeDidChangeFrom:to:](self, "_currentViewModeDidChangeFrom:to:", objc_msgSend(v12, "integerValue"), objc_msgSend(v14, "integerValue"));
    }
    else
    {
      -[STHistoricalNotificationsCell historicalUsageViewController](self, "historicalUsageViewController");

      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("titleView.hasMultilineLayout")))
        goto LABEL_16;
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v16)
      {

        v12 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v17)
      {

        v14 = 0;
      }
      -[STHistoricalNotificationsCell _hasMulitlineLayoutDidChangeFrom:to:](self, "_hasMulitlineLayoutDidChangeFrom:to:", objc_msgSend(v12, "BOOLValue"), objc_msgSend(v14, "BOOLValue"));
    }

    goto LABEL_16;
  }
  v18.receiver = self;
  v18.super_class = (Class)STHistoricalNotificationsCell;
  -[STHistoricalNotificationsCell observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_16:

}

- (void)_currentViewModeDidChangeFrom:(int64_t)a3 to:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;

  if (a3 != a4)
  {
    -[STHistoricalNotificationsCell historicalUsageViewController](self, "historicalUsageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "titleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasMultilineLayout");

    -[STHistoricalNotificationsCell _handleEffectiveChangeForViewMode:hasMultilineLayout:](self, "_handleEffectiveChangeForViewMode:hasMultilineLayout:", a4, v8);
  }
}

- (void)_hasMulitlineLayoutDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;

  if (a3 != a4)
  {
    v4 = a4;
    -[STHistoricalNotificationsCell historicalUsageViewController](self, "historicalUsageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "currentViewMode");

    -[STHistoricalNotificationsCell _handleEffectiveChangeForViewMode:hasMultilineLayout:](self, "_handleEffectiveChangeForViewMode:hasMultilineLayout:", v7, v4);
  }
}

- (void)_handleEffectiveChangeForViewMode:(int64_t)a3 hasMultilineLayout:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v4 = a4;
  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SpecifierIdentifierHistoricalNotificationsCell-%lu-%d"), a3, v4);
  v10 = CFSTR("HistoricalNotificationsSpecifierIdentifier");
  v11[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("HistoricalNotificationsSpecifierIdentifierDidChange"), self, v9);

  -[STHistoricalNotificationsCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  objc_msgSend(v7, "postNotificationName:object:", 0x24DB927F0, self);

}

- (id)value
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STHistoricalNotificationsCell;
  -[PSTableCell value](&v3, sel_value);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "conformsToProtocol:", &unk_2550EA810) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STHistoricalNotificationsCell.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(coordinator == nil) || [coordinator conformsToProtocol:@protocol(STUsageDetailsViewModelCoordinator)]"));

  }
  v9.receiver = self;
  v9.super_class = (Class)STHistoricalNotificationsCell;
  -[PSTableCell setValue:](&v9, sel_setValue_, v6);
  -[STHistoricalNotificationsCell historicalUsageViewController](self, "historicalUsageViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCoordinator:", v6);

}

- (STHistoricalUsageViewController)historicalUsageViewController
{
  return (STHistoricalUsageViewController *)objc_getProperty(self, a2, 1232, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalUsageViewController, 0);
}

@end
