@implementation _WTLightEffectPalette

+ (id)coolColors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[8];

  v18[7] = *MEMORY[0x24BDAC8D0];
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.67, 1.0, 0.81, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v17, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v16;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.67, 1.0, 0.81, 0.04);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v15, 0.16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v14;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.72, 1.0, 0.81, 0.38);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v13, 0.48);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v2;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.76, 0.96, 0.99, 0.53);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v3, 0.59);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v4;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.8, 0.96, 0.99, 0.78);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v5, 0.78);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v6;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.81, 1.0, 1.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v7, 0.94);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v8;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.12, 1.0, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v9, 0.99);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)warmColors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x24BDAC8D0];
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.76, 0.73, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v13, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.76, 0.73, 1.0, 0.21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v3, 0.33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.95, 0.96, 0.99, 0.8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v5, 0.6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.11, 1.0, 1.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v7, 0.8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.12, 1.0, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v9, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)replaceSourceSweepMask
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 1.0, 1.0, 1.0, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 1.0, 1.0, 1.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v4, 0.9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 1.0, 1.0, 1.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v6, 0.95);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 1.0, 1.0, 1.0, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v8, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)replaceDestinationSweepMask
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 1.0, 1.0, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 1.0, 1.0, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v4, 0.85);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 1.0, 1.0, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v6, 0.9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 1.0, 1.0, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v8, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)replaceDestinationColors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[8];

  v18[7] = *MEMORY[0x24BDAC8D0];
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.6, 0.42, 0.85, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v17, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v16;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.6, 0.42, 0.85, 0.5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v15, 0.32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v14;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.786111111, 0.3, 0.87, 0.75);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v13, 0.7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v2;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.986111111, 0.35, 0.95, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v3, 0.86);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v4;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.0583333333, 0.5, 0.93, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v5, 0.88);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v6;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.0611111111, 0.9, 0.95, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v7, 0.94);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v8;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.130555556, 1.0, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v9, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)ponderingSweep
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x24BDAC8D0];
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.66, 0.38, 0.81, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v15, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.66, 0.38, 0.81, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v13, 0.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.76, 0.38, 0.98, 0.5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v2, 0.71);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v3;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.761111111, 0.38, 0.98, 0.6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v4, 0.9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.761111111, 0.38, 0.98, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v6, 0.94);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v7;
  +[_WTColor colorWithHue:saturation:brightness:alpha:](_WTColor, "colorWithHue:saturation:brightness:alpha:", 0.12, 1.0, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v8, 0.99);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)ponderingLightEdge
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x24BDAC8D0];
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v13, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v3, 0.85);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v5, 0.955);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v7, 0.965);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v9, 0.98);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)ponderingLightEdgeDestination
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x24BDAC8D0];
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v13, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v3, 0.8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v5, 0.86);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v7, 0.87);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLocatedColor locatedColor:location:](_WTLocatedColor, "locatedColor:location:", v9, 0.95);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)finaleSweep
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x24BDAC8D0];
  +[_WTColor redColor](_WTColor, "redColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTColor greenColor](_WTColor, "greenColor", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[_WTColor blueColor](_WTColor, "blueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[_WTColor redColor](_WTColor, "redColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  +[_WTColor greenColor](_WTColor, "greenColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  +[_WTColor blueColor](_WTColor, "blueColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  +[_WTColor redColor](_WTColor, "redColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)ponderingPurple
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 0.804, 0.612, 0.867, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 0.804, 0.612, 0.867, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 0.682, 0.51, 0.796, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 0.686, 0.421, 0.87, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 1.0, 0.796, 1.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 0.682, 0.51, 0.796, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)replaceBuildOut
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 0.925, 0.553, 0.918, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 0.604, 0.431, 0.843, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)replaceBuildIn
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 0.475, 0.345, 0.773, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 0.812, 0.518, 0.4, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  +[_WTColor colorWithRed:green:blue:alpha:](_WTColor, "colorWithRed:green:blue:alpha:", 0.945, 0.678, 0.388, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  +[_WTColor colorWithWhite:alpha:](_WTColor, "colorWithWhite:alpha:", 1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
