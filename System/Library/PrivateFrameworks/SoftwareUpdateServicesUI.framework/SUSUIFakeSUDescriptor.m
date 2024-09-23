@implementation SUSUIFakeSUDescriptor

- (SUSUIFakeSUDescriptor)init
{
  id v2;
  void **v3;
  void *v4;
  id v5;
  void **v6;
  void *v7;
  SUSUIFakeSUDescriptor *v9;
  id v10;
  id v11;
  SUSUIFakeSUDescriptor *v12;
  objc_super v13;
  SEL v14;
  SUSUIFakeSUDescriptor *v15;

  v14 = a2;
  v15 = 0;
  v13.receiver = self;
  v13.super_class = (Class)SUSUIFakeSUDescriptor;
  v12 = -[SUDescriptor init](&v13, sel_init);
  v15 = v12;
  objc_storeStrong((id *)&v15, v12);
  if (v12)
  {
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAECA0]) = 1;
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAECC0]) = 1;
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAECD0]) = 1;
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAECB8]) = 0;
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED70]) = 0;
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED78]), 0);
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAECB0]) = 1;
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAECA8]) = 0;
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED38]), 0);
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED40]), 0);
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAEC90]), 0);
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAECE0]) = 0;
    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAEC98]) = 0;
    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED30]) = 0;
    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED90]) = 0;
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED60]) = 0;
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAECF8]) = 0;
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAECE8]), CFSTR("FakeOS 17.0"));
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED00]) = 0;
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED20]), 0);
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED18]), 0);
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED08]) = 0;
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED10]) = 0;
    *((_BYTE *)&v15->super.super.isa + (int)*MEMORY[0x24BEAECD8]) = 0;
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED68]), CFSTR("FakeApple"));
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED50]), CFSTR("FakeOS"));
    v10 = (id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v2 = (id)objc_msgSend(v10, "systemVersion");
    v3 = (void **)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED58]);
    v4 = *v3;
    *v3 = v2;

    v11 = (id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v5 = (id)objc_msgSend(v11, "buildVersion");
    v6 = (void **)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED48]);
    v7 = *v6;
    *v6 = v5;

    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAECC8]) = (Class)26214400;
    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAECF0]) = (Class)26214400;
    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED80]) = (Class)5242880;
    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED28]) = (Class)5242880;
    *(_DWORD *)((char *)&v15->super.super.isa + (int)*MEMORY[0x24BEAED88]) = 1;
  }
  v9 = v15;
  objc_storeStrong((id *)&v15, 0);
  return v9;
}

- (id)fakeDocumentation
{
  return objc_alloc_init(SUSUIFakeDocumentation);
}

@end
