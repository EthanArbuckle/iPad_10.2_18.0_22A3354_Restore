@implementation WBBorder

+ (void)readFrom:(WrdBorder *)a3 to:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (a3 && v6)
  {
    objc_msgSend(v6, "setStyle:", a3->var2);
    +[OITSUColor colorWithCsColour:](OITSUColor, "colorWithCsColour:", &a3->var1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColor:", v5);

    objc_msgSend(v6, "setWidth:", a3->var6);
    objc_msgSend(v6, "setSpace:", a3->var7);
    objc_msgSend(v6, "setShadow:", *((_BYTE *)a3 + 24) & 1);
    objc_msgSend(v6, "setFrame:", (*((unsigned __int8 *)a3 + 24) >> 1) & 1);
  }

}

+ (void)write:(id)a3 to:(WrdBorder *)a4
{
  id v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  CsColour v14;
  char v15;
  CsColour v16;

  v5 = a3;
  v6 = v5;
  if (v5 && a4)
  {
    v7 = objc_msgSend(v5, "style");
    if (v7 == 235)
      v8 = 0;
    else
      v8 = v7;
    if ((v7 - 233) >= 2)
      v9 = v8;
    else
      v9 = 197;
    if (v7 == 228)
      v10 = 84;
    else
      v10 = v9;
    if ((v7 - 229) >= 4)
      v11 = v10;
    else
      v11 = 192;
    a4->var2 = v11;
    objc_msgSend(v6, "color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "csColour");
      v14 = v16;
    }
    else
    {
      v14 = 0;
    }
    a4->var1 = v14;

    a4->var6 = objc_msgSend(v6, "width");
    a4->var7 = objc_msgSend(v6, "space");
    *((_BYTE *)a4 + 24) = *((_BYTE *)a4 + 24) & 0xFE | objc_msgSend(v6, "shadow");
    if (objc_msgSend(v6, "frame"))
      v15 = 2;
    else
      v15 = 0;
    *((_BYTE *)a4 + 24) = *((_BYTE *)a4 + 24) & 0xFD | v15;
  }

}

@end
