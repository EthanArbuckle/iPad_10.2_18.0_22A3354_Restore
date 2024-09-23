@implementation SBMirroredDisplayControllerProvider

- (SBMirroredDisplayControllerProvider)initWithExternalDisplayDefaults:(id)a3
{
  id v5;
  SBMirroredDisplayControllerProvider *v6;
  SBMirroredDisplayControllerProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBMirroredDisplayControllerProvider;
  v6 = -[SBMirroredDisplayControllerProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_externalDisplayDefaults, a3);

  return v7;
}

- (id)displayControllerInfoForConnectingDisplay:(id)a3 configuration:(id)a4
{
  SBMirroredDisplayController *v5;
  SBDisplayControllerInfo *v6;

  if (objc_msgSend(a3, "_sb_requiresBaselineController"))
  {
    v5 = -[SBMirroredDisplayController initWithExternalDisplayDefaults:]([SBMirroredDisplayController alloc], "initWithExternalDisplayDefaults:", self->_externalDisplayDefaults);
    v6 = -[SBDisplayControllerInfo initWithController:windowingMode:priorityLevel:deactivationReasons:]([SBDisplayControllerInfo alloc], "initWithController:windowingMode:priorityLevel:deactivationReasons:", v5, 0, 1, 0);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDisplayDefaults, 0);
}

@end
