@implementation PRMonogramColor

+ (PRMonogramColor)colorWithName:(id)a3 inBundle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDF6950], "colorNamed:inBundle:compatibleWithTraitCollection:", v6, a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(a1, "monogramGradientColorNamed:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return (PRMonogramColor *)v10;
}

+ (id)defaultGradientStartColor
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "defaultBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorWithName:inBundle:", CFSTR("PlateGradientStartColor"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultGradientEndColor
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "defaultBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorWithName:inBundle:", CFSTR("PlateGradientEndColor"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

+ (id)gradientStartColor:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  v7 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = 0.0;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v7, &v6, &v5, &v4);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (v4 * v7 * 0.7 + 0.3) / (v4 * 0.7 + 0.3), (v4 * v6 * 0.7 + 0.3) / (v4 * 0.7 + 0.3), (v4 * v5 * 0.7 + 0.3) / (v4 * 0.7 + 0.3));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)gradientStartName:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR("_GradientStart"));
}

+ (id)gradientEndName:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR("_GradientEnd"));
}

+ (id)generateMonogramGradientColorsByNameDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[34];
  _QWORD v74[36];

  v74[34] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.937254906, 0.490196079, 0.639215708, 1.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.964705884, 0.721568644, 0.800000012, 1.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.788235307, 0.592156887, 0.572549045, 1.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.882352948, 0.776470602, 0.764705896, 1.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.929411769);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.960784316);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.623529434, 0.905882359, 0.529411793, 1.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.792156875, 0.949019611, 0.741176486, 1.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.454901963, 0.698039234, 0.886274517, 1.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.701960802, 0.835294127, 0.937254906, 1.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.709803939, 0.643137276, 0.949019611, 1.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.839215696, 0.80392158, 0.972549021, 1.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.839215696, 0.807843149, 0.870588243, 1.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.78039217, 0.843137264, 0.905882359, 1.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.603921592, 0.717647076, 0.827450991, 1.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.815686285, 0.909803927, 0.917647064, 1.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.666666687, 0.835294127, 0.847058833, 1.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.941176474, 0.717647076, 0.925490201, 1.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.890196085, 0.486274511, 0.866666675, 1.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.666666687, 0.941176474, 0.949019611, 1.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.396078438, 0.894117653, 0.905882359, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.694117665, 0.956862748, 0.764705896, 1.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.443137258, 0.921568632, 0.568627477, 1.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.850980401, 0.831372559, 0.811764717, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.725490212, 0.694117665, 0.654901981, 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.90196079, 0.839215696, 0.749019623, 1.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.819607854, 0.70588237, 0.541176498, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.831372559, 0.866666675, 0.815686285, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.690196097, 0.760784328, 0.666666687, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.56078434, 0.56078434, 0.56078434, 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.200000003, 0.200000003, 0.200000003, 1.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "gradientStartName:", CFSTR("Pink"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v47;
  v74[0] = v72;
  objc_msgSend(a1, "gradientEndName:", CFSTR("Pink"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v46;
  v74[1] = v71;
  objc_msgSend(a1, "gradientStartName:", CFSTR("Red"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v45;
  v74[2] = v70;
  objc_msgSend(a1, "gradientEndName:", CFSTR("Red"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v73[3] = v44;
  v74[3] = v69;
  objc_msgSend(a1, "gradientStartName:", CFSTR("Orange"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v73[4] = v43;
  v74[4] = v68;
  objc_msgSend(a1, "gradientEndName:", CFSTR("Orange"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v73[5] = v42;
  v74[5] = v67;
  objc_msgSend(a1, "gradientStartName:", CFSTR("Yellow"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v73[6] = v41;
  v74[6] = v66;
  objc_msgSend(a1, "gradientEndName:", CFSTR("Yellow"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v73[7] = v40;
  v74[7] = v65;
  objc_msgSend(a1, "gradientStartName:", CFSTR("Green"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v73[8] = v39;
  v74[8] = v64;
  objc_msgSend(a1, "gradientEndName:", CFSTR("Green"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v73[9] = v38;
  v74[9] = v63;
  objc_msgSend(a1, "gradientStartName:", CFSTR("Blue"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v73[10] = v36;
  v74[10] = v62;
  objc_msgSend(a1, "gradientEndName:", CFSTR("Blue"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v73[11] = v34;
  v74[11] = v61;
  objc_msgSend(a1, "gradientStartName:", CFSTR("Purple"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v73[12] = v32;
  v74[12] = v60;
  objc_msgSend(a1, "gradientEndName:", CFSTR("Purple"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v73[13] = v31;
  v74[13] = v58;
  objc_msgSend(a1, "gradientStartName:", CFSTR("D6CEDE"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v73[14] = v29;
  v74[14] = v56;
  objc_msgSend(a1, "gradientEndName:", CFSTR("D6CEDE"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v73[15] = v28;
  v74[15] = v59;
  objc_msgSend(a1, "gradientStartName:", CFSTR("C7D7E7"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v73[16] = v25;
  v74[16] = v54;
  objc_msgSend(a1, "gradientEndName:", CFSTR("C7D7E7"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v73[17] = v24;
  v74[17] = v57;
  objc_msgSend(a1, "gradientStartName:", CFSTR("D0E8EA"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v73[18] = v22;
  v74[18] = v50;
  objc_msgSend(a1, "gradientEndName:", CFSTR("D0E8EA"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v73[19] = v21;
  v74[19] = v55;
  objc_msgSend(a1, "gradientStartName:", CFSTR("F0B7EC"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v73[20] = v18;
  v74[20] = v37;
  objc_msgSend(a1, "gradientEndName:", CFSTR("F0B7EC"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v73[21] = v17;
  v74[21] = v53;
  objc_msgSend(a1, "gradientStartName:", CFSTR("AAF0F2"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v73[22] = v16;
  v74[22] = v33;
  objc_msgSend(a1, "gradientEndName:", CFSTR("AAF0F2"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v73[23] = v15;
  v74[23] = v51;
  objc_msgSend(a1, "gradientStartName:", CFSTR("B1F4C3"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v73[24] = v14;
  v74[24] = v30;
  objc_msgSend(a1, "gradientEndName:", CFSTR("B1F4C3"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v73[25] = v3;
  v74[25] = v49;
  objc_msgSend(a1, "gradientStartName:", CFSTR("D9D4CF"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v73[26] = v4;
  v74[26] = v27;
  objc_msgSend(a1, "gradientEndName:", CFSTR("D9D4CF"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v73[27] = v5;
  v74[27] = v26;
  objc_msgSend(a1, "gradientStartName:", CFSTR("E6D6BF"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v73[28] = v6;
  v74[28] = v23;
  objc_msgSend(a1, "gradientEndName:", CFSTR("E6D6BF"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v73[29] = v7;
  v74[29] = v52;
  objc_msgSend(a1, "gradientStartName:", CFSTR("D4DDD0"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v73[30] = v8;
  v74[30] = v20;
  objc_msgSend(a1, "gradientEndName:", CFSTR("D4DDD0"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v73[31] = v9;
  v74[31] = v19;
  objc_msgSend(a1, "gradientStartName:", CFSTR("8F8F8F"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v73[32] = v10;
  v74[32] = v48;
  objc_msgSend(a1, "gradientEndName:", CFSTR("8F8F8F"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v73[33] = v11;
  v74[33] = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 34);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)monogramGradientColorNamed:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__PRMonogramColor_monogramGradientColorNamed___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = monogramGradientColorNamed__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&monogramGradientColorNamed__onceToken, block);
  objc_msgSend((id)monogramGradientColorNamed__monogramGradientColorsByName, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __46__PRMonogramColor_monogramGradientColorNamed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "generateMonogramGradientColorsByNameDictionary");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)monogramGradientColorNamed__monogramGradientColorsByName;
  monogramGradientColorNamed__monogramGradientColorsByName = v1;

}

+ (id)defaultSelectedActiveColor
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "defaultBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorWithName:inBundle:", CFSTR("PlateSelectedActiveColor"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultSelectedInactiveColor
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "defaultBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorWithName:inBundle:", CFSTR("PlateSelectedInactiveColor"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultSelectedActiveTextColor
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "defaultBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorWithName:inBundle:", CFSTR("PlateSelectedActiveTextColor"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (NSArray)availableColorNames
{
  _QWORD v3[18];

  v3[17] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Pink");
  v3[1] = CFSTR("Red");
  v3[2] = CFSTR("Orange");
  v3[3] = CFSTR("Yellow");
  v3[4] = CFSTR("Green");
  v3[5] = CFSTR("Blue");
  v3[6] = CFSTR("Purple");
  v3[7] = CFSTR("D6CEDE");
  v3[8] = CFSTR("C7D7E7");
  v3[9] = CFSTR("D0E8EA");
  v3[10] = CFSTR("F0B7EC");
  v3[11] = CFSTR("AAF0F2");
  v3[12] = CFSTR("B1F4C3");
  v3[13] = CFSTR("D9D4CF");
  v3[14] = CFSTR("E6D6BF");
  v3[15] = CFSTR("D4DDD0");
  v3[16] = CFSTR("8F8F8F");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 17);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSArray)availableColors
{
  void *v2;
  void *v3;

  +[PRMonogramColor availableColorNames](PRMonogramColor, "availableColorNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_map:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

PRMonogramColor *__34__PRMonogramColor_availableColors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PRMonogramColor *v3;

  v2 = a2;
  v3 = -[PRMonogramColor initWithColorName:]([PRMonogramColor alloc], "initWithColorName:", v2);

  return v3;
}

- (PRMonogramColor)initWithRandomColor
{
  void *v3;
  void *v4;
  PRMonogramColor *v5;

  +[PRMonogramColor availableColorNames](PRMonogramColor, "availableColorNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", arc4random_uniform(objc_msgSend(v3, "count")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PRMonogramColor initWithColorName:](self, "initWithColorName:", v4);

  return v5;
}

- (PRMonogramColor)initWithColorName:(id)a3
{
  id v4;
  void *v5;
  PRMonogramColor *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PRMonogramColor initWithColorName:inBundle:](self, "initWithColorName:inBundle:", v4, v5);

  return v6;
}

- (PRMonogramColor)initWithColorName:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  PRMonogramColor *v8;
  PRMonogramColor *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PRMonogramColor;
  v8 = -[PRMonogramColor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PRMonogramColor setColorName:](v8, "setColorName:", v6);
    objc_storeStrong((id *)&v9->_bundle, a4);
  }

  return v9;
}

- (void)setColorName:(id)a3
{
  __CFString *v4;
  unint64_t v5;
  NSString *v6;
  NSString *colorName;
  void *v8;
  __CFString *v9;

  v4 = (__CFString *)a3;
  if (!v4)
    v4 = &stru_24C3CF300;
  v9 = v4;
  v5 = -[__CFString lengthOfBytesUsingEncoding:](v4, "lengthOfBytesUsingEncoding:", 4);
  if (v5 > 0x10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("PRMonogram -setColorName: received string %@ with UTF-8 length %@ that is greater than our %@ byte limit. Ignoring."), v9, v8, &unk_24C3D1810);

    colorName = self->_colorName;
    self->_colorName = (NSString *)&stru_24C3CF300;
  }
  else
  {
    v6 = (NSString *)-[__CFString copy](v9, "copy");
    colorName = self->_colorName;
    self->_colorName = v6;
  }

}

- (UIColor)gradientStartColor
{
  UIColor *gradientStartColor;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIColor *v8;
  UIColor *v9;

  gradientStartColor = self->_gradientStartColor;
  if (!gradientStartColor)
  {
    -[PRMonogramColor colorName](self, "colorName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("_GradientStart"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_opt_class();
    -[PRMonogramColor bundle](self, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithName:inBundle:", v5, v7);
    v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v9 = self->_gradientStartColor;
    self->_gradientStartColor = v8;

    gradientStartColor = self->_gradientStartColor;
  }
  return gradientStartColor;
}

- (UIColor)gradientEndColor
{
  UIColor *gradientEndColor;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIColor *v8;
  UIColor *v9;

  gradientEndColor = self->_gradientEndColor;
  if (!gradientEndColor)
  {
    -[PRMonogramColor colorName](self, "colorName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("_GradientEnd"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_opt_class();
    -[PRMonogramColor bundle](self, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithName:inBundle:", v5, v7);
    v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v9 = self->_gradientEndColor;
    self->_gradientEndColor = v8;

    gradientEndColor = self->_gradientEndColor;
  }
  return gradientEndColor;
}

- (UIColor)selectedActiveColor
{
  return (UIColor *)objc_msgSend((id)objc_opt_class(), "defaultSelectedActiveTextColor");
}

- (UIColor)selectedInactiveColor
{
  return (UIColor *)objc_msgSend((id)objc_opt_class(), "defaultSelectedInactiveColor");
}

- (UIColor)selectedActiveTextColor
{
  return (UIColor *)objc_msgSend((id)objc_opt_class(), "defaultSelectedActiveTextColor");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PRMonogramColor colorName](self, "colorName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PRMonogramColor colorName](self, "colorName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void)setGradientStartColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientStartColor, a3);
}

- (void)setGradientEndColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientEndColor, a3);
}

- (void)setSelectedActiveColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedActiveColor, a3);
}

- (void)setSelectedInactiveColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedInactiveColor, a3);
}

- (void)setSelectedActiveTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedActiveTextColor, a3);
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_selectedActiveTextColor, 0);
  objc_storeStrong((id *)&self->_selectedInactiveColor, 0);
  objc_storeStrong((id *)&self->_selectedActiveColor, 0);
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
}

@end
