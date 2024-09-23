@implementation PBPlaceholder

+ (int)placeholderTypeFromTextType:(int)a3
{
  if (a3 > 8)
    return -1;
  else
    return dword_22A4D3850[a3];
}

+ (int)readPlaceholderType:(int)a3
{
  if (a3 < 0x1B)
    return dword_22A4D37E4[a3];
  TCVerifyInputMeetsCondition(0);
  return 0;
}

+ (int)readPlaceholderSize:(int)a3
{
  if (a3 >= 3)
    return -1;
  else
    return a3;
}

+ (int)readPlaceholderOrientation:(int)a3
{
  return a3 == 25 || (a3 - 17) < 2;
}

+ (BOOL)isBodyPlaceholder:(int)a3
{
  return (a3 < 9) & (0x1A2u >> a3);
}

+ (BOOL)isTitlePlaceholder:(int)a3
{
  return !a3 || a3 == 6;
}

+ (void)writePlaceholder:(id)a3 toPlaceholderAtom:(PptOEPlaceholderAtom *)a4 isMaster:(BOOL)a5 isNotes:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  int v9;
  char v10;
  char v11;
  BOOL v12;
  char v13;
  id v14;

  v6 = a6;
  v7 = a5;
  v14 = a3;
  a4->var6 = objc_msgSend(v14, "index");
  *((_BYTE *)a4 + 53) = objc_msgSend(v14, "size");
  v9 = objc_msgSend(v14, "orientation");
  switch(objc_msgSend(v14, "type"))
  {
    case 0u:
      if (v9 == 1)
        v10 = 17;
      else
        v10 = 13;
      if (v7)
        v10 = 1;
      break;
    case 1u:
      if (v9 == 1)
        v10 = 18;
      else
        v10 = 14;
      if (v7)
      {
        v10 = 2;
        v11 = 6;
      }
      else
      {
        v11 = 12;
      }
      if (v6)
        v10 = v11;
      break;
    case 2u:
      v12 = !v7;
      v10 = 15;
      v13 = 3;
      goto LABEL_31;
    case 3u:
      v12 = !v7;
      v10 = 16;
      v13 = 11;
      goto LABEL_31;
    case 4u:
      v10 = 7;
      break;
    case 5u:
      v10 = 8;
      break;
    case 6u:
      v10 = 9;
      break;
    case 7u:
      v10 = 10;
      break;
    case 8u:
      if (v9 == 1)
        v10 = 25;
      else
        v10 = 19;
      break;
    case 9u:
      v10 = 20;
      break;
    case 0xAu:
      v10 = 21;
      break;
    case 0xBu:
      v10 = 22;
      break;
    case 0xCu:
      v10 = 23;
      break;
    case 0xDu:
      v10 = 24;
      break;
    case 0xEu:
      v12 = !v7;
      v10 = 11;
      v13 = 5;
LABEL_31:
      if (!v12)
        v10 = v13;
      break;
    case 0xFu:
      v10 = 26;
      break;
    default:
      v10 = 0;
      break;
  }
  *((_BYTE *)a4 + 52) = v10;

}

@end
