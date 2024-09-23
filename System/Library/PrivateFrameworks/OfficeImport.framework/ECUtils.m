@implementation ECUtils

+ (BOOL)isRenameFunction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(a1, "renameMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

+ (id)renameFunction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "renameMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = v5;
  v9 = v8;

  return v9;
}

+ (id)lassoStyleTableReferenceFromTableId:(id)a3
{
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SFTGlobalID_%@"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)lassoDefaultTableName
{
  void *v2;
  void *v3;

  TCBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Table 1"), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isValidDateTime:(double)a3 edWorkbook:(id)a4
{
  double v4;

  objc_msgSend(a1, "timeIntervalFromXlDateTimeNumber:edWorkbook:", a4, a3);
  return v4 > -2.55485146e11 && v4 < 2.5561129e11;
}

+ (BOOL)validDateInExcel:(id)a3 edWorkbook:(id)a4
{
  id v5;
  void *v6;
  double v7;
  BOOL v8;

  v5 = a3;
  objc_msgSend(a4, "dateBaseDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7 >= -86400.0;

  return v8;
}

+ (id)dateFromXlDateTimeNumber:(double)a3 edWorkbook:(id)a4
{
  id v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a1, "timeIntervalFromXlDateTimeNumber:edWorkbook:", v6, a3);
  v8 = v7;
  v9 = objc_alloc(MEMORY[0x24BDBCE60]);
  objc_msgSend(v6, "dateBaseDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTimeInterval:sinceDate:", v10, v8);

  return v11;
}

+ (double)dateTimeNumberFromNSDate:(id)a3 edWorkbook:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "dateBaseDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v8);
  v10 = (v9 - (double)((uint64_t)v9 / 86400) * 86400.0) / 86400.0
      + (double)((uint64_t)v9 / 86400)
      + (double)objc_msgSend(a1, "dateTimeOffsetForBuggy1900Dates:edWorkbook:", v7, (v9 - (double)((uint64_t)v9 / 86400) * 86400.0) / 86400.0 + (double)((uint64_t)v9 / 86400));

  return v10;
}

+ (id)renameMap
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!+[ECUtils(Private) renameMap]::xlRenameMapDictionary)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("BETAINV"), CFSTR("_XLFN.BETA.INV"), CFSTR("BINOMDIST"), CFSTR("_XLFN.BINOM.DIST"), CFSTR("CRITBINOM"), CFSTR("_XLFN.BINOM.INV"), CFSTR("CHIDIST"), CFSTR("_XLFN.CHISQ.DIST.RT"), CFSTR("CHIINV"), CFSTR("_XLFN.CHISQ.INV.RT"), CFSTR("CHITEST"), CFSTR("_XLFN.CHISQ.TEST"), CFSTR("CONFIDENCE"), CFSTR("_XLFN.CONFIDENCE.NORM"), CFSTR("COVAR"), CFSTR("_XLFN.COVARIANCE.P"), CFSTR("EXPONDIST"),
           CFSTR("_XLFN.EXPON.DIST"),
           CFSTR("FDIST"),
           CFSTR("_XLFN.F.DIST.RT"),
           CFSTR("FINV"),
           CFSTR("_XLFN.F.INV.RT"),
           CFSTR("GAMMADIST"),
           CFSTR("_XLFN.GAMMA.DIST"),
           CFSTR("GAMMAINV"),
           CFSTR("_XLFN.GAMMA.INV"),
           CFSTR("LOGINV"),
           CFSTR("_XLFN.LOGNORM.INV"),
           CFSTR("MODE"),
           CFSTR("_XLFN.MODE.SNGL"),
           CFSTR("NORMDIST"),
           CFSTR("_XLFN.NORM.DIST"),
           CFSTR("NORMINV"),
           CFSTR("_XLFN.NORM.INV"),
           CFSTR("NORMSINV"),
           CFSTR("_XLFN.NORM.S.INV"),
           CFSTR("PERCENTILE"),
           CFSTR("_XLFN.PERCENTILE.INC"),
           CFSTR("PERCENTRANK"),
           CFSTR("_XLFN.PERCENTRANK.INC"),
           CFSTR("POISSON"),
           CFSTR("_XLFN.POISSON.DIST"),
           CFSTR("QUARTILE"),
           CFSTR("_XLFN.QUARTILE.INC"),
           CFSTR("RANK"),
           CFSTR("_XLFN.RANK.EQ"),
           CFSTR("STDEVP"),
           CFSTR("_XLFN.STDEV.P"),
           CFSTR("STDEV"),
           CFSTR("_XLFN.STDEV.S"),
           CFSTR("TINV"),
           CFSTR("_XLFN.T.INV.2T"),
           CFSTR("TTEST"),
           CFSTR("_XLFN.T.TEST"),
           CFSTR("VARP"),
           CFSTR("_XLFN.VAR.P"),
           CFSTR("VAR"),
           CFSTR("_XLFN.VAR.S"),
           CFSTR("ZTEST"),
           CFSTR("_XLFN.Z.TEST"),
           CFSTR("BONDDURATION"));
    v4 = (void *)+[ECUtils(Private) renameMap]::xlRenameMapDictionary;
    +[ECUtils(Private) renameMap]::xlRenameMapDictionary = v3;

  }
  objc_sync_exit(v2);

  return (id)+[ECUtils(Private) renameMap]::xlRenameMapDictionary;
}

+ (double)timeIntervalFromXlDateTimeNumber:(double)a3 edWorkbook:(id)a4
{
  return (a3 - (double)objc_msgSend(a1, "dateTimeOffsetForBuggy1900Dates:edWorkbook:", a4)) * 86400.0;
}

+ (unsigned)dateTimeOffsetForBuggy1900Dates:(double)a3 edWorkbook:(id)a4
{
  int v5;
  unsigned int v6;

  v5 = objc_msgSend(a4, "dateBase");
  if (a3 <= 60.0)
    v6 = 1;
  else
    v6 = 2;
  if (v5 == 1)
    return v6;
  else
    return 0;
}

@end
