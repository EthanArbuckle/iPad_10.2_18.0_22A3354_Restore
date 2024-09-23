@implementation OBSetupAssistantLanguageLocaleController

- (double)headerViewBottomToTableViewHeaderTopPadding
{
  void *v3;
  uint64_t v4;
  double result;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4 < 2)
  {
    +[OBDevice currentDevice](OBDevice, "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "templateType");

    if ((unint64_t)(v7 - 2) > 7)
      v8 = 93.0;
    else
      v8 = dbl_19A01F118[v7 - 2];
    -[OBSetupAssistantLanguageLocaleController bottomPaddingHeight](self, "bottomPaddingHeight");
    return v8 - v9;
  }
  else
  {
    -[OBSetupAssistantLanguageLocaleController headerViewBottomToTableViewTopPaddingForLocalePane](self, "headerViewBottomToTableViewTopPaddingForLocalePane");
  }
  return result;
}

- (double)headerViewBottomToTableViewTopPaddingForLocalePane
{
  void *v2;
  uint64_t v3;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "templateType");

  if ((unint64_t)(v3 - 2) > 7)
    return 47.0;
  else
    return dbl_19A01F158[v3 - 2];
}

- (double)bottomPaddingHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  -[OBWelcomeController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[OBWelcomeController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v10 = v5 - (v8 + v9);

  return v10;
}

@end
