@implementation UIImage(TVRemoteUI)

+ (id)tvrui_symbolImageWithName:()TVRemoteUI textStyle:weight:scale:maxPointSize:
{
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v10 = (void *)MEMORY[0x24BEBB520];
  v11 = a3;
  objc_msgSend(v10, "preferredFontForTextStyle:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pointSize");
  objc_msgSend(a1, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", v11, v12, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)tvrui_symbolImageWithName:()TVRemoteUI fontSize:weight:scale:
{
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v9 = (void *)MEMORY[0x24BEBD660];
  v10 = a4;
  objc_msgSend(v9, "configurationWithPointSize:weight:scale:", a5, a6, a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)tvrui_symbolImageWithName:()TVRemoteUI font:fontSize:weight:scale:maxPointSize:
{
  void *v10;
  double v11;
  id v12;
  void *v13;
  void *v14;

  v10 = (void *)MEMORY[0x24BEBD660];
  if (a1 >= a2)
    v11 = a2;
  else
    v11 = a1;
  v12 = a5;
  objc_msgSend(v10, "configurationWithPointSize:weight:scale:", a7, a8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)tvrui_symbolImageWithName:()TVRemoteUI font:scale:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x24BEBD660];
  v8 = a3;
  objc_msgSend(v7, "configurationWithFont:scale:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
