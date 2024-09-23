@implementation SSADEventReporter

+ (void)reportKey:(id)a3
{
  ADClientAddValueForScalarKey();
}

+ (void)reportModelUnpackageEventWithType:(unint64_t)a3
{
  const __CFString *v3;
  __CFString *v4;

  v3 = CFSTR("com.apple.searchd.models.unpackage.experimental");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    v4 = CFSTR("com.apple.searchd.models.unpackage.default");
  else
    v4 = (__CFString *)v3;
  if (-[__CFString length](v4, "length"))
    +[SSADEventReporter reportKey:](SSADEventReporter, "reportKey:", v4);
}

+ (void)reportModelLoadingError
{
  +[SSADEventReporter reportKey:](SSADEventReporter, "reportKey:", CFSTR("com.apple.searchd.models.loadingError"));
}

+ (void)reportBadL2Models
{
  +[SSADEventReporter reportKey:](SSADEventReporter, "reportKey:", CFSTR("com.apple.searchd.models.badL2"));
}

+ (void)reportBadL3Models
{
  +[SSADEventReporter reportKey:](SSADEventReporter, "reportKey:", CFSTR("com.apple.searchd.models.badL3"));
}

+ (void)reportModelDeletionForType:(unint64_t)a3
{
  const __CFString *v3;
  __CFString *v4;

  v3 = CFSTR("com.apple.searchd.models.deletion.experimental");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    v4 = CFSTR("com.apple.searchd.models.deletion.default");
  else
    v4 = (__CFString *)v3;
  if (-[__CFString length](v4, "length"))
    +[SSADEventReporter reportKey:](SSADEventReporter, "reportKey:", v4);
}

+ (void)reportBadDirectivesForModelType:(unint64_t)a3
{
  __CFString *v3;

  if (a3)
    v3 = 0;
  else
    v3 = CFSTR("com.apple.searchd.models.badL2Directives");
  if (-[__CFString length](v3, "length"))
    +[SSADEventReporter reportKey:](SSADEventReporter, "reportKey:", v3);
}

@end
