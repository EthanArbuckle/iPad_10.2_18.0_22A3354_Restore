@implementation DMDConfigurationCapabilities

+ (id)supportedCommandTypes
{
  if (qword_1000EB7B0 != -1)
    dispatch_once(&qword_1000EB7B0, &stru_1000BA618);
  return (id)qword_1000EB7A8;
}

+ (id)supportedDeclarationTypes
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027034;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB7C0 != -1)
    dispatch_once(&qword_1000EB7C0, block);
  return (id)qword_1000EB7B8;
}

+ (id)supportedAssetTypes
{
  if (qword_1000EB7D0 != -1)
    dispatch_once(&qword_1000EB7D0, &stru_1000BA658);
  return (id)qword_1000EB7C8;
}

+ (id)supportedConfigurationTypes
{
  if (qword_1000EB7E0 != -1)
    dispatch_once(&qword_1000EB7E0, &stru_1000BA678);
  return (id)qword_1000EB7D8;
}

+ (id)supportedEventTypes
{
  if (qword_1000EB7F0 != -1)
    dispatch_once(&qword_1000EB7F0, &stru_1000BA698);
  return (id)qword_1000EB7E8;
}

+ (id)supportedActivationTypes
{
  if (qword_1000EB800 != -1)
    dispatch_once(&qword_1000EB800, &stru_1000BA6B8);
  return (id)qword_1000EB7F8;
}

+ (id)supportedPredicateTypes
{
  if (qword_1000EB810 != -1)
    dispatch_once(&qword_1000EB810, &stru_1000BA6D8);
  return (id)qword_1000EB808;
}

+ (id)supportedMessageTypes
{
  if (qword_1000EB820 != -1)
    dispatch_once(&qword_1000EB820, &stru_1000BA6F8);
  return (id)qword_1000EB818;
}

@end
