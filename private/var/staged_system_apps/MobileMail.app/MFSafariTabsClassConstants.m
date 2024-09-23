@implementation MFSafariTabsClassConstants

+ (void)configureTabContentGradientLayer:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[16];

  v3 = a3;
  objc_msgSend(v3, "setAnchorPoint:", 0.5, 0.0);
  objc_msgSend(v3, "setStartPoint:", 0.5, 0.0);
  objc_msgSend(v3, "setEndPoint:", 0.5, 1.0);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  v21[0] = objc_msgSend(v20, "CGColor");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.01)));
  v21[1] = objc_msgSend(v19, "CGColor");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.02)));
  v21[2] = objc_msgSend(v18, "CGColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.05)));
  v21[3] = objc_msgSend(v17, "CGColor");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.1)));
  v21[4] = objc_msgSend(v16, "CGColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.15)));
  v21[5] = objc_msgSend(v15, "CGColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.2)));
  v21[6] = objc_msgSend(v14, "CGColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.25)));
  v21[7] = objc_msgSend(v13, "CGColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3)));
  v21[8] = objc_msgSend(v4, "CGColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.35)));
  v21[9] = objc_msgSend(v5, "CGColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.4)));
  v21[10] = objc_msgSend(v6, "CGColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.45)));
  v21[11] = objc_msgSend(v7, "CGColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5)));
  v21[12] = objc_msgSend(v8, "CGColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.55)));
  v21[13] = objc_msgSend(v9, "CGColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.6)));
  v21[14] = objc_msgSend(v10, "CGColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.65)));
  v21[15] = objc_msgSend(v11, "CGColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 16));
  objc_msgSend(v3, "setColors:", v12);

  objc_msgSend(v3, "setLocations:", &off_1005421F0);
}

+ (void)configureStatusBarGradientLayer:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[16];

  v20 = a3;
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0)));
  v21[0] = objc_msgSend(v19, "CGColor");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.994603225)));
  v21[1] = objc_msgSend(v18, "CGColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.978587023)));
  v21[2] = objc_msgSend(v17, "CGColor");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.952464435)));
  v21[3] = objc_msgSend(v16, "CGColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.917060124)));
  v21[4] = objc_msgSend(v15, "CGColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.822990973)));
  v21[5] = objc_msgSend(v14, "CGColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.707279774)));
  v21[6] = objc_msgSend(v13, "CGColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.458754447)));
  v21[7] = objc_msgSend(v3, "CGColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.346236755)));
  v21[8] = objc_msgSend(v4, "CGColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.250244738)));
  v21[9] = objc_msgSend(v5, "CGColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.173203094)));
  v21[10] = objc_msgSend(v6, "CGColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.114800887)));
  v21[11] = objc_msgSend(v7, "CGColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0728674787)));
  v21[12] = objc_msgSend(v8, "CGColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0442915775)));
  v21[13] = objc_msgSend(v9, "CGColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0143711881)));
  v21[14] = objc_msgSend(v10, "CGColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.00392156863)));
  v21[15] = objc_msgSend(v11, "CGColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 16));
  objc_msgSend(v20, "setColors:", v12);

  objc_msgSend(v20, "setLocations:", &off_100542208);
}

@end
