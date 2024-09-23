@implementation TMLApplication

+ (id)allocWithZone:(_NSZone *)a3
{
  double v3;

  objc_msgSend_sharedInstance(a1, a2, v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AD2A480;
  block[3] = &unk_24F4FD280;
  block[4] = a1;
  if (qword_255B51A70 != -1)
    dispatch_once(&qword_255B51A70, block);
  return (id)qword_255B51A68;
}

- (NSString)hardwareModel
{
  if (qword_255B51A80 != -1)
    dispatch_once(&qword_255B51A80, &unk_24F4FDDF0);
  return (NSString *)(id)qword_255B51A78;
}

- (NSString)applicationVersion
{
  if (qword_255B51A90 != -1)
    dispatch_once(&qword_255B51A90, &unk_24F4FDE10);
  return (NSString *)(id)qword_255B51A88;
}

@end
