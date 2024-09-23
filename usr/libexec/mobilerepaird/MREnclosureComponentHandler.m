@implementation MREnclosureComponentHandler

- (id)_init
{
  MREnclosureComponentHandler *v2;
  MREnclosureComponentHandler *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MREnclosureComponentHandler;
  v2 = -[MRSystemHealthComponentHandler initWithComponentName:](&v6, "initWithComponentName:", CFSTR("Enclosure"));
  v3 = v2;
  if (v2)
  {
    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("Enclosure"));
    v4 = (void *)objc_opt_new(CREnclosureStatus);
    -[MRBaseComponentHandler setComponentAuthHandler:](v3, "setComponentAuthHandler:", v4);

    -[MRBaseComponentHandler setComponentId:](v3, "setComponentId:", 14);
    -[MRBaseComponentHandler setSupportsRepair:](v3, "setSupportsRepair:", 1);
    -[MRBaseComponentHandler setFinishRepairTitle:](v3, "setFinishRepairTitle:", CFSTR("FINISH_ECL_REPAIR_TITLE"));
    -[MRBaseComponentHandler setFinishRepairMessage:](v3, "setFinishRepairMessage:", CFSTR("FINISH_ECL_REPAIR_DESC"));
    -[MRBaseComponentHandler setComponentForceKey:](v3, "setComponentForceKey:", CFSTR("ForceEnclosureStatus"));
  }
  return v3;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A520;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA88 != -1)
    dispatch_once(&qword_10001EA88, block);
  return (id)qword_10001EA80;
}

@end
