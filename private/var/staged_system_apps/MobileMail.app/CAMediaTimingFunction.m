@implementation CAMediaTimingFunction

+ (id)mf_functionWithName:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("MediaTimingFunctionMailMagic")))
  {
    LODWORD(v5) = 1046804326;
    LODWORD(v6) = 990057071;
    LODWORD(v7) = 1057860511;
    LODWORD(v8) = 1064563009;
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "functionWithControlPoints::::", v5, v6, v7, v8));
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "functionWithName:", v4));
  }
  v10 = (void *)v9;

  return v10;
}

@end
