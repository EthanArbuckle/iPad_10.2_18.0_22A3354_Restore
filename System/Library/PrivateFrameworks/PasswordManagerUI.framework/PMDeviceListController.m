@implementation PMDeviceListController

+ (id)makeUIViewControllerWithDeviceSharingAvailability:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v4 = objc_allocWithZone(MEMORY[0x24BEBDB08]);
  v5 = a3;
  v6 = objc_msgSend(v4, sel_init);
  v7 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2572B9C88));
  v8 = v5;
  v9 = (void *)sub_24384E524();
  objc_msgSend(v6, sel_setView_, v9);

  return v6;
}

- (PMDeviceListController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PMDeviceListController;
  return -[PMDeviceListController init](&v3, sel_init);
}

@end
