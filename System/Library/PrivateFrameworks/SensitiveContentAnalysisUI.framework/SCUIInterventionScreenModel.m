@implementation SCUIInterventionScreenModel

+ (id)modelForScreen:(int64_t)a3 workflow:(int64_t)a4 type:(int64_t)a5
{
  return (id)objc_msgSend(a1, "modelForScreen:workflow:type:options:", a3, a4, a5, 0);
}

+ (id)modelForScreen:(int64_t)a3 workflow:(int64_t)a4 type:(int64_t)a5 options:(int64_t)a6
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v11 = (void *)objc_opt_new();
  objc_msgSend(a1, "titleForScreen:workflow:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v12);

  objc_msgSend(a1, "imageNameForScreen:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImageName:", v13);

  objc_msgSend(a1, "emojiForScreen:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEmoji:", v14);

  objc_msgSend(a1, "bulletsForScreen:workflow:type:", a3, a4, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBullets:", v15);

  objc_msgSend(a1, "actionsForScreen:workflow:type:options:", a3, a4, a5, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActions:", v16);

  objc_msgSend(v11, "setOptions:", a6);
  return v11;
}

+ (id)titleForScreen:(int64_t)a3 workflow:(int64_t)a4
{
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  if (a3 == 1)
  {
    v4 = CFSTR("RECEIVE_SECOND_EDU_SCREEN_TITLE");
    v5 = CFSTR("SEND_SECOND_EDU_SCREEN_TITLE");
  }
  else
  {
    if (a3)
      return a1;
    v4 = CFSTR("RECEIVE_FIRST_EDU_SCREEN_TITLE");
    v5 = CFSTR("SEND_FIRST_EDU_SCREEN_TITLE");
  }
  if (a4 == 1)
    v6 = v5;
  else
    v6 = v4;
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v6);
  a1 = (id)objc_claimAutoreleasedReturnValue();
  return a1;
}

+ (id)imageNameForScreen:(int64_t)a3
{
  if (a3)
    return CFSTR("header-monocle");
  else
    return CFSTR("header-thinking");
}

+ (id)emojiForScreen:(int64_t)a3
{
  if (a3)
    return CFSTR("🧐");
  else
    return CFSTR("🤔");
}

+ (id)bulletsForScreen:(int64_t)a3 workflow:(int64_t)a4 type:(int64_t)a5
{
  void *v5;
  uint64_t v6;

  if (a3 == 1)
  {
    if (a5 == 1)
    {
      objc_msgSend(a1, "bulletsForScreenTwoOver13:", a4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (!a5)
    {
      objc_msgSend(a1, "bulletsForScreenTwoUnder13:", a4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    return MEMORY[0x24BDBD1A8];
  }
  if (!a3)
  {
    if (a5 == 1)
    {
      objc_msgSend(a1, "bulletsForScreenOneOver13:", a4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (!a5)
    {
      objc_msgSend(a1, "bulletsForScreenOneUnder13:", a4);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v5 = (void *)v6;
      return v5;
    }
    return MEMORY[0x24BDBD1A8];
  }
  return v5;
}

+ (id)bulletsForScreenOneUnder13:(int64_t)a3
{
  BOOL v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3 == 1;
  if (a3 == 1)
    v4 = CFSTR("SEND_FIRST_EDU_SCREEN_POINT_1");
  else
    v4 = CFSTR("RECEIVE_FIRST_EDU_SCREEN_POINT_1");
  if (v3)
    v5 = CFSTR("SEND_FIRST_EDU_SCREEN_POINT_2");
  else
    v5 = CFSTR("RECEIVE_FIRST_EDU_SCREEN_POINT_2");
  if (v3)
    v6 = CFSTR("SEND_FIRST_EDU_SCREEN_POINT_3");
  else
    v6 = CFSTR("RECEIVE_FIRST_EDU_SCREEN_POINT_3");
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenBullet bullet:imageName:emoji:](SCUIInterventionScreenBullet, "bullet:imageName:emoji:", v7, CFSTR("bullet-bathing-suit"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenBullet bullet:imageName:emoji:](SCUIInterventionScreenBullet, "bullet:imageName:emoji:", v9, CFSTR("bullet-sad"), CFSTR("😔"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenBullet bullet:imageName:emoji:](SCUIInterventionScreenBullet, "bullet:imageName:emoji:", v11, CFSTR("bullet-window-shocked"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)bulletsForScreenOneOver13:(int64_t)a3
{
  BOOL v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3 == 1;
  if (a3 == 1)
    v4 = CFSTR("SEND_FIRST_EDU_SCREEN_POINT_1_OVER_13");
  else
    v4 = CFSTR("RECEIVE_FIRST_EDU_SCREEN_POINT_1_OVER_13");
  if (v3)
    v5 = CFSTR("SEND_FIRST_EDU_SCREEN_POINT_2_OVER_13");
  else
    v5 = CFSTR("RECEIVE_FIRST_EDU_SCREEN_POINT_2_OVER_13");
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenBullet bullet:imageName:emoji:](SCUIInterventionScreenBullet, "bullet:imageName:emoji:", v6, CFSTR("bullet-monkey-hiding"), CFSTR("🙈"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenBullet bullet:imageName:emoji:](SCUIInterventionScreenBullet, "bullet:imageName:emoji:", v8, CFSTR("bullet-window-shocked"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)bulletsForScreenTwoUnder13:(int64_t)a3
{
  BOOL v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3 == 1;
  if (a3 == 1)
    v4 = CFSTR("SEND_SECOND_EDU_SCREEN_POINT_1");
  else
    v4 = CFSTR("RECEIVE_SECOND_EDU_SCREEN_POINT_1");
  if (v3)
    v5 = CFSTR("SEND_SECOND_EDU_SCREEN_POINT_2");
  else
    v5 = CFSTR("RECEIVE_SECOND_EDU_SCREEN_POINT_2");
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenBullet bullet:imageName:emoji:](SCUIInterventionScreenBullet, "bullet:imageName:emoji:", v6, CFSTR("bullet-family"), CFSTR("👨‍👩‍👧‍👦"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenBullet bullet:imageName:emoji:](SCUIInterventionScreenBullet, "bullet:imageName:emoji:", v8, CFSTR("bullet-teacher"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (+[SCUIScreenTimePasscodeController willScreenTimePasscodeBeRequiredFor:](SCUIScreenTimePasscodeController, "willScreenTimePasscodeBeRequiredFor:", 0))
  {
    +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", CFSTR("SEND_SECOND_EDU_SCREEN_POINT_3"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCUIInterventionScreenBullet bullet:imageName:emoji:](SCUIInterventionScreenBullet, "bullet:imageName:emoji:", v12, CFSTR("bullet-lock"), CFSTR("🔒"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

  }
  return v11;
}

+ (id)bulletsForScreenTwoOver13:(int64_t)a3
{
  BOOL v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3 == 1;
  if (a3 == 1)
    v4 = CFSTR("SEND_SECOND_EDU_SCREEN_POINT_1_OVER_13");
  else
    v4 = CFSTR("RECEIVE_SECOND_EDU_SCREEN_POINT_1_OVER_13");
  if (v3)
    v5 = CFSTR("SEND_SECOND_EDU_SCREEN_POINT_2_OVER_13");
  else
    v5 = CFSTR("RECEIVE_SECOND_EDU_SCREEN_POINT_2_OVER_13");
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenBullet bullet:imageName:emoji:](SCUIInterventionScreenBullet, "bullet:imageName:emoji:", v6, CFSTR("bullet-dancers"), CFSTR("👯"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenBullet bullet:imageName:emoji:](SCUIInterventionScreenBullet, "bullet:imageName:emoji:", v8, CFSTR("bullet-monkey-covering-mouth"), CFSTR("🙊"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)actionsForScreen:(int64_t)a3 workflow:(int64_t)a4 type:(int64_t)a5 options:(int64_t)a6
{
  const char *v6;

  if (a3 == 1)
  {
    objc_msgSend(a1, "actionsForScreenTwo:type:", a4, a5);
    v6 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_msgSend(a1, "actionsForScreenOne:type:options:", a4, a5, a6);
    v6 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v6;
  }
  return (id)(id)a2;
}

+ (id)actionsForScreenOne:(int64_t)a3 type:(int64_t)a4 options:(int64_t)a5
{
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[4];

  v5 = a5;
  v15[3] = *MEMORY[0x24BDAC8D0];
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", CFSTR("NOT_NOW"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenAction action:primary:actionID:](SCUIInterventionScreenAction, "action:primary:actionID:", v6, 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", CFSTR("IM_SURE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenAction action:primary:actionID:](SCUIInterventionScreenAction, "action:primary:actionID:", v8, 0, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v5 & 1) != 0)
  {
    +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", CFSTR("MORE_HELP"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCUIInterventionScreenAction action:primary:actionID:](SCUIInterventionScreenAction, "action:primary:actionID:", v11, 0, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = v7;
    v15[1] = v12;
    v15[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14[0] = v7;
    v14[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)actionsForScreenTwo:(int64_t)a3 type:(int64_t)a4
{
  BOOL v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3 == 1;
  if (a3 == 1)
    v6 = CFSTR("CANCEL_TEXT");
  else
    v6 = CFSTR("DONT_VIEW_PHOTO_EDU");
  if (v5)
    v7 = CFSTR("CONTINUE_TEXT");
  else
    v7 = CFSTR("VIEW_PHOTO_EDU");
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenAction action:primary:actionID:](SCUIInterventionScreenAction, "action:primary:actionID:", v8, 1, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    v10 = CFSTR("MESSAGE_SOMEONE");
  else
    v10 = CFSTR("MESSAGE_GROWNUP");
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenAction action:primary:actionID:](SCUIInterventionScreenAction, "action:primary:actionID:", v11, 0, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIInterventionScreenAction action:primary:actionID:](SCUIInterventionScreenAction, "action:primary:actionID:", v13, 0, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v9;
  v17[1] = v12;
  v17[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)emoji
{
  return self->_emoji;
}

- (void)setEmoji:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)bullets
{
  return self->_bullets;
}

- (void)setBullets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_bullets, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
