@implementation SUSUIUninitializedDownload

- (SUSUIUninitializedDownload)init
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Cannot invoke init method on SUDownloadUninitialized. Use initWithDescriptor: instead."), 0, a2, self));
}

- (SUSUIUninitializedDownload)initWithDescriptor:(id)a3
{
  SUSUIUninitializedDownload *v3;
  id v4;
  SUSUIUninitializedDownload *v6;
  SUSUIUninitializedDownload *v7;
  id v8;
  SUSUIUninitializedDownload *v9;
  id v10;
  objc_super v11;
  id location[2];
  SUSUIUninitializedDownload *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v13;
  v13 = 0;
  v11.receiver = v3;
  v11.super_class = (Class)SUSUIUninitializedDownload;
  v9 = -[SUDownload init](&v11, sel_init);
  v13 = v9;
  objc_storeStrong((id *)&v13, v9);
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BEAEC48]);
    objc_msgSend(v10, "setIsDone:", 0);
    objc_msgSend(v10, "setPhase:", *MEMORY[0x24BEAEE90]);
    -[SUDownload setProgress:](v13, "setProgress:", v10);
    -[SUDownload setDescriptor:](v13, "setDescriptor:", location[0]);
    v7 = v13;
    v4 = objc_alloc(MEMORY[0x24BEAEC18]);
    v8 = (id)objc_msgSend(v4, "initWithDescriptor:", location[0]);
    -[SUDownload setDownloadOptions:](v7, "setDownloadOptions:");

    objc_storeStrong(&v10, 0);
  }
  v6 = v13;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v6;
}

@end
