@implementation SBSApplicationShortcutSystemIcon(SBHAdditions)

+ (id)sbh_defaultImage
{
  if (sbh_defaultImage_onceToken != -1)
    dispatch_once(&sbh_defaultImage_onceToken, &__block_literal_global_1);
  return (id)sbh_defaultImage___defaultImage;
}

- (id)sbh_systemImage
{
  unint64_t v1;
  unint64_t v2;
  __CFString *v3;

  v1 = objc_msgSend(a1, "type");
  if (v1 > 0x1C)
    return 0;
  v2 = objc_msgSend(*(&off_1E8D85068 + v1), "unsignedIntegerValue");
  if (v2 > 0x1C)
    v3 = 0;
  else
    v3 = off_1E8D85150[v2];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sbh_image
{
  const __CFString *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v1 = CFSTR("ComposeNew");
  switch(objc_msgSend(a1, "type"))
  {
    case 0:
      break;
    case 1:
      v1 = CFSTR("Play");
      break;
    case 2:
      v1 = CFSTR("Pause");
      break;
    case 3:
      v1 = CFSTR("Add");
      break;
    case 4:
      v1 = CFSTR("Location");
      break;
    case 5:
      v1 = CFSTR("Search");
      break;
    case 6:
      v1 = CFSTR("Share");
      break;
    case 7:
      v1 = CFSTR("Prohibit");
      break;
    case 8:
      v1 = CFSTR("Contact");
      break;
    case 9:
      v1 = CFSTR("Home");
      break;
    case 10:
      v1 = CFSTR("MarkLocation");
      break;
    case 11:
      v1 = CFSTR("Favorite");
      break;
    case 12:
      v1 = CFSTR("Love");
      break;
    case 13:
      v1 = CFSTR("Cloud");
      break;
    case 14:
      v1 = CFSTR("Invitation");
      break;
    case 15:
      v1 = CFSTR("Confirmation");
      break;
    case 16:
      v1 = CFSTR("Mail");
      break;
    case 17:
      v1 = CFSTR("Message");
      break;
    case 18:
      v1 = CFSTR("Date");
      break;
    case 19:
      v1 = CFSTR("Time");
      break;
    case 20:
      v1 = CFSTR("CapturePhoto");
      break;
    case 21:
      v1 = CFSTR("CaptureVideo");
      break;
    case 22:
      v1 = CFSTR("Task");
      break;
    case 23:
      v1 = CFSTR("TaskCompleted");
      break;
    case 24:
      v1 = CFSTR("Alarm");
      break;
    case 25:
      v1 = CFSTR("Bookmark");
      break;
    case 26:
      v1 = CFSTR("Shuffle");
      break;
    case 27:
      v1 = CFSTR("Audio");
      break;
    case 28:
      v1 = CFSTR("Update");
      break;
    case 29:
      v1 = CFSTR("rectangle.grid.2x2");
      break;
    case 30:
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "userInterfaceIdiom");

      if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v1 = CFSTR("apps.ipad.landscape");
      else
        v1 = CFSTR("apps.iphone");
      break;
    case 31:
      v1 = CFSTR("trash");
      break;
    case 32:
      v1 = CFSTR("minus.circle");
      break;
    case 33:
      v1 = CFSTR("text.insert");
      break;
    default:
      v1 = CFSTR("UnreadDot");
      break;
  }
  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBSApplicationShortcutSystemIcon_%@"), v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBHBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v8 = (void *)MEMORY[0x1E0DC3870];
        SBHBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", v1, v9, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          v10 = (void *)MEMORY[0x1E0DC3870];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBSApplicationShortcutSystemIcon_%@"), CFSTR("UnreadDot"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          SBHBundle();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "imageNamed:inBundle:compatibleWithTraitCollection:", v11, v12, 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }
  return v7;
}

@end
