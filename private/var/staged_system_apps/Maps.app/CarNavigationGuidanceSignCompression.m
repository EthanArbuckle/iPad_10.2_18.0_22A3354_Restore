@implementation CarNavigationGuidanceSignCompression

+ ($54484288989FF125F1D7A2C3F8B348DC)compressionForStage:(SEL)a3 hasSecondary:(unint64_t)a4 hasJunctionView:(BOOL)a5 forDestination:(BOOL)a6
{
  BOOL v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;

  if (a6)
  {
    v7 = 0;
    v8 = a4;
    v9 = a4;
    switch(a4)
    {
      case 0uLL:
        break;
      case 1uLL:
        v9 = 0;
        v7 = 0;
        a4 = 3;
        goto LABEL_41;
      case 2uLL:
        v9 = 0;
        v7 = 0;
        a4 = 4;
        goto LABEL_41;
      case 3uLL:
        v9 = 0;
        v7 = 0;
        v8 = 2;
        if (!a5)
          v8 = 0;
        goto LABEL_27;
      case 4uLL:
        v7 = 0;
        if (a5)
          a4 = 4;
        else
          a4 = 3;
        v9 = 1;
        if (a5)
          v8 = 1;
        else
          v8 = 2;
        break;
      case 5uLL:
        v7 = 0;
        if (a5)
          v8 = 2;
        else
          v8 = 0;
        v9 = 1;
LABEL_27:
        a4 = 4;
        break;
      case 6uLL:
        v9 = 0;
        v7 = 0;
        v8 = 2;
        if (!a5)
          v8 = 0;
        a4 = 5;
        break;
      case 7uLL:
        goto LABEL_6;
      default:
        if (a5)
          v8 = 2;
        else
          v8 = 0;
        v9 = 1;
        a4 = 6;
        v7 = 1;
        break;
    }
  }
  else
  {
    v7 = 0;
    v8 = a4;
    v9 = a4;
    switch(a4)
    {
      case 0uLL:
        break;
      case 1uLL:
      case 2uLL:
        v8 = 0;
        v9 = 0;
        v7 = 0;
        break;
      case 3uLL:
        v9 = 0;
        v7 = 0;
        v10 = !a5;
        v11 = 2;
        goto LABEL_38;
      case 4uLL:
        v9 = 0;
        v7 = 0;
        v10 = !a5;
        v11 = 3;
LABEL_38:
        if (v10)
          a4 = v11 + 1;
        else
          a4 = v11;
LABEL_41:
        v8 = a5;
        break;
      case 5uLL:
        v9 = 0;
        v7 = 0;
        if (a5)
          a4 = 2;
        else
          a4 = 5;
        if (a5)
          v8 = 2;
        else
          v8 = 0;
        break;
      case 6uLL:
        v9 = 0;
        v7 = 0;
        v12 = !a5;
        v13 = 3;
        goto LABEL_50;
      case 7uLL:
        v9 = 0;
        v7 = 0;
        v12 = !a5;
        v13 = 4;
LABEL_50:
        if (v12)
          a4 = 6;
        else
          a4 = v13;
        goto LABEL_56;
      case 8uLL:
        v9 = 0;
        v7 = 0;
        v12 = !a5;
        if (a5)
          a4 = 5;
        else
          a4 = 6;
LABEL_56:
        v8 = 2;
        if (v12)
          v8 = 0;
        break;
      case 9uLL:
LABEL_6:
        v9 = 0;
        v7 = 0;
        v8 = 2;
        if (!a5)
          v8 = 0;
        goto LABEL_35;
      default:
        v9 = 0;
        if (a5)
          v8 = 2;
        else
          v8 = 0;
        v7 = 1;
LABEL_35:
        a4 = 6;
        break;
    }
  }
  retstr->var0 = a4;
  retstr->var1 = v8;
  retstr->var2 = v9;
  *(_QWORD *)&retstr->var3 = 0;
  retstr->var3 = v7;
  return result;
}

@end
