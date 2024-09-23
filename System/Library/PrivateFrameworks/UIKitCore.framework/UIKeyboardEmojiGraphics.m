@implementation UIKeyboardEmojiGraphics

- (UIKeyboardEmojiGraphics)init
{
  UIKeyboardEmojiGraphics *v2;
  UIKeyboardEmojiGraphics *v3;
  UIKeyboardEmojiGraphics *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardEmojiGraphics;
  v2 = -[UIKeyboardEmojiGraphics init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (id)sharedInstance
{
  void *v2;
  UIKeyboardEmojiGraphics *v3;
  void *v4;

  v2 = (void *)gSharedEmojiGraphics;
  if (!gSharedEmojiGraphics)
  {
    v3 = objc_alloc_init(UIKeyboardEmojiGraphics);
    v4 = (void *)gSharedEmojiGraphics;
    gSharedEmojiGraphics = (uint64_t)v3;

    v2 = (void *)gSharedEmojiGraphics;
  }
  return v2;
}

+ (id)emojiFontAttributesForPortrait:(BOOL)a3
{
  _BOOL8 v3;
  CGFloat v5;
  CTFontRef v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;

  v3 = a3;
  +[UIKeyboardEmojiGraphics emojiSize:](UIKeyboardEmojiGraphics, "emojiSize:", 1);
  v6 = CTFontCreateWithName(CFSTR("AppleColorEmoji"), v5, 0);
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = *MEMORY[0x1E0CA8188];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "padding:", v3);
  *(float *)&v10 = v10;
  objc_msgSend(v9, "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v6, v8, v11, *MEMORY[0x1E0CA8588], 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  CFRelease(v6);
  return v12;
}

+ (id)emojiFontAttributes
{
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  void *v6;

  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)(objc_msgSend(v3, "interfaceOrientation") - 5) < 0xFFFFFFFFFFFFFFFELL;

  objc_msgSend(a1, "emojiFontAttributesForPortrait:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)emojiFontAttributes_attributes;
  emojiFontAttributes_attributes = v5;

  return (id)emojiFontAttributes_attributes;
}

+ (BOOL)isWildcatKeyboard
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
  else
    return 0;
}

+ (CGSize)emojiSize:(BOOL)a3
{
  int v3;
  double v4;
  double v5;
  CGSize result;

  v3 = objc_msgSend(a1, "isWildcatKeyboard", a3);
  v4 = 32.0;
  if (v3)
    v4 = 48.0;
  v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (unsigned)rowCount:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
    return 3;
  if (objc_msgSend(a1, "isWildcatKeyboard", v3, v4))
    return 3;
  return 2;
}

+ (unsigned)colCount:(BOOL)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if ((objc_msgSend(a1, "isWildcatKeyboard", a3) & 1) != 0)
    return 11;
  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
    v5 = v4;
  }
  else
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v5 = v8;

  }
  v9 = 50.0;
  if (v5 < 480.0)
    v9 = 45.0;
  return llround(v5 / v9);
}

+ (CGPoint)margin:(BOOL)a3
{
  _BOOL8 v3;
  double v4;
  double v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  double v10;
  CGPoint result;

  v3 = a3;
  if (objc_msgSend(a1, "isWildcatKeyboard"))
  {
    if (v3)
      v4 = 20.0;
    else
      v4 = 41.0;
    v5 = 33.0;
    if (v3)
      v5 = 20.0;
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_class(), "colCount:", v3);
    v4 = 22.0;
    v5 = 16.0;
    if (v6 <= 0xE)
    {
      v7 = objc_msgSend((id)objc_opt_class(), "colCount:", v3);
      v5 = 29.0;
      if (v7 <= 0xC)
      {
        v4 = 20.0;
        if (objc_msgSend((id)objc_opt_class(), "colCount:", v3) <= 0xA)
        {
          v8 = objc_msgSend((id)objc_opt_class(), "colCount:", v3);
          v5 = 7.5;
          if (v8 <= 9)
          {
            if (objc_msgSend((id)objc_opt_class(), "colCount:", v3) <= 8)
            {
              v9 = objc_msgSend((id)objc_opt_class(), "colCount:", v3);
              if (v9 <= 7)
                v4 = 20.0;
              else
                v4 = 24.5;
              v5 = 8.5;
              if (v9 > 7)
                v5 = 13.5;
            }
            else
            {
              v4 = 28.0;
              v5 = 11.0;
            }
          }
        }
        else
        {
          v5 = 27.5;
        }
      }
    }
  }
  v10 = v4;
  result.y = v10;
  result.x = v5;
  return result;
}

+ (double)recentLableVerticalPadding:(BOOL)a3
{
  _BOOL8 v3;
  char v4;
  double result;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;

  v3 = a3;
  v4 = objc_msgSend(a1, "isWildcatKeyboard");
  result = 0.0;
  if ((v4 & 1) == 0)
  {
    if (objc_msgSend((id)objc_opt_class(), "colCount:", v3) > 0xE)
      return 1.0;
    v6 = objc_msgSend((id)objc_opt_class(), "colCount:", v3);
    result = 2.0;
    if (v6 > 0xC)
      return result;
    if (objc_msgSend((id)objc_opt_class(), "colCount:", v3) <= 0xA)
    {
      v7 = objc_msgSend((id)objc_opt_class(), "colCount:", v3);
      result = 1.0;
      if (v7 <= 9)
      {
        v8 = objc_msgSend((id)objc_opt_class(), "colCount:", v3);
        result = 5.0;
        if (v8 <= 8)
        {
          v9 = objc_msgSend((id)objc_opt_class(), "colCount:", v3);
          result = 1.0;
          if (v9 > 7)
            return 4.0;
        }
      }
    }
    else
    {
      return 1.0;
    }
  }
  return result;
}

+ (CGPoint)padding:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v3 = a3;
  v4 = objc_msgSend(a1, "isWildcatKeyboard");
  v5 = 9.0;
  if (!v3)
    v5 = 28.0;
  v6 = 43.0;
  if (v3)
    v6 = 20.0;
  v7 = 19.0;
  v8 = 13.0;
  if (v3)
    v7 = 13.0;
  else
    v8 = 16.0;
  if (!v4)
  {
    v6 = v8;
    v5 = v7;
  }
  result.y = v5;
  result.x = v6;
  return result;
}

+ (double)optionalDescriptionPadding:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  double result;

  v3 = a3;
  v4 = objc_msgSend(a1, "isWildcatKeyboard");
  result = 24.0;
  if (v3)
    result = 8.0;
  if (!v4)
    return 9.0;
  return result;
}

+ (double)emojiPageControlYOffset:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  double result;

  v3 = a3;
  v4 = objc_msgSend(a1, "isWildcatKeyboard");
  result = 8.0;
  if (v3)
    result = 4.0;
  if (!v4)
    return 4.0;
  return result;
}

+ (id)emojiCategoryImagePath:(id)a3 forRenderConfig:(id)a4
{
  id v5;
  int v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v10;
  const __CFString *v11;

  v5 = a3;
  v6 = objc_msgSend(a4, "lightKeyboard");
  v7 = objc_msgSend(v5, "categoryType");

  v8 = 0;
  switch(v7)
  {
    case 0:
      return CFSTR("emoji_recents.png");
    case 1:
      v10 = CFSTR("emoji_people_dark.png");
      v11 = CFSTR("emoji_people.png");
      goto LABEL_12;
    case 2:
      v10 = CFSTR("emoji_nature_dark.png");
      v11 = CFSTR("emoji_nature.png");
      goto LABEL_12;
    case 3:
      v10 = CFSTR("emoji_food-and-drink_dark.png");
      v11 = CFSTR("emoji_food-and-drink.png");
      goto LABEL_12;
    case 4:
      return CFSTR("emoji_celebration.png");
    case 5:
      v10 = CFSTR("emoji_activity_dark.png");
      v11 = CFSTR("emoji_activity.png");
      goto LABEL_12;
    case 6:
      v10 = CFSTR("emoji_travel-and-places_dark.png");
      v11 = CFSTR("emoji_travel-and-places.png");
      goto LABEL_12;
    case 7:
      v10 = CFSTR("emoji_flags_dark.png");
      v11 = CFSTR("emoji_flags.png");
      goto LABEL_12;
    case 8:
    case 11:
      return CFSTR("emoji_symbols.png");
    case 10:
      v10 = CFSTR("emoji_objects_dark.png");
      v11 = CFSTR("emoji_objects.png");
LABEL_12:
      if (v6)
        v10 = (__CFString *)v11;
      v8 = v10;
      break;
    default:
      return v8;
  }
  return v8;
}

+ (id)emojiCategoryImageName:(id)a3 forRenderConfig:(id)a4
{
  id v5;
  unint64_t v6;

  v5 = a3;
  objc_msgSend(a4, "lightKeyboard");
  v6 = objc_msgSend(v5, "categoryType");

  if (v6 > 0xB)
    return 0;
  else
    return off_1E16D5A58[v6];
}

+ (BOOL)boldText
{
  return _AXSEnhanceTextLegibilityEnabled() != 0;
}

@end
