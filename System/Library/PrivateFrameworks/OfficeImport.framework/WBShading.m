@implementation WBShading

+ (void)readFrom:(WrdShading *)a3 to:(id)a4
{
  id v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  CsColour *p_var3;
  void *v14;
  CsColour *p_var4;
  void *v16;
  int var6;
  void *v18;
  id v19;

  v6 = a4;
  if (a3 && v6)
  {
    v19 = v6;
    objc_msgSend(v6, "setStyle:", a3->var1);
    if (a3->var2)
    {
      if (a3->var1 != 0xFFFF)
        goto LABEL_31;
      transparentWhite();
      if (a3->var3.var0)
        goto LABEL_31;
      v7 = transparentWhite(void)::transparentWhite ? 255 : 0;
      if (a3->var3.var1 != v7
        || (!transparentWhite(void)::transparentWhite ? (v8 = 0) : (v8 = 255),
            a3->var3.var2 != v8
         || (!transparentWhite(void)::transparentWhite ? (v9 = 0) : (v9 = 255),
             a3->var3.var3 != v9
          || (transparentWhite(), a3->var4.var0)
          || (!transparentWhite(void)::transparentWhite ? (v10 = 0) : (v10 = 255),
              a3->var4.var1 != v10
           || (!transparentWhite(void)::transparentWhite ? (v11 = 0) : (v11 = 255),
               a3->var4.var2 != v11
            || (!transparentWhite(void)::transparentWhite ? (v12 = 0) : (v12 = 255), a3->var4.var3 != v12))))))
      {
LABEL_31:
        transparentBlack();
        p_var3 = &a3->var3;
        if (a3->var3.var0 == (unsigned __int16)transparentBlack(void)::transparentBlack
          && __PAIR64__(a3->var3.var2, a3->var3.var1) == __PAIR64__(WORD2(transparentBlack(void)::transparentBlack), WORD1(transparentBlack(void)::transparentBlack))&& a3->var3.var3 == HIWORD(transparentBlack(void)::transparentBlack))
        {
          +[WDShading autoForegroundColor](WDShading, "autoForegroundColor", p_var3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setForeground:", v14);
        }
        else
        {
          +[OITSUColor colorWithCsColour:](OITSUColor, "colorWithCsColour:", p_var3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setForeground:", v14);
        }

        transparentBlack();
        p_var4 = &a3->var4;
        if (a3->var4.var0 == (unsigned __int16)transparentBlack(void)::transparentBlack
          && __PAIR64__(a3->var4.var2, a3->var4.var1) == __PAIR64__(WORD2(transparentBlack(void)::transparentBlack), WORD1(transparentBlack(void)::transparentBlack))&& a3->var4.var3 == HIWORD(transparentBlack(void)::transparentBlack))
        {
          +[WDShading autoBackgroundColor](WDShading, "autoBackgroundColor", p_var4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setBackground:", v16);
        }
        else
        {
          +[OITSUColor colorWithCsColour:](OITSUColor, "colorWithCsColour:", p_var4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setBackground:", v16);
        }
        goto LABEL_41;
      }
LABEL_47:
      objc_msgSend(a1, "setToSolidWhite:", v19);
      v6 = v19;
      goto LABEL_42;
    }
    v6 = v19;
    if (!a3->var5)
      goto LABEL_42;
    var6 = a3->var6;
    if (a3->var1 == 0xFFFF && var6 == 31)
    {
      if (a3->var7 == 31)
        goto LABEL_47;
    }
    else if (!var6)
    {
      +[WDShading autoForegroundColor](WDShading, "autoForegroundColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setForeground:", v18);
      goto LABEL_51;
    }
    +[OITSUColor colorWithCsColour:](OITSUColor, "colorWithCsColour:", &a3->var3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setForeground:", v18);
LABEL_51:

    if (a3->var7)
      +[OITSUColor colorWithCsColour:](OITSUColor, "colorWithCsColour:", &a3->var4);
    else
      +[WDShading autoBackgroundColor](WDShading, "autoBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackground:", v16);
LABEL_41:

    v6 = v19;
  }
LABEL_42:

}

+ (void)setToSolidWhite:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setStyle:", 1);
  +[OITSUColor whiteColor](OITSUColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForeground:", v3);

  +[OITSUColor whiteColor](OITSUColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackground:", v4);

}

+ (CsColour)fixedUpVersionOfColor:(CsColour)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  __int16 v6;

  v4 = v3;
  v5 = *(unsigned __int16 *)a3.var0;
  *(_WORD *)(v4 + 2) = *(_WORD *)(*(_QWORD *)&a3 + 2);
  *(_DWORD *)(v4 + 4) = *(_DWORD *)(*(_QWORD *)&a3 + 4);
  if (v5)
  {
    v6 = 255;
  }
  else
  {
    transparentBlack();
    v6 = transparentBlack(void)::transparentBlack;
    *(_WORD *)(v4 + 2) = WORD1(transparentBlack(void)::transparentBlack);
    *(_DWORD *)(v4 + 4) = HIDWORD(transparentBlack(void)::transparentBlack);
  }
  *(_WORD *)v4 = v6;
  return (CsColour)a1;
}

+ (void)write:(id)a3 to:(WrdShading *)a4
{
  id v6;
  void *v7;
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
  uint64_t v18;
  uint64_t v19;
  CsColour v20;

  v6 = a3;
  v7 = v6;
  if (v6 && a4)
  {
    a4->var1 = objc_msgSend(v6, "style");
    objc_msgSend(v7, "foreground");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "foreground");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[WDShading autoForegroundColor](WDShading, "autoForegroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v10)
      {
        transparentBlack();
        a4->var3 = (CsColour)transparentBlack(void)::transparentBlack;
      }
      else
      {
        objc_msgSend(v7, "foreground");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
          objc_msgSend(v11, "csColour");
        else
          v19 = 0;
        objc_msgSend(a1, "fixedUpVersionOfColor:", &v19);
        a4->var3 = v20;

      }
    }
    objc_msgSend(v7, "background");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v7, "background");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[WDShading autoBackgroundColor](WDShading, "autoBackgroundColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {
        transparentBlack();
        a4->var4 = (CsColour)transparentBlack(void)::transparentBlack;
      }
      else
      {
        objc_msgSend(v7, "background");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          objc_msgSend(v16, "csColour");
        else
          v18 = 0;
        objc_msgSend(a1, "fixedUpVersionOfColor:", &v18);
        a4->var4 = v20;

      }
    }
  }

}

@end
