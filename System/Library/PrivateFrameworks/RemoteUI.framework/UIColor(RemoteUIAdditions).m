@implementation UIColor(RemoteUIAdditions)

+ (id)_remoteUI_colorWithString:()RemoteUIAdditions defaultColor:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[36];
  _QWORD v62[38];

  v62[36] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "length"))
    goto LABEL_14;
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  v60 = 0;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCharactersToBeSkipped:", v8);

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("("));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v7, "scanUpToCharactersFromSet:intoString:", v9, 0);

  objc_msgSend(v7, "scanString:intoString:", CFSTR("("), 0);
  v10 = objc_msgSend(v7, "scanInt:", (char *)&v60 + 4);
  v11 = objc_msgSend(v7, "scanString:intoString:", CFSTR(","), 0);
  v12 = objc_msgSend(v7, "scanInt:", &v60);
  v13 = objc_msgSend(v7, "scanString:intoString:", CFSTR(","), 0);
  v14 = objc_msgSend(v7, "scanInt:", (char *)&v59 + 4);
  v15 = objc_msgSend(v7, "scanString:intoString:", CFSTR(","), 0);
  v16 = objc_msgSend(v7, "scanFloat:", &v59);
  if ((_DWORD)v8 && v10 && v11 && v12 && v13 && v14)
  {
    v17 = *(float *)&v59;
    if ((v15 & v16) == 0)
      v17 = 1.0;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", (double)SHIDWORD(v60) / 255.0, (double)(int)v60 / 255.0, (double)SHIDWORD(v59) / 255.0, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  v19 = (void *)_remoteUI_colorWithString_defaultColor__colorMap;
  if (!_remoteUI_colorWithString_defaultColor__colorMap)
  {
    v61[0] = CFSTR("black");
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v58;
    v61[1] = CFSTR("darkGray");
    objc_msgSend(MEMORY[0x24BEBD4B8], "darkGrayColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v57;
    v61[2] = CFSTR("lightGray");
    objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v56;
    v61[3] = CFSTR("white");
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v55;
    v61[4] = CFSTR("gray");
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v62[4] = v54;
    v61[5] = CFSTR("red");
    objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v62[5] = v53;
    v61[6] = CFSTR("green");
    objc_msgSend(MEMORY[0x24BEBD4B8], "greenColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v62[6] = v52;
    v61[7] = CFSTR("blue");
    objc_msgSend(MEMORY[0x24BEBD4B8], "blueColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v62[7] = v51;
    v61[8] = CFSTR("cyan");
    objc_msgSend(MEMORY[0x24BEBD4B8], "cyanColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v62[8] = v50;
    v61[9] = CFSTR("yellow");
    objc_msgSend(MEMORY[0x24BEBD4B8], "yellowColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v62[9] = v49;
    v61[10] = CFSTR("magenta");
    objc_msgSend(MEMORY[0x24BEBD4B8], "magentaColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v62[10] = v48;
    v61[11] = CFSTR("orange");
    objc_msgSend(MEMORY[0x24BEBD4B8], "orangeColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v62[11] = v47;
    v61[12] = CFSTR("purple");
    objc_msgSend(MEMORY[0x24BEBD4B8], "purpleColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v62[12] = v46;
    v61[13] = CFSTR("brown");
    objc_msgSend(MEMORY[0x24BEBD4B8], "brownColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v62[13] = v45;
    v61[14] = CFSTR("clear");
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v62[14] = v44;
    v61[15] = CFSTR("systemRed");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v62[15] = v43;
    v61[16] = CFSTR("systemGreen");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v62[16] = v42;
    v61[17] = CFSTR("systemBlue");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v62[17] = v41;
    v61[18] = CFSTR("systemOrange");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v62[18] = v40;
    v61[19] = CFSTR("systemYellow");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemYellowColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v62[19] = v39;
    v61[20] = CFSTR("systemTeal");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemTealColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v62[20] = v38;
    v61[21] = CFSTR("systemPink");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v62[21] = v37;
    v61[22] = CFSTR("systemGray");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v62[22] = v36;
    v61[23] = CFSTR("systemPurple");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemPurpleColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v62[23] = v35;
    v61[24] = CFSTR("systemBrown");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBrownColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v62[24] = v34;
    v61[25] = CFSTR("systemIndigo");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemIndigoColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v62[25] = v33;
    v61[26] = CFSTR("systemMidGray");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemMidGrayColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v62[26] = v32;
    v61[27] = CFSTR("systemGray6Color");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray6Color");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v62[27] = v31;
    v61[28] = CFSTR("tertiarySystemGroupedBackgroundColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemGroupedBackgroundColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v62[28] = v30;
    v61[29] = CFSTR("systemBackgroundColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "_systemBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v62[29] = v20;
    v61[30] = CFSTR("labelColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v62[30] = v21;
    v61[31] = CFSTR("secondaryLabelColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v62[31] = v22;
    v61[32] = CFSTR("tertiaryLabelColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v62[32] = v23;
    v61[33] = CFSTR("quaternaryLabelColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "quaternaryLabelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v62[33] = v24;
    v61[34] = CFSTR("linkColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "linkColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v62[34] = v25;
    v61[35] = CFSTR("placeholderTextColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "placeholderTextColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v62[35] = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 36);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)_remoteUI_colorWithString_defaultColor__colorMap;
    _remoteUI_colorWithString_defaultColor__colorMap = v27;

    v19 = (void *)_remoteUI_colorWithString_defaultColor__colorMap;
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", v5);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (!v18)
LABEL_14:
    v18 = v6;
LABEL_15:

  return v18;
}

+ (id)_remoteUI_colorWithString:()RemoteUIAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BEBD4B8];
  v5 = a3;
  objc_msgSend(v4, "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteUI_colorWithString:defaultColor:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
