@implementation WFWAPICertificatePromptOperation

- (WFWAPICertificatePromptOperation)initWithRootViewController:(id)a3 network:(id)a4
{
  id v7;
  id v8;
  WFWAPICertificatePromptOperation *v9;
  WFWAPICertificatePromptOperation *v10;
  WFNetworkScanRecord *v11;
  void *network;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFWAPICertificatePromptOperation;
  v9 = -[WFWAPICertificatePromptOperation init](&v14, sel_init);
  v10 = v9;
  if (!v7)
    goto LABEL_6;
  if (!v9)
  {
    network = 0;
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v9->_rootViewController, a3);
  if (v8)
  {
    v11 = (WFNetworkScanRecord *)v8;
    network = v10->_network;
    v10->_network = v11;
  }
  else
  {
LABEL_6:
    network = v10;
    v10 = 0;
  }
LABEL_5:

  return v10;
}

- (void)finish
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFWAPICertificatePromptOperation;
  -[WFOperation finish](&v4, sel_finish);
  -[WFWAPICertificatePromptOperation rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id obj;
  CFArrayRef v13;
  CFArrayRef theArray;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WFWAPICertificatePromptOperation;
  -[WFOperation start](&v15, sel_start);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2988]), "initWithOtherNetworkStyle:", 2);
  -[WFWAPICertificatePromptOperation network](self, "network");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNetworkName:", v5);

  objc_msgSend(v3, "setDelegate:", self);
  theArray = 0;
  if (!WFWAPIRootCertificateListCreate((CFTypeRef *)&theArray) && CFArrayGetCount(theArray))
    objc_msgSend(v3, "setWAPIRootCertificates:", theArray);
  if (theArray)
  {
    CFRelease(theArray);
    theArray = 0;
  }
  obj = 0;
  v13 = 0;
  if (!WFWAPIIdentityListCreate(&v13, (__CFArray **)&obj) && CFArrayGetCount(v13))
  {
    objc_msgSend(v3, "setWAPIIdentities:", v13);
    objc_storeStrong((id *)&self->_wapiIdentityMapping, obj);
  }
  -[WFWAPICertificatePromptOperation setPromptViewController:](self, "setPromptViewController:", v3);
  v6 = objc_alloc(MEMORY[0x24BDF6BF8]);
  -[WFWAPICertificatePromptOperation promptViewController](self, "promptViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRootViewController:", v7);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == 1)
    objc_msgSend(v8, "setModalPresentationStyle:", 2);
  -[WFWAPICertificatePromptOperation rootViewController](self, "rootViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v8, 1, 0);

  -[WFWAPICertificatePromptOperation setNavigationController:](self, "setNavigationController:", v8);
}

- (void)otherNetworkViewControllerUserDidTapCancel:(id)a3
{
  -[WFWAPICertificatePromptOperation setUserCancelled:](self, "setUserCancelled:", 1);
  -[WFWAPICertificatePromptOperation finish](self, "finish");
}

- (void)otherNetworkViewControllerUserDidTapJoin:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_wapiIdentityMapping;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = (const void *)objc_msgSend(v10, "valueForKey:", CFSTR("certRef"), (_QWORD)v15);
        objc_msgSend(v4, "WAPIIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = CFEqual(v11, v12);

        if ((_DWORD)v11)
        {
          objc_msgSend(v10, "valueForKey:", CFSTR("pemData"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWAPICertificatePromptOperation setWAPIIdentityPEMBlob:](self, "setWAPIIdentityPEMBlob:", v13);

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "WAPIRootCertificate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWAPICertificatePromptOperation setWAPIRootCertificate:](self, "setWAPIRootCertificate:", v14);

  -[WFWAPICertificatePromptOperation finish](self, "finish");
}

- (BOOL)otherNetworkViewController:(id)a3 isValidPassword:(id)a4
{
  return 1;
}

- (BOOL)userCancelled
{
  return self->_userCancelled;
}

- (void)setUserCancelled:(BOOL)a3
{
  self->_userCancelled = a3;
}

- (__SecIdentity)WAPIRootCertificate
{
  return self->_WAPIRootCertificate;
}

- (void)setWAPIRootCertificate:(__SecIdentity *)a3
{
  self->_WAPIRootCertificate = a3;
}

- (NSData)WAPIIdentityPEMBlob
{
  return self->_WAPIIdentityPEMBlob;
}

- (void)setWAPIIdentityPEMBlob:(id)a3
{
  objc_storeStrong((id *)&self->_WAPIIdentityPEMBlob, a3);
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (WFOtherNetworkViewController)promptViewController
{
  return self->_promptViewController;
}

- (void)setPromptViewController:(id)a3
{
  objc_storeStrong((id *)&self->_promptViewController, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (NSArray)wapiIdentityMapping
{
  return self->_wapiIdentityMapping;
}

- (void)setWapiIdentityMapping:(id)a3
{
  objc_storeStrong((id *)&self->_wapiIdentityMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wapiIdentityMapping, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_promptViewController, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_WAPIIdentityPEMBlob, 0);
}

@end
