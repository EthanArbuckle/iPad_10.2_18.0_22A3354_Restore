@implementation SRCompactViewControllerContentTester

- (BOOL)hasContentForState:(id)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  NSObject *v7;
  char v8;
  int v9;
  _BOOL4 v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "keyboardHasContent"))
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
      v5 = "%s #compact:Returning YES because the keyboard has content";
LABEL_29:
      _os_log_impl(&dword_21C485000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v12, 0xCu);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  if (objc_msgSend(v3, "navigationStackIsPopping")
    && ((objc_msgSend(v3, "deviceIsPad") & 1) != 0 || objc_msgSend(v3, "navigationBarHasContent")))
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
      v5 = "%s #compact:Returning YES because snippet is being popped from the view stack";
      goto LABEL_29;
    }
LABEL_30:
    v8 = 1;
    goto LABEL_31;
  }
  if (objc_msgSend(v3, "navigationStackSize") < 2)
  {
    if (objc_msgSend(v3, "editableUtteranceViewHasContent"))
    {
      v4 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315138;
        v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        v5 = "%s #compact:Returning YES because point is in tap2edit view";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    if (objc_msgSend(v3, "compactViewHasContent"))
    {
      v4 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315138;
        v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        v5 = "%s #compact:Returning YES because point is in Compact View";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    if (objc_msgSend(v3, "siriViewControllerIsEditing"))
    {
      v4 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315138;
        v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        v5 = "%s #compact:Returning YES because a siri view controller is editing";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    v9 = objc_msgSend(v3, "contextMenuIsPresented");
    v4 = *MEMORY[0x24BE08FB0];
    v10 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v10)
      {
        v12 = 136315138;
        v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        v5 = "%s #compact:Returning YES because a UIContextMenu is currently present";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    if (v10)
    {
      v12 = 136315138;
      v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
      _os_log_impl(&dword_21C485000, v4, OS_LOG_TYPE_DEFAULT, "%s #compact:Returning NO because point is outside Siri content", (uint8_t *)&v12, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    if ((objc_msgSend(v3, "deviceIsPad") & 1) == 0 && objc_msgSend(v3, "navigationBarHasContent"))
    {
      v4 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315138;
        v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        v5 = "%s #compact:Returning YES because point is in the navigation bar for multilevel content in phone";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    v6 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v12 = 136315394;
      v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
      v14 = 1024;
      v15 = objc_msgSend(v3, "multiLevelViewHasContent");
      _os_log_impl(&dword_21C485000, v7, OS_LOG_TYPE_DEFAULT, "%s #compact:Returning %d because pointis in multi level card", (uint8_t *)&v12, 0x12u);

    }
    v8 = objc_msgSend(v3, "multiLevelViewHasContent");
  }
LABEL_31:

  return v8;
}

@end
