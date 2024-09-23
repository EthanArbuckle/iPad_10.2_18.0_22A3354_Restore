@implementation FnfDbwO2lFcwJMJU

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FD2C;
  block[3] = &unk_1004CE9E0;
  block[4] = a1;
  if (qword_100511550 != -1)
    dispatch_once(&qword_100511550, block);
  return (id)qword_100511548;
}

- (FnfDbwO2lFcwJMJU)init
{
  FnfDbwO2lFcwJMJU *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *gTBjgtWKPdOTHwT4;
  NSString *QSDcma8s0bThnyOF;
  CoreTelephonyClient *v6;
  CoreTelephonyClient *VeKeMRBxEIiHlARL;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FnfDbwO2lFcwJMJU;
  v2 = -[FnfDbwO2lFcwJMJU init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.asd.pr", 0);
    gTBjgtWKPdOTHwT4 = v2->gTBjgtWKPdOTHwT4;
    v2->gTBjgtWKPdOTHwT4 = (OS_dispatch_queue *)v3;

    QSDcma8s0bThnyOF = v2->QSDcma8s0bThnyOF;
    v2->QSDcma8s0bThnyOF = 0;

    v6 = (CoreTelephonyClient *)objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", v2->gTBjgtWKPdOTHwT4);
    VeKeMRBxEIiHlARL = v2->VeKeMRBxEIiHlARL;
    v2->VeKeMRBxEIiHlARL = v6;

    -[CoreTelephonyClient setDelegate:](v2->VeKeMRBxEIiHlARL, "setDelegate:", v2);
    -[FnfDbwO2lFcwJMJU OiM1BBSmKozL6ooU](v2, "OiM1BBSmKozL6ooU");
  }
  return v2;
}

- (id)N6iJbZh5ycxf9a3z
{
  return self->QSDcma8s0bThnyOF;
}

- (void)OiM1BBSmKozL6ooU
{
  FnfDbwO2lFcwJMJU *v2;
  NSString *QSDcma8s0bThnyOF;
  CoreTelephonyClient *VeKeMRBxEIiHlARL;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *v10;
  id v11;

  v2 = self;
  objc_sync_enter(v2);
  QSDcma8s0bThnyOF = v2->QSDcma8s0bThnyOF;
  v2->QSDcma8s0bThnyOF = 0;

  VeKeMRBxEIiHlARL = v2->VeKeMRBxEIiHlARL;
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient getActiveContexts:](VeKeMRBxEIiHlARL, "getActiveContexts:", &v11));
  v6 = v11;
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "voicePreferred"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "findForUuid:", v7));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "phoneNumber"));
      v10 = v2->QSDcma8s0bThnyOF;
      v2->QSDcma8s0bThnyOF = (NSString *)v9;

    }
  }

  objc_sync_exit(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->QSDcma8s0bThnyOF, 0);
  objc_storeStrong((id *)&self->VeKeMRBxEIiHlARL, 0);
  objc_storeStrong((id *)&self->gTBjgtWKPdOTHwT4, 0);
}

@end
